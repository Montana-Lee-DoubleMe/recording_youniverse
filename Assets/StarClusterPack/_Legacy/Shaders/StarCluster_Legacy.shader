// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "StarClusterPack/StarCluster_Legacy"
{
	Properties
	{
		[Toggle]_LinearWorkflow("LinearWorkflow", Range( 0 , 1)) = 1
		[Toggle(_PERPARTICLEORIENTATION_ON)] _PerParticleOrientation("PerParticleOrientation", Float) = 0
		_Shape("Shape", 2D) = "white" {}
		_ColorTex("Color", 2D) = "white" {}
		_Size("Size", 2D) = "white" {}
		[Toggle]_Use_ProceduralShape("Use_ProceduralShape", Float) = 0
		_ProceduralShape_Iterations("ProceduralShape_Iterations", Float) = 10
		_ProceduralShape_OutExp("ProceduralShape_OutExp", Float) = 1
		_ProceduralShape_IterExp("ProceduralShape_IterExp", Float) = 2
		_Color_Tint("Color_Tint", Color) = (1,1,1,1)
		_Color_Multiplier("Color_Multiplier", Float) = 1
		_Color_Gamma("Color_Gamma", Color) = (1,1,1,1)
		_Color_Saturation("Color_Saturation", Float) = 1
		_Size_Multiplier("Size_Multiplier", Float) = 1
		_Variation_Shift("Variation_Shift", Float) = 0
		[Toggle(_USE_CAMERA_POSITION_ON)] _Use_Camera_Position("Use_Camera_Position", Float) = 0
		_Camera_Position("Camera_Position", Vector) = (0,0,0,0)
		[Toggle(_USE_ATTENUATION_ON)] _Use_Attenuation("Use_Attenuation", Float) = 0
		_Attenuation_Strength("Attenuation_Strength", Float) = 1
		_Attenuation_Exponent("Attenuation_Exponent", Float) = 0.8
		[Toggle]_Use_LensEffect("Use_LensEffect", Float) = 0
		_LensEffect("LensEffect", 2D) = "white" {}
		_LensEffect_Distance("LensEffect_Distance", Float) = 1
		_LensEffect_DistanceExponent("LensEffect_DistanceExponent", Float) = 3
		[Toggle(_USE_TWINKLE_ON)] _Use_Twinkle("Use_Twinkle", Float) = 0
		_Twinkle_Ramp("Twinkle_Ramp", 2D) = "white" {}
		_Twinkle_Speed("Twinkle_Speed", Float) = 1
		_Twinkle_Strength("Twinkle_Strength", Float) = 1
		_Minimum_Screen_Size("Minimum_Screen_Size", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}

	}
	
	SubShader
	{
		
		
		Tags { "RenderType"="Opaque" }
	LOD 100

		CGINCLUDE
		#pragma target 3.0
		ENDCG
		Blend One One
		Cull Back
		ColorMask RGBA
		ZWrite Off
		ZTest LEqual
		Offset 0 , 0
		
		
		
		Pass
		{
			Name "Unlit"
			Tags { "LightMode"="ForwardBase" }
			CGPROGRAM

			

			#ifndef UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX
			//only defining to not throw compilation error over Unity 5.5
			#define UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input)
			#endif
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_instancing
			#include "UnityCG.cginc"
			#include "UnityShaderVariables.cginc"
			#define ASE_NEEDS_VERT_COLOR
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature _PERPARTICLEORIENTATION_ON
			#pragma shader_feature _USE_CAMERA_POSITION_ON
			#pragma shader_feature _USE_ATTENUATION_ON
			#pragma shader_feature _USE_TWINKLE_ON


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				float4 ase_texcoord : TEXCOORD0;
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 worldPos : TEXCOORD0;
#endif
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				float4 ase_color : COLOR;
				float4 ase_texcoord1 : TEXCOORD1;
			};

			uniform float3 _Camera_Position;
			uniform float _Attenuation_Strength;
			uniform float _Attenuation_Exponent;
			uniform float _LensEffect_Distance;
			uniform float _LensEffect_DistanceExponent;
			uniform float _Use_LensEffect;
			uniform float _Size_Multiplier;
			uniform sampler2D _Size;
			uniform float _Variation_Shift;
			uniform float _LinearWorkflow;
			uniform sampler2D _Shape;
			uniform float4 _Shape_ST;
			uniform float _ProceduralShape_IterExp;
			uniform float _ProceduralShape_Iterations;
			uniform float _ProceduralShape_OutExp;
			uniform float _Use_ProceduralShape;
			uniform float _Minimum_Screen_Size;
			uniform sampler2D _Twinkle_Ramp;
			uniform float _Twinkle_Speed;
			uniform float _Twinkle_Strength;
			uniform sampler2D _ColorTex;
			uniform float4 _Color_Tint;
			uniform float _Color_Multiplier;
			uniform sampler2D _LensEffect;
			uniform float4 _Color_Gamma;
			uniform float _Color_Saturation;
			float Exponentglow212_g15( float ramp , float size_exp , float mult_exp , int MaxIter )
			{
				int i = 1;
				float value = 0;
				float v01 = 0;
				float v02 = 0;
				float v03 = 0;
				while (i < MaxIter)
				{
				    v01 = MaxIter/(i+1);
				    v02 = pow(ramp, pow(size_exp, v01));
				    v03 = v02/pow((i+1), mult_exp);
				    value += v03;
				    i+=1;
				}
				return value;
			}
			
			float3 HSVToRGB( float3 c )
			{
				float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
				float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
				return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
			}
			
			float3 RGBToHSV(float3 c)
			{
				float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
				float4 p = lerp( float4( c.bg, K.wz ), float4( c.gb, K.xy ), step( c.b, c.g ) );
				float4 q = lerp( float4( p.xyw, c.r ), float4( c.r, p.yzx ), step( p.x, c.r ) );
				float d = q.x - min( q.w, q.y );
				float e = 1.0e-10;
				return float3( abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
			}

			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				float2 uv062_g15 = v.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 break63_g15 = ( uv062_g15 - float2( 0.5,0.5 ) );
				float3 ase_worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				float3 ase_worldViewDir = UnityWorldSpaceViewDir(ase_worldPos);
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult12_g15 = normalize( ( ase_worldPos - _Camera_Position ) );
				#ifdef _USE_CAMERA_POSITION_ON
				float3 staticSwitch14_g15 = normalizeResult12_g15;
				#else
				float3 staticSwitch14_g15 = ase_worldViewDir;
				#endif
				float3 temp_output_17_0_g15 = mul( float4( staticSwitch14_g15 , 0.0 ), unity_ObjectToWorld ).xyz;
				float3 temp_output_21_0_g15 = cross( float3(0,1,0) , temp_output_17_0_g15 );
				float3 normalizeResult23_g15 = normalize( cross( temp_output_21_0_g15 , temp_output_17_0_g15 ) );
				float2 uv05_g15 = v.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 break18_g15 = ( uv05_g15 - float2( 0.5,0.5 ) );
				float3 normalizeResult24_g15 = normalize( temp_output_21_0_g15 );
				#ifdef _PERPARTICLEORIENTATION_ON
				float3 staticSwitch38_g15 = ( ( normalizeResult23_g15 * break18_g15.y ) + ( normalizeResult24_g15 * break18_g15.x * -1.0 ) );
				#else
				float3 staticSwitch38_g15 = ( ( mul( float4( float3(1,0,0) , 0.0 ), UNITY_MATRIX_MVP ).xyz * break63_g15.x ) + ( mul( float4( float3(0,1,0) , 0.0 ), UNITY_MATRIX_MVP ).xyz * break63_g15.y ) );
				#endif
				float3 normalizeResult29_g15 = normalize( staticSwitch38_g15 );
				float clampResult89_g15 = clamp( _Attenuation_Strength , 0.0 , 100.0 );
				float clampResult254_g15 = clamp( ( length( ( ase_worldPos - _WorldSpaceCameraPos ) ) * 50.0 * clampResult89_g15 ) , 0.0 , 1.0 );
				float clampResult90_g15 = clamp( _Attenuation_Exponent , 0.0 , 100.0 );
				#ifdef _USE_ATTENUATION_ON
				float staticSwitch43_g15 = ( 1.0 * ( 1.0 / pow( clampResult254_g15 , clampResult90_g15 ) ) );
				#else
				float staticSwitch43_g15 = 1.0;
				#endif
				float clampResult87_g15 = clamp( _LensEffect_Distance , 0.0 , 100.0 );
				float clampResult83_g15 = clamp( ( clampResult87_g15 - length( ( ase_worldPos - _WorldSpaceCameraPos ) ) ) , 0.0 , clampResult87_g15 );
				float clampResult88_g15 = clamp( _LensEffect_DistanceExponent , 0.0 , 100.0 );
				float temp_output_85_0_g15 = pow( clampResult83_g15 , clampResult88_g15 );
				float lerpResult72_g15 = lerp( staticSwitch43_g15 , ( staticSwitch43_g15 * ( temp_output_85_0_g15 + 1.0 ) ) , _Use_LensEffect);
				float temp_output_104_0_g15 = ( _Variation_Shift / 100.0 );
				float4 appendResult98_g15 = (float4(( v.color.g + temp_output_104_0_g15 ) , 0.0 , 0.0 , 0.0));
				float4 tex2DNode97_g15 = tex2Dlod( _Size, float4( appendResult98_g15.xy, 0, 0.0) );
				float3 linearToGamma267_g15 = LinearToGammaSpace( tex2DNode97_g15.rgb );
				float4 lerpResult268_g15 = lerp( tex2DNode97_g15 , float4( linearToGamma267_g15 , 0.0 ) , _LinearWorkflow);
				float2 uv_Shape = v.ase_texcoord.xy * _Shape_ST.xy + _Shape_ST.zw;
				float4 tex2DNode204_g15 = tex2Dlod( _Shape, float4( uv_Shape, 0, 0.0) );
				float3 linearToGamma266_g15 = LinearToGammaSpace( tex2DNode204_g15.rgb );
				float4 lerpResult265_g15 = lerp( tex2DNode204_g15 , float4( linearToGamma266_g15 , 0.0 ) , _LinearWorkflow);
				float2 uv0213_g15 = v.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_cast_16 = (0.5).xx;
				float ramp212_g15 = ( 1.0 - ( length( ( uv0213_g15 - temp_cast_16 ) ) * 2.0 ) );
				float size_exp212_g15 = _ProceduralShape_IterExp;
				float mult_exp212_g15 = 1.0;
				int MaxIter212_g15 = (int)round( _ProceduralShape_Iterations );
				float localExponentglow212_g15 = Exponentglow212_g15( ramp212_g15 , size_exp212_g15 , mult_exp212_g15 , MaxIter212_g15 );
				float clampResult255_g15 = clamp( localExponentglow212_g15 , 0.0 , 1.0 );
				float4 appendResult207_g15 = (float4(pow( clampResult255_g15 , _ProceduralShape_OutExp ) , 0.0 , 1.0 , 0.0));
				float4 lerpResult198_g15 = lerp( lerpResult265_g15 , appendResult207_g15 , _Use_ProceduralShape);
				float4 break152_g15 = lerpResult198_g15;
				float4 appendResult123_g15 = (float4(( v.color.g + ( _Time.y * _Twinkle_Speed * 0.1 ) ) , 0.5 , 0.0 , 0.0));
				float4 tex2DNode125_g15 = tex2Dlod( _Twinkle_Ramp, float4( appendResult123_g15.xy, 0, 0.0) );
				#ifdef _USE_TWINKLE_ON
				float staticSwitch132_g15 = ( ( ( tex2DNode125_g15.r - 0.5 ) * _Twinkle_Strength ) + 1.0 );
				#else
				float staticSwitch132_g15 = 1.0;
				#endif
				
				o.ase_color = v.color;
				o.ase_texcoord1.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.zw = 0;
				float3 vertexValue = float3(0, 0, 0);
				#if ASE_ABSOLUTE_VERTEX_POS
				vertexValue = v.vertex.xyz;
				#endif
				vertexValue = ( ( normalizeResult29_g15 * max( ( lerpResult72_g15 * 0.1 * _Size_Multiplier * lerpResult268_g15.r * ( break152_g15.z * 2.5 ) ) , ( length( ( ase_worldPos - _WorldSpaceCameraPos ) ) * _Minimum_Screen_Size * 0.002 ) ) ) * staticSwitch132_g15 );
				#if ASE_ABSOLUTE_VERTEX_POS
				v.vertex.xyz = vertexValue;
				#else
				v.vertex.xyz += vertexValue;
				#endif
				o.vertex = UnityObjectToClipPos(v.vertex);

#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
#endif
				return o;
			}
			
			fixed4 frag (v2f i ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(i);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
				fixed4 finalColor;
#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 WorldPosition = i.worldPos;
#endif
				float temp_output_104_0_g15 = ( _Variation_Shift / 100.0 );
				float4 appendResult182_g15 = (float4(( i.ase_color.g + temp_output_104_0_g15 ) , 0.0 , 0.0 , 0.0));
				float4 tex2DNode175_g15 = tex2D( _ColorTex, appendResult182_g15.xy );
				float3 linearToGamma270_g15 = LinearToGammaSpace( tex2DNode175_g15.rgb );
				float4 lerpResult271_g15 = lerp( tex2DNode175_g15 , float4( linearToGamma270_g15 , 0.0 ) , _LinearWorkflow);
				float3 linearToGamma278_g15 = LinearToGammaSpace( _Color_Tint.rgb );
				float4 lerpResult277_g15 = lerp( _Color_Tint , float4( linearToGamma278_g15 , 0.0 ) , _LinearWorkflow);
				float2 uv_Shape = i.ase_texcoord1.xy * _Shape_ST.xy + _Shape_ST.zw;
				float4 tex2DNode204_g15 = tex2D( _Shape, uv_Shape );
				float lerpResult201_g15 = lerp( tex2DNode204_g15.a , 0.2 , _Use_ProceduralShape);
				float3 linearToGamma266_g15 = LinearToGammaSpace( tex2DNode204_g15.rgb );
				float4 lerpResult265_g15 = lerp( tex2DNode204_g15 , float4( linearToGamma266_g15 , 0.0 ) , _LinearWorkflow);
				float2 uv0213_g15 = i.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_cast_11 = (0.5).xx;
				float ramp212_g15 = ( 1.0 - ( length( ( uv0213_g15 - temp_cast_11 ) ) * 2.0 ) );
				float size_exp212_g15 = _ProceduralShape_IterExp;
				float mult_exp212_g15 = 1.0;
				int MaxIter212_g15 = (int)round( _ProceduralShape_Iterations );
				float localExponentglow212_g15 = Exponentglow212_g15( ramp212_g15 , size_exp212_g15 , mult_exp212_g15 , MaxIter212_g15 );
				float clampResult255_g15 = clamp( localExponentglow212_g15 , 0.0 , 1.0 );
				float4 appendResult207_g15 = (float4(pow( clampResult255_g15 , _ProceduralShape_OutExp ) , 0.0 , 1.0 , 0.0));
				float4 lerpResult198_g15 = lerp( lerpResult265_g15 , appendResult207_g15 , _Use_ProceduralShape);
				float4 break152_g15 = lerpResult198_g15;
				float4 temp_output_141_0_g15 = ( ( lerpResult271_g15 * lerpResult277_g15 * _Color_Tint.a * ( 5.0 * lerpResult201_g15 ) * _Color_Multiplier ) * ( break152_g15.x + ( break152_g15.y * 10.0 ) ) );
				float2 uv0193_g15 = i.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float4 tex2DNode190_g15 = tex2D( _LensEffect, uv0193_g15 );
				float3 linearToGamma272_g15 = LinearToGammaSpace( tex2DNode190_g15.rgb );
				float4 lerpResult273_g15 = lerp( tex2DNode190_g15 , float4( linearToGamma272_g15 , 0.0 ) , _LinearWorkflow);
				float4 break274_g15 = lerpResult273_g15;
				float clampResult87_g15 = clamp( _LensEffect_Distance , 0.0 , 100.0 );
				float clampResult83_g15 = clamp( ( clampResult87_g15 - length( ( WorldPosition - _WorldSpaceCameraPos ) ) ) , 0.0 , clampResult87_g15 );
				float clampResult88_g15 = clamp( _LensEffect_DistanceExponent , 0.0 , 100.0 );
				float temp_output_85_0_g15 = pow( clampResult83_g15 , clampResult88_g15 );
				float clampResult143_g15 = clamp( temp_output_85_0_g15 , 0.0 , 1.0 );
				float4 lerpResult139_g15 = lerp( temp_output_141_0_g15 , ( ( lerpResult271_g15 * lerpResult277_g15 * _Color_Tint.a * ( 5.0 * lerpResult201_g15 ) * _Color_Multiplier ) * ( break274_g15.r + ( break274_g15.g * 0.5 ) + ( break274_g15.b * 3.0 ) ) ) , clampResult143_g15);
				float4 lerpResult137_g15 = lerp( temp_output_141_0_g15 , lerpResult139_g15 , _Use_LensEffect);
				float4 appendResult123_g15 = (float4(( i.ase_color.g + ( _Time.y * _Twinkle_Speed * 0.1 ) ) , 0.5 , 0.0 , 0.0));
				float4 tex2DNode125_g15 = tex2D( _Twinkle_Ramp, appendResult123_g15.xy );
				#ifdef _USE_TWINKLE_ON
				float staticSwitch132_g15 = ( ( ( tex2DNode125_g15.r - 0.5 ) * _Twinkle_Strength ) + 1.0 );
				#else
				float staticSwitch132_g15 = 1.0;
				#endif
				float4 temp_cast_17 = (0.0).xxxx;
				float4 temp_cast_18 = (100.0).xxxx;
				float4 clampResult109_g15 = clamp( ( lerpResult137_g15 * staticSwitch132_g15 ) , temp_cast_17 , temp_cast_18 );
				float4 break231_g15 = clampResult109_g15;
				float clampResult256_g15 = clamp( break231_g15.r , 0.0 , 1.0 );
				float clampResult257_g15 = clamp( break231_g15.g , 0.0 , 1.0 );
				float clampResult258_g15 = clamp( break231_g15.b , 0.0 , 1.0 );
				float4 appendResult240_g15 = (float4(pow( clampResult256_g15 , ( 1.0 / _Color_Gamma.r ) ) , pow( clampResult257_g15 , ( 1.0 / _Color_Gamma.g ) ) , pow( clampResult258_g15 , ( 1.0 / _Color_Gamma.b ) ) , 0.0));
				float3 hsvTorgb250_g15 = RGBToHSV( appendResult240_g15.xyz );
				float3 hsvTorgb251_g15 = HSVToRGB( float3(hsvTorgb250_g15.x,( hsvTorgb250_g15.y * _Color_Saturation ),hsvTorgb250_g15.z) );
				float3 gammaToLinear283_g15 = GammaToLinearSpace( hsvTorgb251_g15 );
				float3 lerpResult286_g15 = lerp( hsvTorgb251_g15 , ( gammaToLinear283_g15 * 4.0 ) , _LinearWorkflow);
				
				
				finalColor = float4( lerpResult286_g15 , 0.0 );
				return finalColor;
			}
			ENDCG
		}
	}
	CustomEditor "ASEMaterialInspector"
	
	
}
/*ASEBEGIN
Version=18100
2560;245;1919;1005;1602.737;578.9768;1;True;True
Node;AmplifyShaderEditor.FunctionNode;162;-1022.4,-127.7;Inherit;False;StarCluster_AmplifyShaderFunction;0;;15;7ac8d45e9b71a274ebee5f7461282171;0;0;2;FLOAT3;0;FLOAT3;1
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;0;-535.9283,-123.5087;Float;False;True;-1;2;ASEMaterialInspector;100;1;StarClusterPack/StarCluster_Legacy;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;2;True;4;1;False;-1;1;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;True;False;True;0;False;-1;True;True;True;True;True;0;False;-1;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;2;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;1;RenderType=Opaque=RenderType;True;2;0;False;False;False;False;False;False;False;False;False;True;1;LightMode=ForwardBase;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;1;True;False;;0
WireConnection;0;0;162;0
WireConnection;0;1;162;1
ASEEND*/
//CHKSM=228D15B76ABF6DDDD1F593050EFFA60EF9CC0EC3