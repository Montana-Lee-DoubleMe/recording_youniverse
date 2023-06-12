// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "StarClusterPack/StarCluster_HDRP"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
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

		[HideInInspector]_RenderQueueType("Render Queue Type", Float) = 6
		[HideInInspector][ToggleUI]_AddPrecomputedVelocity("Add Precomputed Velocity", Float) = 1
		//[HideInInspector]_ShadowMatteFilter("Shadow Matte Filter", Float) = 2
		[HideInInspector]_StencilRef("Stencil Ref", Int) = 0
		[HideInInspector]_StencilWriteMask("StencilWrite Mask", Int) = 6
		[HideInInspector]_StencilRefDepth("StencilRefDepth", Int) = 0
		[HideInInspector]_StencilWriteMaskDepth("_StencilWriteMaskDepth", Int) = 8
		[HideInInspector]_StencilRefMV("_StencilRefMV", Int) = 32
		[HideInInspector]_StencilWriteMaskMV("_StencilWriteMaskMV", Int) = 40
		[HideInInspector]_StencilRefDistortionVec("_StencilRefDistortionVec", Int) = 4
		[HideInInspector]_StencilWriteMaskDistortionVec("_StencilWriteMaskDistortionVec", Int) = 4
		[HideInInspector]_StencilWriteMaskGBuffer("_StencilWriteMaskGBuffer", Int) = 14
		[HideInInspector]_StencilRefGBuffer("_StencilRefGBuffer", Int) = 2
		[HideInInspector]_ZTestGBuffer("_ZTestGBuffer", Int) = 4
		[HideInInspector][ToggleUI]_RequireSplitLighting("_RequireSplitLighting", Float) = 0
		[HideInInspector][ToggleUI]_ReceivesSSR("_ReceivesSSR", Float) = 0
		[HideInInspector]_SurfaceType("_SurfaceType", Float) = 1
		[HideInInspector]_BlendMode("_BlendMode", Float) = 1
		[HideInInspector]_SrcBlend("_SrcBlend", Float) = 1
		[HideInInspector]_DstBlend("_DstBlend", Float) = 0
		[HideInInspector]_AlphaSrcBlend("Vec_AlphaSrcBlendtor1", Float) = 1
		[HideInInspector]_AlphaDstBlend("_AlphaDstBlend", Float) = 0
		[HideInInspector][ToggleUI]_ZWrite("_ZWrite", Float) = 0
		[HideInInspector][ToggleUI]_TransparentZWrite("_TransparentZWrite", Float) = 1
		[HideInInspector]_CullMode("Cull Mode", Float) = 2
		[HideInInspector]_TransparentSortPriority("_TransparentSortPriority", Int) = 0
		[HideInInspector][ToggleUI]_EnableFogOnTransparent("_EnableFogOnTransparent", Float) = 1
		[HideInInspector]_CullModeForward("_CullModeForward", Float) = 2
		[HideInInspector][Enum(Front, 1, Back, 2)]_TransparentCullMode("_TransparentCullMode", Float) = 2
		[HideInInspector]_ZTestDepthEqualForOpaque("_ZTestDepthEqualForOpaque", Int) = 4
		[HideInInspector][Enum(UnityEngine.Rendering.CompareFunction)]_ZTestTransparent("_ZTestTransparent", Float) = 4
		[HideInInspector][ToggleUI]_TransparentBackfaceEnable("_TransparentBackfaceEnable", Float) = 0
		[HideInInspector][ToggleUI]_AlphaCutoffEnable("_AlphaCutoffEnable", Float) = 0
		[HideInInspector][ToggleUI]_UseShadowThreshold("_UseShadowThreshold", Float) = 0
		[HideInInspector][ToggleUI]_DoubleSidedEnable("_DoubleSidedEnable", Float) = 0
		[HideInInspector][Enum(Flip, 0, Mirror, 1, None, 2)]_DoubleSidedNormalMode("_DoubleSidedNormalMode", Float) = 2
		[HideInInspector]_DoubleSidedConstants("_DoubleSidedConstants", Vector) = (1, 1, -1, 0)
		[HideInInspector]_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		[HideInInspector]_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		[HideInInspector]_TessMin( "Tess Min Distance", Float ) = 10
		[HideInInspector]_TessMax( "Tess Max Distance", Float ) = 25
		[HideInInspector]_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		[HideInInspector]_TessMaxDisp( "Tess Max Displacement", Float ) = 25
	}

	SubShader
	{
		LOD 0

		
		Tags { "RenderPipeline"="HDRenderPipeline" "RenderType"="Opaque" "Queue"="Transparent+400" }

		HLSLINCLUDE
		#pragma target 4.5
		#pragma only_renderers d3d11 ps4 xboxone vulkan metal switch
		#pragma instancing_options renderinglayer

		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}
		
		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlaneASE (float3 pos, float4 plane)
		{
			return dot (float4(pos,1.0f), plane);
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlaneASE(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlaneASE(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlaneASE(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlaneASE(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		ENDHLSL

		
		Pass
		{
			
			Name "Forward Unlit"
			Tags { "LightMode"="ForwardOnly" }

			Blend [_SrcBlend] [_DstBlend] , [_AlphaSrcBlend] [_AlphaDstBlend]
			Cull [_CullMode]
			ZTest [_ZTestTransparent]
			ZWrite [_ZWrite]

			Stencil
			{
				Ref [_StencilRef]
				WriteMask [_StencilWriteMask]
				Comp Always
				Pass Replace
				Fail Keep
				ZFail Keep
			}

			HLSLPROGRAM
			#pragma multi_compile_instancing
			#define HAVE_MESH_MODIFICATION 1
			#define ASE_SRP_VERSION 999999

			#define SHADERPASS SHADERPASS_FORWARD_UNLIT
			#pragma multi_compile _ DEBUG_DISPLAY

			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _ _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
			#pragma shader_feature_local _ALPHATEST_ON
			#pragma shader_feature_local _ENABLE_FOG_ON_TRANSPARENT

			#pragma vertex Vert
			#pragma fragment Frag

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"

			#if defined(_ENABLE_SHADOW_MATTE) && SHADERPASS == SHADERPASS_FORWARD_UNLIT
				#define LIGHTLOOP_DISABLE_TILE_AND_CLUSTER
				#define HAS_LIGHTLOOP
				#define SHADOW_OPTIMIZE_REGISTER_USAGE 1

				#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/CommonLighting.hlsl"
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/Shadow/HDShadowContext.hlsl"
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/HDShadow.hlsl"
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/LightLoopDef.hlsl"
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/PunctualLightCommon.hlsl"
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/HDShadowLoop.hlsl"
			#endif

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature _PERPARTICLEORIENTATION_ON
			#pragma shader_feature _USE_CAMERA_POSITION_ON
			#pragma shader_feature _USE_ATTENUATION_ON
			#pragma shader_feature _USE_TWINKLE_ON


			struct VertexInput
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START( UnityPerMaterial )
			float4 _Color_Tint;
			float4 _Shape_ST;
			float4 _Color_Gamma;
			float3 _Camera_Position;
			float _Color_Multiplier;
			float _Twinkle_Strength;
			float _Twinkle_Speed;
			float _Minimum_Screen_Size;
			float _Use_ProceduralShape;
			float _ProceduralShape_OutExp;
			float _ProceduralShape_Iterations;
			float _ProceduralShape_IterExp;
			float _Variation_Shift;
			float _Size_Multiplier;
			float _Use_LensEffect;
			float _LensEffect_DistanceExponent;
			float _LensEffect_Distance;
			float _Attenuation_Exponent;
			float _Attenuation_Strength;
			float _LinearWorkflow;
			float _Color_Saturation;
			float4 _EmissionColor;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			#ifdef _ENABLE_SHADOW_MATTE
			float _ShadowMatteFilter;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _AlphaCutoff;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			float _TessPhongStrength;
			float _TessValue;
			float _TessMin;
			float _TessMax;
			float _TessEdgeLength;
			float _TessMaxDisp;
			CBUFFER_END
			sampler2D _Size;
			sampler2D _Shape;
			sampler2D _Twinkle_Ramp;
			sampler2D _ColorTex;
			sampler2D _LensEffect;


			float Exponentglow212_g2( float ramp , float size_exp , float mult_exp , int MaxIter )
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

			struct SurfaceDescription
			{
				float3 Color;
				float3 Emission;
				float4 ShadowTint;
				float Alpha;
				float AlphaClipThreshold;
			};

			void BuildSurfaceData(FragInputs fragInputs, SurfaceDescription surfaceDescription, float3 V, out SurfaceData surfaceData)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);
				surfaceData.color = surfaceDescription.Color;
			}

			void GetSurfaceAndBuiltinData(SurfaceDescription surfaceDescription , FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#if _ALPHATEST_ON
				DoAlphaTest ( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				BuildSurfaceData(fragInputs, surfaceDescription, V, surfaceData);

				#if defined(_ENABLE_SHADOW_MATTE) && SHADERPASS == SHADERPASS_FORWARD_UNLIT
					HDShadowContext shadowContext = InitShadowContext();
					float shadow;
					float3 shadow3;
					posInput = GetPositionInput(fragInputs.positionSS.xy, _ScreenSize.zw, fragInputs.positionSS.z, UNITY_MATRIX_I_VP, UNITY_MATRIX_V);
					float3 normalWS = normalize(fragInputs.tangentToWorld[1]);
					uint renderingLayers = _EnableLightLayers ? asuint(unity_RenderingLayer.x) : DEFAULT_LIGHT_LAYERS;
					ShadowLoopMin(shadowContext, posInput, normalWS, asuint(_ShadowMatteFilter), renderingLayers, shadow3);
					shadow = dot(shadow3, float3(1.0f/3.0f, 1.0f/3.0f, 1.0f/3.0f));

					float4 shadowColor = (1 - shadow)*surfaceDescription.ShadowTint.rgba;
					float  localAlpha  = saturate(shadowColor.a + surfaceDescription.Alpha);

					#ifdef _SURFACE_TYPE_TRANSPARENT
						surfaceData.color = lerp(shadowColor.rgb*surfaceData.color, lerp(lerp(shadowColor.rgb, surfaceData.color, 1 - surfaceDescription.ShadowTint.a), surfaceData.color, shadow), surfaceDescription.Alpha);
					#else
						surfaceData.color = lerp(lerp(shadowColor.rgb, surfaceData.color, 1 - surfaceDescription.ShadowTint.a), surfaceData.color, shadow);
					#endif
					localAlpha = ApplyBlendMode(surfaceData.color, localAlpha).a;
					surfaceDescription.Alpha = localAlpha;
				#endif

				ZERO_INITIALIZE(BuiltinData, builtinData);
				builtinData.opacity = surfaceDescription.Alpha;
				builtinData.emissiveColor = surfaceDescription.Emission;
			}

			VertexOutput VertexFunction( VertexInput inputMesh  )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float2 uv062_g2 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 break63_g2 = ( uv062_g2 - float2( 0.5,0.5 ) );
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult12_g2 = normalize( ( ase_worldPos - _Camera_Position ) );
				#ifdef _USE_CAMERA_POSITION_ON
				float3 staticSwitch14_g2 = normalizeResult12_g2;
				#else
				float3 staticSwitch14_g2 = ase_worldViewDir;
				#endif
				float3 temp_output_17_0_g2 = mul( float4( staticSwitch14_g2 , 0.0 ), GetObjectToWorldMatrix() ).xyz;
				float3 temp_output_21_0_g2 = cross( float3(0,1,0) , temp_output_17_0_g2 );
				float3 normalizeResult23_g2 = normalize( cross( temp_output_21_0_g2 , temp_output_17_0_g2 ) );
				float2 uv05_g2 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 break18_g2 = ( uv05_g2 - float2( 0.5,0.5 ) );
				float3 normalizeResult24_g2 = normalize( temp_output_21_0_g2 );
				#ifdef _PERPARTICLEORIENTATION_ON
				float3 staticSwitch38_g2 = ( ( normalizeResult23_g2 * break18_g2.y ) + ( normalizeResult24_g2 * break18_g2.x * -1.0 ) );
				#else
				float3 staticSwitch38_g2 = ( ( mul( float4( float3(1,0,0) , 0.0 ), mul(GetWorldToHClipMatrix(),GetObjectToWorldMatrix()) ).xyz * break63_g2.x ) + ( mul( float4( float3(0,1,0) , 0.0 ), mul(GetWorldToHClipMatrix(),GetObjectToWorldMatrix()) ).xyz * break63_g2.y ) );
				#endif
				float3 normalizeResult29_g2 = normalize( staticSwitch38_g2 );
				float clampResult89_g2 = clamp( _Attenuation_Strength , 0.0 , 100.0 );
				float clampResult254_g2 = clamp( ( length( ( ase_worldPos - _WorldSpaceCameraPos ) ) * 50.0 * clampResult89_g2 ) , 0.0 , 1.0 );
				float clampResult90_g2 = clamp( _Attenuation_Exponent , 0.0 , 100.0 );
				#ifdef _USE_ATTENUATION_ON
				float staticSwitch43_g2 = ( 1.0 * ( 1.0 / pow( clampResult254_g2 , clampResult90_g2 ) ) );
				#else
				float staticSwitch43_g2 = 1.0;
				#endif
				float clampResult87_g2 = clamp( _LensEffect_Distance , 0.0 , 100.0 );
				float clampResult83_g2 = clamp( ( clampResult87_g2 - length( ( ase_worldPos - _WorldSpaceCameraPos ) ) ) , 0.0 , clampResult87_g2 );
				float clampResult88_g2 = clamp( _LensEffect_DistanceExponent , 0.0 , 100.0 );
				float temp_output_85_0_g2 = pow( clampResult83_g2 , clampResult88_g2 );
				float lerpResult72_g2 = lerp( staticSwitch43_g2 , ( staticSwitch43_g2 * ( temp_output_85_0_g2 + 1.0 ) ) , _Use_LensEffect);
				float temp_output_104_0_g2 = ( _Variation_Shift / 100.0 );
				float4 appendResult98_g2 = (float4(( inputMesh.ase_color.g + temp_output_104_0_g2 ) , 0.0 , 0.0 , 0.0));
				float4 tex2DNode97_g2 = tex2Dlod( _Size, float4( appendResult98_g2.xy, 0, 0.0) );
				float3 linearToGamma267_g2 = FastLinearToSRGB( tex2DNode97_g2.rgb );
				float4 lerpResult268_g2 = lerp( tex2DNode97_g2 , float4( linearToGamma267_g2 , 0.0 ) , _LinearWorkflow);
				float2 uv_Shape = inputMesh.ase_texcoord.xy * _Shape_ST.xy + _Shape_ST.zw;
				float4 tex2DNode204_g2 = tex2Dlod( _Shape, float4( uv_Shape, 0, 0.0) );
				float3 linearToGamma266_g2 = FastLinearToSRGB( tex2DNode204_g2.rgb );
				float4 lerpResult265_g2 = lerp( tex2DNode204_g2 , float4( linearToGamma266_g2 , 0.0 ) , _LinearWorkflow);
				float2 uv0213_g2 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_cast_16 = (0.5).xx;
				float ramp212_g2 = ( 1.0 - ( length( ( uv0213_g2 - temp_cast_16 ) ) * 2.0 ) );
				float size_exp212_g2 = _ProceduralShape_IterExp;
				float mult_exp212_g2 = 1.0;
				int MaxIter212_g2 = (int)round( _ProceduralShape_Iterations );
				float localExponentglow212_g2 = Exponentglow212_g2( ramp212_g2 , size_exp212_g2 , mult_exp212_g2 , MaxIter212_g2 );
				float clampResult255_g2 = clamp( localExponentglow212_g2 , 0.0 , 1.0 );
				float4 appendResult207_g2 = (float4(pow( clampResult255_g2 , _ProceduralShape_OutExp ) , 0.0 , 1.0 , 0.0));
				float4 lerpResult198_g2 = lerp( lerpResult265_g2 , appendResult207_g2 , _Use_ProceduralShape);
				float4 break152_g2 = lerpResult198_g2;
				float4 appendResult123_g2 = (float4(( inputMesh.ase_color.g + ( _TimeParameters.x * _Twinkle_Speed * 0.1 ) ) , 0.5 , 0.0 , 0.0));
				float4 tex2DNode125_g2 = tex2Dlod( _Twinkle_Ramp, float4( appendResult123_g2.xy, 0, 0.0) );
				#ifdef _USE_TWINKLE_ON
				float staticSwitch132_g2 = ( ( ( tex2DNode125_g2.r - 0.5 ) * _Twinkle_Strength ) + 1.0 );
				#else
				float staticSwitch132_g2 = 1.0;
				#endif
				
				o.ase_color = inputMesh.ase_color;
				o.ase_texcoord1.xy = inputMesh.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = ( ( normalizeResult29_g2 * max( ( lerpResult72_g2 * 0.1 * _Size_Multiplier * lerpResult268_g2.r * ( break152_g2.z * 2.5 ) ) , ( length( ( ase_worldPos - _WorldSpaceCameraPos ) ) * _Minimum_Screen_Size * 0.002 ) ) ) * staticSwitch132_g2 );
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS = inputMesh.normalOS;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				o.positionCS = TransformWorldToHClip(positionRWS);
				o.positionRWS = positionRWS;
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput Vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			float4 Frag( VertexOutput packedInput ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( packedInput );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				float3 positionRWS = packedInput.positionRWS;

				input.positionSS = packedInput.positionCS;
				input.positionRWS = positionRWS;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir( input.positionRWS );

				SurfaceDescription surfaceDescription = (SurfaceDescription)0;
				float temp_output_104_0_g2 = ( _Variation_Shift / 100.0 );
				float4 appendResult182_g2 = (float4(( packedInput.ase_color.g + temp_output_104_0_g2 ) , 0.0 , 0.0 , 0.0));
				float4 tex2DNode175_g2 = tex2D( _ColorTex, appendResult182_g2.xy );
				float3 linearToGamma270_g2 = FastLinearToSRGB( tex2DNode175_g2.rgb );
				float4 lerpResult271_g2 = lerp( tex2DNode175_g2 , float4( linearToGamma270_g2 , 0.0 ) , _LinearWorkflow);
				float3 linearToGamma278_g2 = FastLinearToSRGB( _Color_Tint.rgb );
				float4 lerpResult277_g2 = lerp( _Color_Tint , float4( linearToGamma278_g2 , 0.0 ) , _LinearWorkflow);
				float2 uv_Shape = packedInput.ase_texcoord1.xy * _Shape_ST.xy + _Shape_ST.zw;
				float4 tex2DNode204_g2 = tex2D( _Shape, uv_Shape );
				float lerpResult201_g2 = lerp( tex2DNode204_g2.a , 0.2 , _Use_ProceduralShape);
				float3 linearToGamma266_g2 = FastLinearToSRGB( tex2DNode204_g2.rgb );
				float4 lerpResult265_g2 = lerp( tex2DNode204_g2 , float4( linearToGamma266_g2 , 0.0 ) , _LinearWorkflow);
				float2 uv0213_g2 = packedInput.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_cast_11 = (0.5).xx;
				float ramp212_g2 = ( 1.0 - ( length( ( uv0213_g2 - temp_cast_11 ) ) * 2.0 ) );
				float size_exp212_g2 = _ProceduralShape_IterExp;
				float mult_exp212_g2 = 1.0;
				int MaxIter212_g2 = (int)round( _ProceduralShape_Iterations );
				float localExponentglow212_g2 = Exponentglow212_g2( ramp212_g2 , size_exp212_g2 , mult_exp212_g2 , MaxIter212_g2 );
				float clampResult255_g2 = clamp( localExponentglow212_g2 , 0.0 , 1.0 );
				float4 appendResult207_g2 = (float4(pow( clampResult255_g2 , _ProceduralShape_OutExp ) , 0.0 , 1.0 , 0.0));
				float4 lerpResult198_g2 = lerp( lerpResult265_g2 , appendResult207_g2 , _Use_ProceduralShape);
				float4 break152_g2 = lerpResult198_g2;
				float4 temp_output_141_0_g2 = ( ( lerpResult271_g2 * lerpResult277_g2 * _Color_Tint.a * ( 5.0 * lerpResult201_g2 ) * _Color_Multiplier ) * ( break152_g2.x + ( break152_g2.y * 10.0 ) ) );
				float2 uv0193_g2 = packedInput.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float4 tex2DNode190_g2 = tex2D( _LensEffect, uv0193_g2 );
				float3 linearToGamma272_g2 = FastLinearToSRGB( tex2DNode190_g2.rgb );
				float4 lerpResult273_g2 = lerp( tex2DNode190_g2 , float4( linearToGamma272_g2 , 0.0 ) , _LinearWorkflow);
				float4 break274_g2 = lerpResult273_g2;
				float clampResult87_g2 = clamp( _LensEffect_Distance , 0.0 , 100.0 );
				float3 ase_worldPos = GetAbsolutePositionWS( positionRWS );
				float clampResult83_g2 = clamp( ( clampResult87_g2 - length( ( ase_worldPos - _WorldSpaceCameraPos ) ) ) , 0.0 , clampResult87_g2 );
				float clampResult88_g2 = clamp( _LensEffect_DistanceExponent , 0.0 , 100.0 );
				float temp_output_85_0_g2 = pow( clampResult83_g2 , clampResult88_g2 );
				float clampResult143_g2 = clamp( temp_output_85_0_g2 , 0.0 , 1.0 );
				float4 lerpResult139_g2 = lerp( temp_output_141_0_g2 , ( ( lerpResult271_g2 * lerpResult277_g2 * _Color_Tint.a * ( 5.0 * lerpResult201_g2 ) * _Color_Multiplier ) * ( break274_g2.r + ( break274_g2.g * 0.5 ) + ( break274_g2.b * 3.0 ) ) ) , clampResult143_g2);
				float4 lerpResult137_g2 = lerp( temp_output_141_0_g2 , lerpResult139_g2 , _Use_LensEffect);
				float4 appendResult123_g2 = (float4(( packedInput.ase_color.g + ( _TimeParameters.x * _Twinkle_Speed * 0.1 ) ) , 0.5 , 0.0 , 0.0));
				float4 tex2DNode125_g2 = tex2D( _Twinkle_Ramp, appendResult123_g2.xy );
				#ifdef _USE_TWINKLE_ON
				float staticSwitch132_g2 = ( ( ( tex2DNode125_g2.r - 0.5 ) * _Twinkle_Strength ) + 1.0 );
				#else
				float staticSwitch132_g2 = 1.0;
				#endif
				float4 temp_cast_17 = (0.0).xxxx;
				float4 temp_cast_18 = (100.0).xxxx;
				float4 clampResult109_g2 = clamp( ( lerpResult137_g2 * staticSwitch132_g2 ) , temp_cast_17 , temp_cast_18 );
				float4 break231_g2 = clampResult109_g2;
				float clampResult256_g2 = clamp( break231_g2.r , 0.0 , 1.0 );
				float clampResult257_g2 = clamp( break231_g2.g , 0.0 , 1.0 );
				float clampResult258_g2 = clamp( break231_g2.b , 0.0 , 1.0 );
				float4 appendResult240_g2 = (float4(pow( clampResult256_g2 , ( 1.0 / _Color_Gamma.r ) ) , pow( clampResult257_g2 , ( 1.0 / _Color_Gamma.g ) ) , pow( clampResult258_g2 , ( 1.0 / _Color_Gamma.b ) ) , 0.0));
				float3 hsvTorgb250_g2 = RGBToHSV( appendResult240_g2.xyz );
				float3 hsvTorgb251_g2 = HSVToRGB( float3(hsvTorgb250_g2.x,( hsvTorgb250_g2.y * _Color_Saturation ),hsvTorgb250_g2.z) );
				float3 gammaToLinear283_g2 = FastSRGBToLinear( hsvTorgb251_g2 );
				float3 lerpResult286_g2 = lerp( hsvTorgb251_g2 , ( gammaToLinear283_g2 * 4.0 ) , _LinearWorkflow);
				
				surfaceDescription.Color = lerpResult286_g2;
				surfaceDescription.Emission = 0;
				surfaceDescription.Alpha = 1;
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				surfaceDescription.ShadowTint = float4( 0, 0 ,0 ,1 );
				float2 Distortion = float2 ( 0, 0 );
				float DistortionBlur = 0;

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				BSDFData bsdfData = ConvertSurfaceDataToBSDFData( input.positionSS.xy, surfaceData );

				float4 outColor = ApplyBlendMode( bsdfData.color + builtinData.emissiveColor * GetCurrentExposureMultiplier(), builtinData.opacity );
				outColor = EvaluateAtmosphericScattering( posInput, V, outColor );

				#ifdef DEBUG_DISPLAY
					int bufferSize = int(_DebugViewMaterialArray[0]);
					for (int index = 1; index <= bufferSize; index++)
					{
						int indexMaterialProperty = int(_DebugViewMaterialArray[index]);
						if (indexMaterialProperty != 0)
						{
							float3 result = float3(1.0, 0.0, 1.0);
							bool needLinearToSRGB = false;

							GetPropertiesDataDebug(indexMaterialProperty, result, needLinearToSRGB);
							GetVaryingsDataDebug(indexMaterialProperty, input, result, needLinearToSRGB);
							GetBuiltinDataDebug(indexMaterialProperty, builtinData, result, needLinearToSRGB);
							GetSurfaceDataDebug(indexMaterialProperty, surfaceData, result, needLinearToSRGB);
							GetBSDFDataDebug(indexMaterialProperty, bsdfData, result, needLinearToSRGB);

							if (!needLinearToSRGB)
								result = SRGBToLinear(max(0, result));

							outColor = float4(result, 1.0);
						}
					}

					if (_DebugFullScreenMode == FULLSCREENDEBUGMODE_TRANSPARENCY_OVERDRAW)
					{
						float4 result = _DebugTransparencyOverdrawWeight * float4(TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_A);
						outColor = result;
					}
				#endif
				return outColor;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }

			Cull [_CullMode]
			ZWrite On
			ZClip [_ZClip]
			ColorMask 0

			HLSLPROGRAM
			#pragma multi_compile_instancing
			#define HAVE_MESH_MODIFICATION 1
			#define ASE_SRP_VERSION 999999

			#define SHADERPASS SHADERPASS_SHADOWS

			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _ _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
			#pragma shader_feature_local _ALPHATEST_ON
			#pragma shader_feature_local _ENABLE_FOG_ON_TRANSPARENT

			#pragma vertex Vert
			#pragma fragment Frag

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#pragma shader_feature _PERPARTICLEORIENTATION_ON
			#pragma shader_feature _USE_CAMERA_POSITION_ON
			#pragma shader_feature _USE_ATTENUATION_ON
			#pragma shader_feature _USE_TWINKLE_ON


			struct VertexInput
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_Position;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START( UnityPerMaterial )
			float4 _Color_Tint;
			float4 _Shape_ST;
			float4 _Color_Gamma;
			float3 _Camera_Position;
			float _Color_Multiplier;
			float _Twinkle_Strength;
			float _Twinkle_Speed;
			float _Minimum_Screen_Size;
			float _Use_ProceduralShape;
			float _ProceduralShape_OutExp;
			float _ProceduralShape_Iterations;
			float _ProceduralShape_IterExp;
			float _Variation_Shift;
			float _Size_Multiplier;
			float _Use_LensEffect;
			float _LensEffect_DistanceExponent;
			float _LensEffect_Distance;
			float _Attenuation_Exponent;
			float _Attenuation_Strength;
			float _LinearWorkflow;
			float _Color_Saturation;
			float4 _EmissionColor;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			#ifdef _ENABLE_SHADOW_MATTE
			float _ShadowMatteFilter;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _AlphaCutoff;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			float _TessPhongStrength;
			float _TessValue;
			float _TessMin;
			float _TessMax;
			float _TessEdgeLength;
			float _TessMaxDisp;
			CBUFFER_END
			sampler2D _Size;
			sampler2D _Shape;
			sampler2D _Twinkle_Ramp;


			float Exponentglow212_g2( float ramp , float size_exp , float mult_exp , int MaxIter )
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
			

			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			void BuildSurfaceData(FragInputs fragInputs, SurfaceDescription surfaceDescription, float3 V, out SurfaceData surfaceData)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);
			}

			void GetSurfaceAndBuiltinData(SurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#if _ALPHATEST_ON
				DoAlphaTest(surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold);
				#endif

				BuildSurfaceData(fragInputs, surfaceDescription, V, surfaceData);
				ZERO_INITIALIZE (BuiltinData, builtinData);
				builtinData.opacity = surfaceDescription.Alpha;
			}

			VertexOutput VertexFunction( VertexInput inputMesh  )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float2 uv062_g2 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 break63_g2 = ( uv062_g2 - float2( 0.5,0.5 ) );
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult12_g2 = normalize( ( ase_worldPos - _Camera_Position ) );
				#ifdef _USE_CAMERA_POSITION_ON
				float3 staticSwitch14_g2 = normalizeResult12_g2;
				#else
				float3 staticSwitch14_g2 = ase_worldViewDir;
				#endif
				float3 temp_output_17_0_g2 = mul( float4( staticSwitch14_g2 , 0.0 ), GetObjectToWorldMatrix() ).xyz;
				float3 temp_output_21_0_g2 = cross( float3(0,1,0) , temp_output_17_0_g2 );
				float3 normalizeResult23_g2 = normalize( cross( temp_output_21_0_g2 , temp_output_17_0_g2 ) );
				float2 uv05_g2 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 break18_g2 = ( uv05_g2 - float2( 0.5,0.5 ) );
				float3 normalizeResult24_g2 = normalize( temp_output_21_0_g2 );
				#ifdef _PERPARTICLEORIENTATION_ON
				float3 staticSwitch38_g2 = ( ( normalizeResult23_g2 * break18_g2.y ) + ( normalizeResult24_g2 * break18_g2.x * -1.0 ) );
				#else
				float3 staticSwitch38_g2 = ( ( mul( float4( float3(1,0,0) , 0.0 ), mul(GetWorldToHClipMatrix(),GetObjectToWorldMatrix()) ).xyz * break63_g2.x ) + ( mul( float4( float3(0,1,0) , 0.0 ), mul(GetWorldToHClipMatrix(),GetObjectToWorldMatrix()) ).xyz * break63_g2.y ) );
				#endif
				float3 normalizeResult29_g2 = normalize( staticSwitch38_g2 );
				float clampResult89_g2 = clamp( _Attenuation_Strength , 0.0 , 100.0 );
				float clampResult254_g2 = clamp( ( length( ( ase_worldPos - _WorldSpaceCameraPos ) ) * 50.0 * clampResult89_g2 ) , 0.0 , 1.0 );
				float clampResult90_g2 = clamp( _Attenuation_Exponent , 0.0 , 100.0 );
				#ifdef _USE_ATTENUATION_ON
				float staticSwitch43_g2 = ( 1.0 * ( 1.0 / pow( clampResult254_g2 , clampResult90_g2 ) ) );
				#else
				float staticSwitch43_g2 = 1.0;
				#endif
				float clampResult87_g2 = clamp( _LensEffect_Distance , 0.0 , 100.0 );
				float clampResult83_g2 = clamp( ( clampResult87_g2 - length( ( ase_worldPos - _WorldSpaceCameraPos ) ) ) , 0.0 , clampResult87_g2 );
				float clampResult88_g2 = clamp( _LensEffect_DistanceExponent , 0.0 , 100.0 );
				float temp_output_85_0_g2 = pow( clampResult83_g2 , clampResult88_g2 );
				float lerpResult72_g2 = lerp( staticSwitch43_g2 , ( staticSwitch43_g2 * ( temp_output_85_0_g2 + 1.0 ) ) , _Use_LensEffect);
				float temp_output_104_0_g2 = ( _Variation_Shift / 100.0 );
				float4 appendResult98_g2 = (float4(( inputMesh.ase_color.g + temp_output_104_0_g2 ) , 0.0 , 0.0 , 0.0));
				float4 tex2DNode97_g2 = tex2Dlod( _Size, float4( appendResult98_g2.xy, 0, 0.0) );
				float3 linearToGamma267_g2 = FastLinearToSRGB( tex2DNode97_g2.rgb );
				float4 lerpResult268_g2 = lerp( tex2DNode97_g2 , float4( linearToGamma267_g2 , 0.0 ) , _LinearWorkflow);
				float2 uv_Shape = inputMesh.ase_texcoord.xy * _Shape_ST.xy + _Shape_ST.zw;
				float4 tex2DNode204_g2 = tex2Dlod( _Shape, float4( uv_Shape, 0, 0.0) );
				float3 linearToGamma266_g2 = FastLinearToSRGB( tex2DNode204_g2.rgb );
				float4 lerpResult265_g2 = lerp( tex2DNode204_g2 , float4( linearToGamma266_g2 , 0.0 ) , _LinearWorkflow);
				float2 uv0213_g2 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_cast_16 = (0.5).xx;
				float ramp212_g2 = ( 1.0 - ( length( ( uv0213_g2 - temp_cast_16 ) ) * 2.0 ) );
				float size_exp212_g2 = _ProceduralShape_IterExp;
				float mult_exp212_g2 = 1.0;
				int MaxIter212_g2 = (int)round( _ProceduralShape_Iterations );
				float localExponentglow212_g2 = Exponentglow212_g2( ramp212_g2 , size_exp212_g2 , mult_exp212_g2 , MaxIter212_g2 );
				float clampResult255_g2 = clamp( localExponentglow212_g2 , 0.0 , 1.0 );
				float4 appendResult207_g2 = (float4(pow( clampResult255_g2 , _ProceduralShape_OutExp ) , 0.0 , 1.0 , 0.0));
				float4 lerpResult198_g2 = lerp( lerpResult265_g2 , appendResult207_g2 , _Use_ProceduralShape);
				float4 break152_g2 = lerpResult198_g2;
				float4 appendResult123_g2 = (float4(( inputMesh.ase_color.g + ( _TimeParameters.x * _Twinkle_Speed * 0.1 ) ) , 0.5 , 0.0 , 0.0));
				float4 tex2DNode125_g2 = tex2Dlod( _Twinkle_Ramp, float4( appendResult123_g2.xy, 0, 0.0) );
				#ifdef _USE_TWINKLE_ON
				float staticSwitch132_g2 = ( ( ( tex2DNode125_g2.r - 0.5 ) * _Twinkle_Strength ) + 1.0 );
				#else
				float staticSwitch132_g2 = 1.0;
				#endif
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = ( ( normalizeResult29_g2 * max( ( lerpResult72_g2 * 0.1 * _Size_Multiplier * lerpResult268_g2.r * ( break152_g2.z * 2.5 ) ) , ( length( ( ase_worldPos - _WorldSpaceCameraPos ) ) * _Minimum_Screen_Size * 0.002 ) ) ) * staticSwitch132_g2 );
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				o.positionCS = TransformWorldToHClip(positionRWS);
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput Vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			void Frag( VertexOutput packedInput
					#ifdef WRITE_NORMAL_BUFFER
					, out float4 outNormalBuffer : SV_Target0
						#ifdef WRITE_MSAA_DEPTH
						, out float1 depthColor : SV_Target1
						#endif
					#elif defined(WRITE_MSAA_DEPTH)
					, out float4 outNormalBuffer : SV_Target0
					, out float1 depthColor : SV_Target1
					#elif defined(SCENESELECTIONPASS)
					, out float4 outColor : SV_Target0
					#endif
					#ifdef _DEPTHOFFSET_ON
					, out float outputDepth : SV_Depth
					#endif
					
					)
			{
				UNITY_SETUP_INSTANCE_ID( packedInput );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);

				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = float3( 1.0, 1.0, 1.0 );

				SurfaceDescription surfaceDescription = (SurfaceDescription)0;
				
				surfaceDescription.Alpha = 1;
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription,input, V, posInput, surfaceData, builtinData);

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif

				#ifdef WRITE_NORMAL_BUFFER
				EncodeIntoNormalBuffer( ConvertSurfaceDataToNormalData( surfaceData ), posInput.positionSS, outNormalBuffer );
				#ifdef WRITE_MSAA_DEPTH
				depthColor = packedInput.positionCS.z;
				#endif
				#elif defined(WRITE_MSAA_DEPTH)
				outNormalBuffer = float4( 0.0, 0.0, 0.0, 1.0 );
				depthColor = packedInput.positionCS.z;
				#elif defined(SCENESELECTIONPASS)
				outColor = float4( _ObjectId, _PassValue, 1.0, 1.0 );
				#endif
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "META"
			Tags { "LightMode"="Meta" }

			Cull Off

			HLSLPROGRAM
			#pragma multi_compile_instancing
			#define HAVE_MESH_MODIFICATION 1
			#define ASE_SRP_VERSION 999999

			#define SHADERPASS SHADERPASS_LIGHT_TRANSPORT

			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _ _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
			#pragma shader_feature_local _ALPHATEST_ON
			#pragma shader_feature_local _ENABLE_FOG_ON_TRANSPARENT

			#pragma vertex Vert
			#pragma fragment Frag

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature _PERPARTICLEORIENTATION_ON
			#pragma shader_feature _USE_CAMERA_POSITION_ON
			#pragma shader_feature _USE_ATTENUATION_ON
			#pragma shader_feature _USE_TWINKLE_ON


			struct VertexInput
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_Position;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			CBUFFER_START( UnityPerMaterial )
			float4 _Color_Tint;
			float4 _Shape_ST;
			float4 _Color_Gamma;
			float3 _Camera_Position;
			float _Color_Multiplier;
			float _Twinkle_Strength;
			float _Twinkle_Speed;
			float _Minimum_Screen_Size;
			float _Use_ProceduralShape;
			float _ProceduralShape_OutExp;
			float _ProceduralShape_Iterations;
			float _ProceduralShape_IterExp;
			float _Variation_Shift;
			float _Size_Multiplier;
			float _Use_LensEffect;
			float _LensEffect_DistanceExponent;
			float _LensEffect_Distance;
			float _Attenuation_Exponent;
			float _Attenuation_Strength;
			float _LinearWorkflow;
			float _Color_Saturation;
			float4 _EmissionColor;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			#ifdef _ENABLE_SHADOW_MATTE
			float _ShadowMatteFilter;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _AlphaCutoff;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			float _TessPhongStrength;
			float _TessValue;
			float _TessMin;
			float _TessMax;
			float _TessEdgeLength;
			float _TessMaxDisp;
			CBUFFER_END

			CBUFFER_START( UnityMetaPass )
			bool4 unity_MetaVertexControl;
			bool4 unity_MetaFragmentControl;
			CBUFFER_END

			float unity_OneOverOutputBoost;
			float unity_MaxOutputValue;
			sampler2D _Size;
			sampler2D _Shape;
			sampler2D _Twinkle_Ramp;
			sampler2D _ColorTex;
			sampler2D _LensEffect;


			float Exponentglow212_g2( float ramp , float size_exp , float mult_exp , int MaxIter )
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

			struct SurfaceDescription
			{
				float3 Color;
				float3 Emission;
				float Alpha;
				float AlphaClipThreshold;
			};

			void BuildSurfaceData( FragInputs fragInputs, SurfaceDescription surfaceDescription, float3 V, out SurfaceData surfaceData )
			{
				ZERO_INITIALIZE( SurfaceData, surfaceData );
				surfaceData.color = surfaceDescription.Color;
			}

			void GetSurfaceAndBuiltinData( SurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData )
			{
				#if _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				BuildSurfaceData( fragInputs, surfaceDescription, V, surfaceData );
				ZERO_INITIALIZE( BuiltinData, builtinData );
				builtinData.opacity = surfaceDescription.Alpha;
				builtinData.emissiveColor = surfaceDescription.Emission;
			}

			VertexOutput VertexFunction( VertexInput inputMesh  )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID( inputMesh );
				UNITY_TRANSFER_INSTANCE_ID( inputMesh, o );

				float2 uv062_g2 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 break63_g2 = ( uv062_g2 - float2( 0.5,0.5 ) );
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult12_g2 = normalize( ( ase_worldPos - _Camera_Position ) );
				#ifdef _USE_CAMERA_POSITION_ON
				float3 staticSwitch14_g2 = normalizeResult12_g2;
				#else
				float3 staticSwitch14_g2 = ase_worldViewDir;
				#endif
				float3 temp_output_17_0_g2 = mul( float4( staticSwitch14_g2 , 0.0 ), GetObjectToWorldMatrix() ).xyz;
				float3 temp_output_21_0_g2 = cross( float3(0,1,0) , temp_output_17_0_g2 );
				float3 normalizeResult23_g2 = normalize( cross( temp_output_21_0_g2 , temp_output_17_0_g2 ) );
				float2 uv05_g2 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 break18_g2 = ( uv05_g2 - float2( 0.5,0.5 ) );
				float3 normalizeResult24_g2 = normalize( temp_output_21_0_g2 );
				#ifdef _PERPARTICLEORIENTATION_ON
				float3 staticSwitch38_g2 = ( ( normalizeResult23_g2 * break18_g2.y ) + ( normalizeResult24_g2 * break18_g2.x * -1.0 ) );
				#else
				float3 staticSwitch38_g2 = ( ( mul( float4( float3(1,0,0) , 0.0 ), mul(GetWorldToHClipMatrix(),GetObjectToWorldMatrix()) ).xyz * break63_g2.x ) + ( mul( float4( float3(0,1,0) , 0.0 ), mul(GetWorldToHClipMatrix(),GetObjectToWorldMatrix()) ).xyz * break63_g2.y ) );
				#endif
				float3 normalizeResult29_g2 = normalize( staticSwitch38_g2 );
				float clampResult89_g2 = clamp( _Attenuation_Strength , 0.0 , 100.0 );
				float clampResult254_g2 = clamp( ( length( ( ase_worldPos - _WorldSpaceCameraPos ) ) * 50.0 * clampResult89_g2 ) , 0.0 , 1.0 );
				float clampResult90_g2 = clamp( _Attenuation_Exponent , 0.0 , 100.0 );
				#ifdef _USE_ATTENUATION_ON
				float staticSwitch43_g2 = ( 1.0 * ( 1.0 / pow( clampResult254_g2 , clampResult90_g2 ) ) );
				#else
				float staticSwitch43_g2 = 1.0;
				#endif
				float clampResult87_g2 = clamp( _LensEffect_Distance , 0.0 , 100.0 );
				float clampResult83_g2 = clamp( ( clampResult87_g2 - length( ( ase_worldPos - _WorldSpaceCameraPos ) ) ) , 0.0 , clampResult87_g2 );
				float clampResult88_g2 = clamp( _LensEffect_DistanceExponent , 0.0 , 100.0 );
				float temp_output_85_0_g2 = pow( clampResult83_g2 , clampResult88_g2 );
				float lerpResult72_g2 = lerp( staticSwitch43_g2 , ( staticSwitch43_g2 * ( temp_output_85_0_g2 + 1.0 ) ) , _Use_LensEffect);
				float temp_output_104_0_g2 = ( _Variation_Shift / 100.0 );
				float4 appendResult98_g2 = (float4(( inputMesh.ase_color.g + temp_output_104_0_g2 ) , 0.0 , 0.0 , 0.0));
				float4 tex2DNode97_g2 = tex2Dlod( _Size, float4( appendResult98_g2.xy, 0, 0.0) );
				float3 linearToGamma267_g2 = FastLinearToSRGB( tex2DNode97_g2.rgb );
				float4 lerpResult268_g2 = lerp( tex2DNode97_g2 , float4( linearToGamma267_g2 , 0.0 ) , _LinearWorkflow);
				float2 uv_Shape = inputMesh.ase_texcoord.xy * _Shape_ST.xy + _Shape_ST.zw;
				float4 tex2DNode204_g2 = tex2Dlod( _Shape, float4( uv_Shape, 0, 0.0) );
				float3 linearToGamma266_g2 = FastLinearToSRGB( tex2DNode204_g2.rgb );
				float4 lerpResult265_g2 = lerp( tex2DNode204_g2 , float4( linearToGamma266_g2 , 0.0 ) , _LinearWorkflow);
				float2 uv0213_g2 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_cast_16 = (0.5).xx;
				float ramp212_g2 = ( 1.0 - ( length( ( uv0213_g2 - temp_cast_16 ) ) * 2.0 ) );
				float size_exp212_g2 = _ProceduralShape_IterExp;
				float mult_exp212_g2 = 1.0;
				int MaxIter212_g2 = (int)round( _ProceduralShape_Iterations );
				float localExponentglow212_g2 = Exponentglow212_g2( ramp212_g2 , size_exp212_g2 , mult_exp212_g2 , MaxIter212_g2 );
				float clampResult255_g2 = clamp( localExponentglow212_g2 , 0.0 , 1.0 );
				float4 appendResult207_g2 = (float4(pow( clampResult255_g2 , _ProceduralShape_OutExp ) , 0.0 , 1.0 , 0.0));
				float4 lerpResult198_g2 = lerp( lerpResult265_g2 , appendResult207_g2 , _Use_ProceduralShape);
				float4 break152_g2 = lerpResult198_g2;
				float4 appendResult123_g2 = (float4(( inputMesh.ase_color.g + ( _TimeParameters.x * _Twinkle_Speed * 0.1 ) ) , 0.5 , 0.0 , 0.0));
				float4 tex2DNode125_g2 = tex2Dlod( _Twinkle_Ramp, float4( appendResult123_g2.xy, 0, 0.0) );
				#ifdef _USE_TWINKLE_ON
				float staticSwitch132_g2 = ( ( ( tex2DNode125_g2.r - 0.5 ) * _Twinkle_Strength ) + 1.0 );
				#else
				float staticSwitch132_g2 = 1.0;
				#endif
				
				o.ase_texcoord1.xyz = ase_worldPos;
				
				o.ase_color = inputMesh.ase_color;
				o.ase_texcoord.xy = inputMesh.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;
				o.ase_texcoord1.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = ( ( normalizeResult29_g2 * max( ( lerpResult72_g2 * 0.1 * _Size_Multiplier * lerpResult268_g2.r * ( break152_g2.z * 2.5 ) ) , ( length( ( ase_worldPos - _WorldSpaceCameraPos ) ) * _Minimum_Screen_Size * 0.002 ) ) ) * staticSwitch132_g2 );
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;

				float2 uv = float2( 0.0, 0.0 );
				if( unity_MetaVertexControl.x )
				{
					uv = inputMesh.uv1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				}
				else if( unity_MetaVertexControl.y )
				{
					uv = inputMesh.uv2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				}

				o.positionCS = float4( uv * 2.0 - 1.0, inputMesh.positionOS.z > 0 ? 1.0e-4 : 0.0, 1.0 );
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.uv1 = v.uv1;
				o.uv2 = v.uv2;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.uv1 = patch[0].uv1 * bary.x + patch[1].uv1 * bary.y + patch[2].uv1 * bary.z;
				o.uv2 = patch[0].uv2 * bary.x + patch[1].uv2 * bary.y + patch[2].uv2 * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput Vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			float4 Frag( VertexOutput packedInput  ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( packedInput );
				FragInputs input;
				ZERO_INITIALIZE( FragInputs, input );
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				PositionInputs posInput = GetPositionInput( input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS );

				float3 V = float3( 1.0, 1.0, 1.0 );

				SurfaceDescription surfaceDescription = (SurfaceDescription)0;
				float temp_output_104_0_g2 = ( _Variation_Shift / 100.0 );
				float4 appendResult182_g2 = (float4(( packedInput.ase_color.g + temp_output_104_0_g2 ) , 0.0 , 0.0 , 0.0));
				float4 tex2DNode175_g2 = tex2D( _ColorTex, appendResult182_g2.xy );
				float3 linearToGamma270_g2 = FastLinearToSRGB( tex2DNode175_g2.rgb );
				float4 lerpResult271_g2 = lerp( tex2DNode175_g2 , float4( linearToGamma270_g2 , 0.0 ) , _LinearWorkflow);
				float3 linearToGamma278_g2 = FastLinearToSRGB( _Color_Tint.rgb );
				float4 lerpResult277_g2 = lerp( _Color_Tint , float4( linearToGamma278_g2 , 0.0 ) , _LinearWorkflow);
				float2 uv_Shape = packedInput.ase_texcoord.xy * _Shape_ST.xy + _Shape_ST.zw;
				float4 tex2DNode204_g2 = tex2D( _Shape, uv_Shape );
				float lerpResult201_g2 = lerp( tex2DNode204_g2.a , 0.2 , _Use_ProceduralShape);
				float3 linearToGamma266_g2 = FastLinearToSRGB( tex2DNode204_g2.rgb );
				float4 lerpResult265_g2 = lerp( tex2DNode204_g2 , float4( linearToGamma266_g2 , 0.0 ) , _LinearWorkflow);
				float2 uv0213_g2 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_cast_11 = (0.5).xx;
				float ramp212_g2 = ( 1.0 - ( length( ( uv0213_g2 - temp_cast_11 ) ) * 2.0 ) );
				float size_exp212_g2 = _ProceduralShape_IterExp;
				float mult_exp212_g2 = 1.0;
				int MaxIter212_g2 = (int)round( _ProceduralShape_Iterations );
				float localExponentglow212_g2 = Exponentglow212_g2( ramp212_g2 , size_exp212_g2 , mult_exp212_g2 , MaxIter212_g2 );
				float clampResult255_g2 = clamp( localExponentglow212_g2 , 0.0 , 1.0 );
				float4 appendResult207_g2 = (float4(pow( clampResult255_g2 , _ProceduralShape_OutExp ) , 0.0 , 1.0 , 0.0));
				float4 lerpResult198_g2 = lerp( lerpResult265_g2 , appendResult207_g2 , _Use_ProceduralShape);
				float4 break152_g2 = lerpResult198_g2;
				float4 temp_output_141_0_g2 = ( ( lerpResult271_g2 * lerpResult277_g2 * _Color_Tint.a * ( 5.0 * lerpResult201_g2 ) * _Color_Multiplier ) * ( break152_g2.x + ( break152_g2.y * 10.0 ) ) );
				float2 uv0193_g2 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float4 tex2DNode190_g2 = tex2D( _LensEffect, uv0193_g2 );
				float3 linearToGamma272_g2 = FastLinearToSRGB( tex2DNode190_g2.rgb );
				float4 lerpResult273_g2 = lerp( tex2DNode190_g2 , float4( linearToGamma272_g2 , 0.0 ) , _LinearWorkflow);
				float4 break274_g2 = lerpResult273_g2;
				float clampResult87_g2 = clamp( _LensEffect_Distance , 0.0 , 100.0 );
				float3 ase_worldPos = packedInput.ase_texcoord1.xyz;
				float clampResult83_g2 = clamp( ( clampResult87_g2 - length( ( ase_worldPos - _WorldSpaceCameraPos ) ) ) , 0.0 , clampResult87_g2 );
				float clampResult88_g2 = clamp( _LensEffect_DistanceExponent , 0.0 , 100.0 );
				float temp_output_85_0_g2 = pow( clampResult83_g2 , clampResult88_g2 );
				float clampResult143_g2 = clamp( temp_output_85_0_g2 , 0.0 , 1.0 );
				float4 lerpResult139_g2 = lerp( temp_output_141_0_g2 , ( ( lerpResult271_g2 * lerpResult277_g2 * _Color_Tint.a * ( 5.0 * lerpResult201_g2 ) * _Color_Multiplier ) * ( break274_g2.r + ( break274_g2.g * 0.5 ) + ( break274_g2.b * 3.0 ) ) ) , clampResult143_g2);
				float4 lerpResult137_g2 = lerp( temp_output_141_0_g2 , lerpResult139_g2 , _Use_LensEffect);
				float4 appendResult123_g2 = (float4(( packedInput.ase_color.g + ( _TimeParameters.x * _Twinkle_Speed * 0.1 ) ) , 0.5 , 0.0 , 0.0));
				float4 tex2DNode125_g2 = tex2D( _Twinkle_Ramp, appendResult123_g2.xy );
				#ifdef _USE_TWINKLE_ON
				float staticSwitch132_g2 = ( ( ( tex2DNode125_g2.r - 0.5 ) * _Twinkle_Strength ) + 1.0 );
				#else
				float staticSwitch132_g2 = 1.0;
				#endif
				float4 temp_cast_17 = (0.0).xxxx;
				float4 temp_cast_18 = (100.0).xxxx;
				float4 clampResult109_g2 = clamp( ( lerpResult137_g2 * staticSwitch132_g2 ) , temp_cast_17 , temp_cast_18 );
				float4 break231_g2 = clampResult109_g2;
				float clampResult256_g2 = clamp( break231_g2.r , 0.0 , 1.0 );
				float clampResult257_g2 = clamp( break231_g2.g , 0.0 , 1.0 );
				float clampResult258_g2 = clamp( break231_g2.b , 0.0 , 1.0 );
				float4 appendResult240_g2 = (float4(pow( clampResult256_g2 , ( 1.0 / _Color_Gamma.r ) ) , pow( clampResult257_g2 , ( 1.0 / _Color_Gamma.g ) ) , pow( clampResult258_g2 , ( 1.0 / _Color_Gamma.b ) ) , 0.0));
				float3 hsvTorgb250_g2 = RGBToHSV( appendResult240_g2.xyz );
				float3 hsvTorgb251_g2 = HSVToRGB( float3(hsvTorgb250_g2.x,( hsvTorgb250_g2.y * _Color_Saturation ),hsvTorgb250_g2.z) );
				float3 gammaToLinear283_g2 = FastSRGBToLinear( hsvTorgb251_g2 );
				float3 lerpResult286_g2 = lerp( hsvTorgb251_g2 , ( gammaToLinear283_g2 * 4.0 ) , _LinearWorkflow);
				
				surfaceDescription.Color = lerpResult286_g2;
				surfaceDescription.Emission = 0;
				surfaceDescription.Alpha = 1;
				surfaceDescription.AlphaClipThreshold =  _AlphaCutoff;

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData( surfaceDescription,input, V, posInput, surfaceData, builtinData );

				BSDFData bsdfData = ConvertSurfaceDataToBSDFData( input.positionSS.xy, surfaceData );
				LightTransportData lightTransportData = GetLightTransportData( surfaceData, builtinData, bsdfData );

				float4 res = float4( 0.0, 0.0, 0.0, 1.0 );
				if( unity_MetaFragmentControl.x )
				{
					res.rgb = clamp( pow( abs( lightTransportData.diffuseColor ), saturate( unity_OneOverOutputBoost ) ), 0, unity_MaxOutputValue );
				}

				if( unity_MetaFragmentControl.y )
				{
					res.rgb = lightTransportData.emissiveColor;
				}

				return res;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }

			Cull [_CullMode]
			ZWrite On

			ColorMask 0

			HLSLPROGRAM
			#pragma multi_compile_instancing
			#define HAVE_MESH_MODIFICATION 1
			#define ASE_SRP_VERSION 999999

			#define SHADERPASS SHADERPASS_DEPTH_ONLY
			#define SCENESELECTIONPASS
			#pragma editor_sync_compilation

			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _ _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
			#pragma shader_feature_local _ALPHATEST_ON
			#pragma shader_feature_local _ENABLE_FOG_ON_TRANSPARENT

			#pragma vertex Vert
			#pragma fragment Frag

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#pragma shader_feature _PERPARTICLEORIENTATION_ON
			#pragma shader_feature _USE_CAMERA_POSITION_ON
			#pragma shader_feature _USE_ATTENUATION_ON
			#pragma shader_feature _USE_TWINKLE_ON


			struct VertexInput
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_Position;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			int _ObjectId;
			int _PassValue;

			CBUFFER_START( UnityPerMaterial )
			float4 _Color_Tint;
			float4 _Shape_ST;
			float4 _Color_Gamma;
			float3 _Camera_Position;
			float _Color_Multiplier;
			float _Twinkle_Strength;
			float _Twinkle_Speed;
			float _Minimum_Screen_Size;
			float _Use_ProceduralShape;
			float _ProceduralShape_OutExp;
			float _ProceduralShape_Iterations;
			float _ProceduralShape_IterExp;
			float _Variation_Shift;
			float _Size_Multiplier;
			float _Use_LensEffect;
			float _LensEffect_DistanceExponent;
			float _LensEffect_Distance;
			float _Attenuation_Exponent;
			float _Attenuation_Strength;
			float _LinearWorkflow;
			float _Color_Saturation;
			float4 _EmissionColor;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			#ifdef _ENABLE_SHADOW_MATTE
			float _ShadowMatteFilter;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _AlphaCutoff;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			float _TessPhongStrength;
			float _TessValue;
			float _TessMin;
			float _TessMax;
			float _TessEdgeLength;
			float _TessMaxDisp;
			CBUFFER_END
			sampler2D _Size;
			sampler2D _Shape;
			sampler2D _Twinkle_Ramp;


			float Exponentglow212_g2( float ramp , float size_exp , float mult_exp , int MaxIter )
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
			

			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			void BuildSurfaceData(FragInputs fragInputs, SurfaceDescription surfaceDescription, float3 V, out SurfaceData surfaceData)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);
			}

			void GetSurfaceAndBuiltinData(SurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#if _ALPHATEST_ON
				DoAlphaTest ( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				BuildSurfaceData(fragInputs, surfaceDescription, V, surfaceData);
				ZERO_INITIALIZE(BuiltinData, builtinData);
				builtinData.opacity =  surfaceDescription.Alpha;
			}

			VertexOutput VertexFunction( VertexInput inputMesh  )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float2 uv062_g2 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 break63_g2 = ( uv062_g2 - float2( 0.5,0.5 ) );
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult12_g2 = normalize( ( ase_worldPos - _Camera_Position ) );
				#ifdef _USE_CAMERA_POSITION_ON
				float3 staticSwitch14_g2 = normalizeResult12_g2;
				#else
				float3 staticSwitch14_g2 = ase_worldViewDir;
				#endif
				float3 temp_output_17_0_g2 = mul( float4( staticSwitch14_g2 , 0.0 ), GetObjectToWorldMatrix() ).xyz;
				float3 temp_output_21_0_g2 = cross( float3(0,1,0) , temp_output_17_0_g2 );
				float3 normalizeResult23_g2 = normalize( cross( temp_output_21_0_g2 , temp_output_17_0_g2 ) );
				float2 uv05_g2 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 break18_g2 = ( uv05_g2 - float2( 0.5,0.5 ) );
				float3 normalizeResult24_g2 = normalize( temp_output_21_0_g2 );
				#ifdef _PERPARTICLEORIENTATION_ON
				float3 staticSwitch38_g2 = ( ( normalizeResult23_g2 * break18_g2.y ) + ( normalizeResult24_g2 * break18_g2.x * -1.0 ) );
				#else
				float3 staticSwitch38_g2 = ( ( mul( float4( float3(1,0,0) , 0.0 ), mul(GetWorldToHClipMatrix(),GetObjectToWorldMatrix()) ).xyz * break63_g2.x ) + ( mul( float4( float3(0,1,0) , 0.0 ), mul(GetWorldToHClipMatrix(),GetObjectToWorldMatrix()) ).xyz * break63_g2.y ) );
				#endif
				float3 normalizeResult29_g2 = normalize( staticSwitch38_g2 );
				float clampResult89_g2 = clamp( _Attenuation_Strength , 0.0 , 100.0 );
				float clampResult254_g2 = clamp( ( length( ( ase_worldPos - _WorldSpaceCameraPos ) ) * 50.0 * clampResult89_g2 ) , 0.0 , 1.0 );
				float clampResult90_g2 = clamp( _Attenuation_Exponent , 0.0 , 100.0 );
				#ifdef _USE_ATTENUATION_ON
				float staticSwitch43_g2 = ( 1.0 * ( 1.0 / pow( clampResult254_g2 , clampResult90_g2 ) ) );
				#else
				float staticSwitch43_g2 = 1.0;
				#endif
				float clampResult87_g2 = clamp( _LensEffect_Distance , 0.0 , 100.0 );
				float clampResult83_g2 = clamp( ( clampResult87_g2 - length( ( ase_worldPos - _WorldSpaceCameraPos ) ) ) , 0.0 , clampResult87_g2 );
				float clampResult88_g2 = clamp( _LensEffect_DistanceExponent , 0.0 , 100.0 );
				float temp_output_85_0_g2 = pow( clampResult83_g2 , clampResult88_g2 );
				float lerpResult72_g2 = lerp( staticSwitch43_g2 , ( staticSwitch43_g2 * ( temp_output_85_0_g2 + 1.0 ) ) , _Use_LensEffect);
				float temp_output_104_0_g2 = ( _Variation_Shift / 100.0 );
				float4 appendResult98_g2 = (float4(( inputMesh.ase_color.g + temp_output_104_0_g2 ) , 0.0 , 0.0 , 0.0));
				float4 tex2DNode97_g2 = tex2Dlod( _Size, float4( appendResult98_g2.xy, 0, 0.0) );
				float3 linearToGamma267_g2 = FastLinearToSRGB( tex2DNode97_g2.rgb );
				float4 lerpResult268_g2 = lerp( tex2DNode97_g2 , float4( linearToGamma267_g2 , 0.0 ) , _LinearWorkflow);
				float2 uv_Shape = inputMesh.ase_texcoord.xy * _Shape_ST.xy + _Shape_ST.zw;
				float4 tex2DNode204_g2 = tex2Dlod( _Shape, float4( uv_Shape, 0, 0.0) );
				float3 linearToGamma266_g2 = FastLinearToSRGB( tex2DNode204_g2.rgb );
				float4 lerpResult265_g2 = lerp( tex2DNode204_g2 , float4( linearToGamma266_g2 , 0.0 ) , _LinearWorkflow);
				float2 uv0213_g2 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_cast_16 = (0.5).xx;
				float ramp212_g2 = ( 1.0 - ( length( ( uv0213_g2 - temp_cast_16 ) ) * 2.0 ) );
				float size_exp212_g2 = _ProceduralShape_IterExp;
				float mult_exp212_g2 = 1.0;
				int MaxIter212_g2 = (int)round( _ProceduralShape_Iterations );
				float localExponentglow212_g2 = Exponentglow212_g2( ramp212_g2 , size_exp212_g2 , mult_exp212_g2 , MaxIter212_g2 );
				float clampResult255_g2 = clamp( localExponentglow212_g2 , 0.0 , 1.0 );
				float4 appendResult207_g2 = (float4(pow( clampResult255_g2 , _ProceduralShape_OutExp ) , 0.0 , 1.0 , 0.0));
				float4 lerpResult198_g2 = lerp( lerpResult265_g2 , appendResult207_g2 , _Use_ProceduralShape);
				float4 break152_g2 = lerpResult198_g2;
				float4 appendResult123_g2 = (float4(( inputMesh.ase_color.g + ( _TimeParameters.x * _Twinkle_Speed * 0.1 ) ) , 0.5 , 0.0 , 0.0));
				float4 tex2DNode125_g2 = tex2Dlod( _Twinkle_Ramp, float4( appendResult123_g2.xy, 0, 0.0) );
				#ifdef _USE_TWINKLE_ON
				float staticSwitch132_g2 = ( ( ( tex2DNode125_g2.r - 0.5 ) * _Twinkle_Strength ) + 1.0 );
				#else
				float staticSwitch132_g2 = 1.0;
				#endif
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue =  ( ( normalizeResult29_g2 * max( ( lerpResult72_g2 * 0.1 * _Size_Multiplier * lerpResult268_g2.r * ( break152_g2.z * 2.5 ) ) , ( length( ( ase_worldPos - _WorldSpaceCameraPos ) ) * _Minimum_Screen_Size * 0.002 ) ) ) * staticSwitch132_g2 );
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				o.positionCS = TransformWorldToHClip(positionRWS);
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput Vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			void Frag( VertexOutput packedInput
					, out float4 outColor : SV_Target0
					#ifdef _DEPTHOFFSET_ON
					, out float outputDepth : SV_Depth
					#endif
					
					)
			{
				UNITY_SETUP_INSTANCE_ID( packedInput );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = float3( 1.0, 1.0, 1.0 );

				SurfaceData surfaceData;
				BuiltinData builtinData;
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;
				
				surfaceDescription.Alpha = 1;
				surfaceDescription.AlphaClipThreshold =  _AlphaCutoff;

				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif

				outColor = float4( _ObjectId, _PassValue, 1.0, 1.0 );
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthForwardOnly"
			Tags { "LightMode"="DepthForwardOnly" }

			Cull [_CullMode]
			ZWrite On
			Stencil
			{
				Ref [_StencilRefDepth]
				WriteMask [_StencilWriteMaskDepth]
				Comp Always
				Pass Replace
				Fail Keep
				ZFail Keep
			}


			ColorMask 0 0

			HLSLPROGRAM
			#pragma multi_compile_instancing
			#define HAVE_MESH_MODIFICATION 1
			#define ASE_SRP_VERSION 999999

			#define SHADERPASS SHADERPASS_DEPTH_ONLY
			#pragma multi_compile _ WRITE_MSAA_DEPTH

			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _ _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
			#pragma shader_feature_local _ALPHATEST_ON
			#pragma shader_feature_local _ENABLE_FOG_ON_TRANSPARENT

			#pragma vertex Vert
			#pragma fragment Frag

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#pragma shader_feature _PERPARTICLEORIENTATION_ON
			#pragma shader_feature _USE_CAMERA_POSITION_ON
			#pragma shader_feature _USE_ATTENUATION_ON
			#pragma shader_feature _USE_TWINKLE_ON


			struct VertexInput
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_Position;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START( UnityPerMaterial )
			float4 _Color_Tint;
			float4 _Shape_ST;
			float4 _Color_Gamma;
			float3 _Camera_Position;
			float _Color_Multiplier;
			float _Twinkle_Strength;
			float _Twinkle_Speed;
			float _Minimum_Screen_Size;
			float _Use_ProceduralShape;
			float _ProceduralShape_OutExp;
			float _ProceduralShape_Iterations;
			float _ProceduralShape_IterExp;
			float _Variation_Shift;
			float _Size_Multiplier;
			float _Use_LensEffect;
			float _LensEffect_DistanceExponent;
			float _LensEffect_Distance;
			float _Attenuation_Exponent;
			float _Attenuation_Strength;
			float _LinearWorkflow;
			float _Color_Saturation;
			float4 _EmissionColor;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			#ifdef _ENABLE_SHADOW_MATTE
			float _ShadowMatteFilter;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _AlphaCutoff;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			float _TessPhongStrength;
			float _TessValue;
			float _TessMin;
			float _TessMax;
			float _TessEdgeLength;
			float _TessMaxDisp;
			CBUFFER_END
			sampler2D _Size;
			sampler2D _Shape;
			sampler2D _Twinkle_Ramp;


			float Exponentglow212_g2( float ramp , float size_exp , float mult_exp , int MaxIter )
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
			

			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			void BuildSurfaceData(FragInputs fragInputs, SurfaceDescription surfaceDescription, float3 V, out SurfaceData surfaceData)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);
			}

			void GetSurfaceAndBuiltinData(SurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#if _ALPHATEST_ON
				DoAlphaTest ( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				BuildSurfaceData(fragInputs, surfaceDescription, V, surfaceData);
				ZERO_INITIALIZE(BuiltinData, builtinData);
				builtinData.opacity =  surfaceDescription.Alpha;
			}

			VertexOutput VertexFunction( VertexInput inputMesh  )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float2 uv062_g2 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 break63_g2 = ( uv062_g2 - float2( 0.5,0.5 ) );
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult12_g2 = normalize( ( ase_worldPos - _Camera_Position ) );
				#ifdef _USE_CAMERA_POSITION_ON
				float3 staticSwitch14_g2 = normalizeResult12_g2;
				#else
				float3 staticSwitch14_g2 = ase_worldViewDir;
				#endif
				float3 temp_output_17_0_g2 = mul( float4( staticSwitch14_g2 , 0.0 ), GetObjectToWorldMatrix() ).xyz;
				float3 temp_output_21_0_g2 = cross( float3(0,1,0) , temp_output_17_0_g2 );
				float3 normalizeResult23_g2 = normalize( cross( temp_output_21_0_g2 , temp_output_17_0_g2 ) );
				float2 uv05_g2 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 break18_g2 = ( uv05_g2 - float2( 0.5,0.5 ) );
				float3 normalizeResult24_g2 = normalize( temp_output_21_0_g2 );
				#ifdef _PERPARTICLEORIENTATION_ON
				float3 staticSwitch38_g2 = ( ( normalizeResult23_g2 * break18_g2.y ) + ( normalizeResult24_g2 * break18_g2.x * -1.0 ) );
				#else
				float3 staticSwitch38_g2 = ( ( mul( float4( float3(1,0,0) , 0.0 ), mul(GetWorldToHClipMatrix(),GetObjectToWorldMatrix()) ).xyz * break63_g2.x ) + ( mul( float4( float3(0,1,0) , 0.0 ), mul(GetWorldToHClipMatrix(),GetObjectToWorldMatrix()) ).xyz * break63_g2.y ) );
				#endif
				float3 normalizeResult29_g2 = normalize( staticSwitch38_g2 );
				float clampResult89_g2 = clamp( _Attenuation_Strength , 0.0 , 100.0 );
				float clampResult254_g2 = clamp( ( length( ( ase_worldPos - _WorldSpaceCameraPos ) ) * 50.0 * clampResult89_g2 ) , 0.0 , 1.0 );
				float clampResult90_g2 = clamp( _Attenuation_Exponent , 0.0 , 100.0 );
				#ifdef _USE_ATTENUATION_ON
				float staticSwitch43_g2 = ( 1.0 * ( 1.0 / pow( clampResult254_g2 , clampResult90_g2 ) ) );
				#else
				float staticSwitch43_g2 = 1.0;
				#endif
				float clampResult87_g2 = clamp( _LensEffect_Distance , 0.0 , 100.0 );
				float clampResult83_g2 = clamp( ( clampResult87_g2 - length( ( ase_worldPos - _WorldSpaceCameraPos ) ) ) , 0.0 , clampResult87_g2 );
				float clampResult88_g2 = clamp( _LensEffect_DistanceExponent , 0.0 , 100.0 );
				float temp_output_85_0_g2 = pow( clampResult83_g2 , clampResult88_g2 );
				float lerpResult72_g2 = lerp( staticSwitch43_g2 , ( staticSwitch43_g2 * ( temp_output_85_0_g2 + 1.0 ) ) , _Use_LensEffect);
				float temp_output_104_0_g2 = ( _Variation_Shift / 100.0 );
				float4 appendResult98_g2 = (float4(( inputMesh.ase_color.g + temp_output_104_0_g2 ) , 0.0 , 0.0 , 0.0));
				float4 tex2DNode97_g2 = tex2Dlod( _Size, float4( appendResult98_g2.xy, 0, 0.0) );
				float3 linearToGamma267_g2 = FastLinearToSRGB( tex2DNode97_g2.rgb );
				float4 lerpResult268_g2 = lerp( tex2DNode97_g2 , float4( linearToGamma267_g2 , 0.0 ) , _LinearWorkflow);
				float2 uv_Shape = inputMesh.ase_texcoord.xy * _Shape_ST.xy + _Shape_ST.zw;
				float4 tex2DNode204_g2 = tex2Dlod( _Shape, float4( uv_Shape, 0, 0.0) );
				float3 linearToGamma266_g2 = FastLinearToSRGB( tex2DNode204_g2.rgb );
				float4 lerpResult265_g2 = lerp( tex2DNode204_g2 , float4( linearToGamma266_g2 , 0.0 ) , _LinearWorkflow);
				float2 uv0213_g2 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_cast_16 = (0.5).xx;
				float ramp212_g2 = ( 1.0 - ( length( ( uv0213_g2 - temp_cast_16 ) ) * 2.0 ) );
				float size_exp212_g2 = _ProceduralShape_IterExp;
				float mult_exp212_g2 = 1.0;
				int MaxIter212_g2 = (int)round( _ProceduralShape_Iterations );
				float localExponentglow212_g2 = Exponentglow212_g2( ramp212_g2 , size_exp212_g2 , mult_exp212_g2 , MaxIter212_g2 );
				float clampResult255_g2 = clamp( localExponentglow212_g2 , 0.0 , 1.0 );
				float4 appendResult207_g2 = (float4(pow( clampResult255_g2 , _ProceduralShape_OutExp ) , 0.0 , 1.0 , 0.0));
				float4 lerpResult198_g2 = lerp( lerpResult265_g2 , appendResult207_g2 , _Use_ProceduralShape);
				float4 break152_g2 = lerpResult198_g2;
				float4 appendResult123_g2 = (float4(( inputMesh.ase_color.g + ( _TimeParameters.x * _Twinkle_Speed * 0.1 ) ) , 0.5 , 0.0 , 0.0));
				float4 tex2DNode125_g2 = tex2Dlod( _Twinkle_Ramp, float4( appendResult123_g2.xy, 0, 0.0) );
				#ifdef _USE_TWINKLE_ON
				float staticSwitch132_g2 = ( ( ( tex2DNode125_g2.r - 0.5 ) * _Twinkle_Strength ) + 1.0 );
				#else
				float staticSwitch132_g2 = 1.0;
				#endif
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue =  ( ( normalizeResult29_g2 * max( ( lerpResult72_g2 * 0.1 * _Size_Multiplier * lerpResult268_g2.r * ( break152_g2.z * 2.5 ) ) , ( length( ( ase_worldPos - _WorldSpaceCameraPos ) ) * _Minimum_Screen_Size * 0.002 ) ) ) * staticSwitch132_g2 );
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				o.positionCS = TransformWorldToHClip(positionRWS);
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput Vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			void Frag( VertexOutput packedInput
					#ifdef WRITE_NORMAL_BUFFER
					, out float4 outNormalBuffer : SV_Target0
						#ifdef WRITE_MSAA_DEPTH
						, out float1 depthColor : SV_Target1
						#endif
					#elif defined(WRITE_MSAA_DEPTH)
					, out float4 outNormalBuffer : SV_Target0
					, out float1 depthColor : SV_Target1
					#elif defined(SCENESELECTIONPASS)
					, out float4 outColor : SV_Target0
					#endif
					#ifdef _DEPTHOFFSET_ON
					, out float outputDepth : SV_Depth
					#endif
					
					)
			{
				UNITY_SETUP_INSTANCE_ID( packedInput );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);

				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = float3( 1.0, 1.0, 1.0 );

				SurfaceDescription surfaceDescription = (SurfaceDescription)0;
				
				surfaceDescription.Alpha = 1;
				surfaceDescription.AlphaClipThreshold =  _AlphaCutoff;

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif

				#ifdef WRITE_NORMAL_BUFFER
				EncodeIntoNormalBuffer( ConvertSurfaceDataToNormalData( surfaceData ), posInput.positionSS, outNormalBuffer );
				#ifdef WRITE_MSAA_DEPTH
				depthColor = packedInput.positionCS.z;
				#endif
				#elif defined(WRITE_MSAA_DEPTH)
				outNormalBuffer = float4( 0.0, 0.0, 0.0, 1.0 );
				depthColor = packedInput.positionCS.z;
				#elif defined(SCENESELECTIONPASS)
				outColor = float4( _ObjectId, _PassValue, 1.0, 1.0 );
				#endif
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "Motion Vectors"
			Tags { "LightMode"="MotionVectors" }

			Cull [_CullMode]

			ZWrite On

			Stencil
			{
				Ref [_StencilRefMV]
				WriteMask [_StencilWriteMaskMV]
				Comp Always
				Pass Replace
				Fail Keep
				ZFail Keep
			}


			HLSLPROGRAM
			#pragma multi_compile_instancing
			#define HAVE_MESH_MODIFICATION 1
			#define ASE_SRP_VERSION 999999

			#define SHADERPASS SHADERPASS_MOTION_VECTORS
			#pragma multi_compile _ WRITE_MSAA_DEPTH

			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _ _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
			#pragma shader_feature_local _ALPHATEST_ON
			#pragma shader_feature_local _ENABLE_FOG_ON_TRANSPARENT

			#pragma vertex Vert
			#pragma fragment Frag

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#pragma shader_feature _PERPARTICLEORIENTATION_ON
			#pragma shader_feature _USE_CAMERA_POSITION_ON
			#pragma shader_feature _USE_ATTENUATION_ON
			#pragma shader_feature _USE_TWINKLE_ON


			struct VertexInput
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float3 previousPositionOS : TEXCOORD4;
				#if defined (_ADD_PRECOMPUTED_VELOCITY)
					float3 precomputedVelocity : TEXCOORD5;
				#endif
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 vmeshPositionCS : SV_Position;
				float3 vmeshInterp00 : TEXCOORD0;
				float3 vpassInterpolators0 : TEXCOORD1; //interpolators0
				float3 vpassInterpolators1 : TEXCOORD2; //interpolators1
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START( UnityPerMaterial )
			float4 _Color_Tint;
			float4 _Shape_ST;
			float4 _Color_Gamma;
			float3 _Camera_Position;
			float _Color_Multiplier;
			float _Twinkle_Strength;
			float _Twinkle_Speed;
			float _Minimum_Screen_Size;
			float _Use_ProceduralShape;
			float _ProceduralShape_OutExp;
			float _ProceduralShape_Iterations;
			float _ProceduralShape_IterExp;
			float _Variation_Shift;
			float _Size_Multiplier;
			float _Use_LensEffect;
			float _LensEffect_DistanceExponent;
			float _LensEffect_Distance;
			float _Attenuation_Exponent;
			float _Attenuation_Strength;
			float _LinearWorkflow;
			float _Color_Saturation;
			float4 _EmissionColor;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			#ifdef _ENABLE_SHADOW_MATTE
			float _ShadowMatteFilter;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _AlphaCutoff;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			float _TessPhongStrength;
			float _TessValue;
			float _TessMin;
			float _TessMax;
			float _TessEdgeLength;
			float _TessMaxDisp;
			CBUFFER_END
			sampler2D _Size;
			sampler2D _Shape;
			sampler2D _Twinkle_Ramp;


			float Exponentglow212_g2( float ramp , float size_exp , float mult_exp , int MaxIter )
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
			

			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			void BuildSurfaceData(FragInputs fragInputs, SurfaceDescription surfaceDescription, float3 V, out SurfaceData surfaceData)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);
			}

			void GetSurfaceAndBuiltinData(SurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#if _ALPHATEST_ON
				DoAlphaTest ( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				BuildSurfaceData(fragInputs, surfaceDescription, V, surfaceData);
				ZERO_INITIALIZE(BuiltinData, builtinData);
				builtinData.opacity =  surfaceDescription.Alpha;
			}

			VertexInput ApplyMeshModification(VertexInput inputMesh, float3 timeParameters, inout VertexOutput o )
			{
				_TimeParameters.xyz = timeParameters;
				float2 uv062_g2 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 break63_g2 = ( uv062_g2 - float2( 0.5,0.5 ) );
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult12_g2 = normalize( ( ase_worldPos - _Camera_Position ) );
				#ifdef _USE_CAMERA_POSITION_ON
				float3 staticSwitch14_g2 = normalizeResult12_g2;
				#else
				float3 staticSwitch14_g2 = ase_worldViewDir;
				#endif
				float3 temp_output_17_0_g2 = mul( float4( staticSwitch14_g2 , 0.0 ), GetObjectToWorldMatrix() ).xyz;
				float3 temp_output_21_0_g2 = cross( float3(0,1,0) , temp_output_17_0_g2 );
				float3 normalizeResult23_g2 = normalize( cross( temp_output_21_0_g2 , temp_output_17_0_g2 ) );
				float2 uv05_g2 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 break18_g2 = ( uv05_g2 - float2( 0.5,0.5 ) );
				float3 normalizeResult24_g2 = normalize( temp_output_21_0_g2 );
				#ifdef _PERPARTICLEORIENTATION_ON
				float3 staticSwitch38_g2 = ( ( normalizeResult23_g2 * break18_g2.y ) + ( normalizeResult24_g2 * break18_g2.x * -1.0 ) );
				#else
				float3 staticSwitch38_g2 = ( ( mul( float4( float3(1,0,0) , 0.0 ), mul(GetWorldToHClipMatrix(),GetObjectToWorldMatrix()) ).xyz * break63_g2.x ) + ( mul( float4( float3(0,1,0) , 0.0 ), mul(GetWorldToHClipMatrix(),GetObjectToWorldMatrix()) ).xyz * break63_g2.y ) );
				#endif
				float3 normalizeResult29_g2 = normalize( staticSwitch38_g2 );
				float clampResult89_g2 = clamp( _Attenuation_Strength , 0.0 , 100.0 );
				float clampResult254_g2 = clamp( ( length( ( ase_worldPos - _WorldSpaceCameraPos ) ) * 50.0 * clampResult89_g2 ) , 0.0 , 1.0 );
				float clampResult90_g2 = clamp( _Attenuation_Exponent , 0.0 , 100.0 );
				#ifdef _USE_ATTENUATION_ON
				float staticSwitch43_g2 = ( 1.0 * ( 1.0 / pow( clampResult254_g2 , clampResult90_g2 ) ) );
				#else
				float staticSwitch43_g2 = 1.0;
				#endif
				float clampResult87_g2 = clamp( _LensEffect_Distance , 0.0 , 100.0 );
				float clampResult83_g2 = clamp( ( clampResult87_g2 - length( ( ase_worldPos - _WorldSpaceCameraPos ) ) ) , 0.0 , clampResult87_g2 );
				float clampResult88_g2 = clamp( _LensEffect_DistanceExponent , 0.0 , 100.0 );
				float temp_output_85_0_g2 = pow( clampResult83_g2 , clampResult88_g2 );
				float lerpResult72_g2 = lerp( staticSwitch43_g2 , ( staticSwitch43_g2 * ( temp_output_85_0_g2 + 1.0 ) ) , _Use_LensEffect);
				float temp_output_104_0_g2 = ( _Variation_Shift / 100.0 );
				float4 appendResult98_g2 = (float4(( inputMesh.ase_color.g + temp_output_104_0_g2 ) , 0.0 , 0.0 , 0.0));
				float4 tex2DNode97_g2 = tex2Dlod( _Size, float4( appendResult98_g2.xy, 0, 0.0) );
				float3 linearToGamma267_g2 = FastLinearToSRGB( tex2DNode97_g2.rgb );
				float4 lerpResult268_g2 = lerp( tex2DNode97_g2 , float4( linearToGamma267_g2 , 0.0 ) , _LinearWorkflow);
				float2 uv_Shape = inputMesh.ase_texcoord.xy * _Shape_ST.xy + _Shape_ST.zw;
				float4 tex2DNode204_g2 = tex2Dlod( _Shape, float4( uv_Shape, 0, 0.0) );
				float3 linearToGamma266_g2 = FastLinearToSRGB( tex2DNode204_g2.rgb );
				float4 lerpResult265_g2 = lerp( tex2DNode204_g2 , float4( linearToGamma266_g2 , 0.0 ) , _LinearWorkflow);
				float2 uv0213_g2 = inputMesh.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_cast_16 = (0.5).xx;
				float ramp212_g2 = ( 1.0 - ( length( ( uv0213_g2 - temp_cast_16 ) ) * 2.0 ) );
				float size_exp212_g2 = _ProceduralShape_IterExp;
				float mult_exp212_g2 = 1.0;
				int MaxIter212_g2 = (int)round( _ProceduralShape_Iterations );
				float localExponentglow212_g2 = Exponentglow212_g2( ramp212_g2 , size_exp212_g2 , mult_exp212_g2 , MaxIter212_g2 );
				float clampResult255_g2 = clamp( localExponentglow212_g2 , 0.0 , 1.0 );
				float4 appendResult207_g2 = (float4(pow( clampResult255_g2 , _ProceduralShape_OutExp ) , 0.0 , 1.0 , 0.0));
				float4 lerpResult198_g2 = lerp( lerpResult265_g2 , appendResult207_g2 , _Use_ProceduralShape);
				float4 break152_g2 = lerpResult198_g2;
				float4 appendResult123_g2 = (float4(( inputMesh.ase_color.g + ( _TimeParameters.x * _Twinkle_Speed * 0.1 ) ) , 0.5 , 0.0 , 0.0));
				float4 tex2DNode125_g2 = tex2Dlod( _Twinkle_Ramp, float4( appendResult123_g2.xy, 0, 0.0) );
				#ifdef _USE_TWINKLE_ON
				float staticSwitch132_g2 = ( ( ( tex2DNode125_g2.r - 0.5 ) * _Twinkle_Strength ) + 1.0 );
				#else
				float staticSwitch132_g2 = 1.0;
				#endif
				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = ( ( normalizeResult29_g2 * max( ( lerpResult72_g2 * 0.1 * _Size_Multiplier * lerpResult268_g2.r * ( break152_g2.z * 2.5 ) ) , ( length( ( ase_worldPos - _WorldSpaceCameraPos ) ) * _Minimum_Screen_Size * 0.002 ) ) ) * staticSwitch132_g2 );

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif
				inputMesh.normalOS =  inputMesh.normalOS ;
				return inputMesh;
			}

			VertexOutput VertexFunction(VertexInput inputMesh)
			{
				VertexOutput o = (VertexOutput)0;
				VertexInput defaultMesh = inputMesh;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				inputMesh = ApplyMeshModification( inputMesh, _TimeParameters.xyz, o);

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);

				float3 VMESHpositionRWS = positionRWS;
				float4 VMESHpositionCS = TransformWorldToHClip(positionRWS);

				//#if defined(UNITY_REVERSED_Z)
				//	VMESHpositionCS.z -= unity_MotionVectorsParams.z * VMESHpositionCS.w;
				//#else
				//	VMESHpositionCS.z += unity_MotionVectorsParams.z * VMESHpositionCS.w;
				//#endif

				float4 VPASSpreviousPositionCS;
				float4 VPASSpositionCS = mul(UNITY_MATRIX_UNJITTERED_VP, float4(VMESHpositionRWS, 1.0));

				bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
				if (forceNoMotion)
				{
					VPASSpreviousPositionCS = float4(0.0, 0.0, 0.0, 1.0);
				}
				else
				{
					bool hasDeformation = unity_MotionVectorsParams.x > 0.0;
					float3 effectivePositionOS = (hasDeformation ? inputMesh.previousPositionOS : defaultMesh.positionOS);
					#if defined(_ADD_PRECOMPUTED_VELOCITY)
					effectivePositionOS -= inputMesh.precomputedVelocity;
					#endif

					#if defined(HAVE_MESH_MODIFICATION)
						VertexInput previousMesh = defaultMesh;
						previousMesh.positionOS = effectivePositionOS ;
						VertexOutput test = (VertexOutput)0;
						float3 curTime = _TimeParameters.xyz;
						previousMesh = ApplyMeshModification(previousMesh, _LastTimeParameters.xyz, test);
						_TimeParameters.xyz = curTime;
						float3 previousPositionRWS = TransformPreviousObjectToWorld(previousMesh.positionOS);
					#else
						float3 previousPositionRWS = TransformPreviousObjectToWorld(effectivePositionOS);
					#endif

					#ifdef ATTRIBUTES_NEED_NORMAL
						float3 normalWS = TransformPreviousObjectToWorldNormal(defaultMesh.normalOS);
					#else
						float3 normalWS = float3(0.0, 0.0, 0.0);
					#endif

					#if defined(HAVE_VERTEX_MODIFICATION)
						//ApplyVertexModification(inputMesh, normalWS, previousPositionRWS, _LastTimeParameters.xyz);
					#endif

					VPASSpreviousPositionCS = mul(UNITY_MATRIX_PREV_VP, float4(previousPositionRWS, 1.0));
				}

				o.vmeshPositionCS = VMESHpositionCS;
				o.vmeshInterp00.xyz = VMESHpositionRWS;

				o.vpassInterpolators0 = float3(VPASSpositionCS.xyw);
				o.vpassInterpolators1 = float3(VPASSpreviousPositionCS.xyw);
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float3 previousPositionOS : TEXCOORD4;
				#if defined (_ADD_PRECOMPUTED_VELOCITY)
					float3 precomputedVelocity : TEXCOORD5;
				#endif
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.previousPositionOS = v.previousPositionOS;
				#if defined (_ADD_PRECOMPUTED_VELOCITY)
					o.precomputedVelocity = v.precomputedVelocity;
				#endif
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.previousPositionOS = patch[0].previousPositionOS * bary.x + patch[1].previousPositionOS * bary.y + patch[2].previousPositionOS * bary.z;
				#if defined (_ADD_PRECOMPUTED_VELOCITY)
					o.precomputedVelocity = patch[0].precomputedVelocity * bary.x + patch[1].precomputedVelocity * bary.y + patch[2].precomputedVelocity * bary.z;
				#endif
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput Vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			void Frag( VertexOutput packedInput
						, out float4 outMotionVector : SV_Target0
						#ifdef WRITE_NORMAL_BUFFER
						, out float4 outNormalBuffer : SV_Target1
							#ifdef WRITE_MSAA_DEPTH
								, out float1 depthColor : SV_Target2
							#endif
						#elif defined(WRITE_MSAA_DEPTH)
						, out float4 outNormalBuffer : SV_Target1
						, out float1 depthColor : SV_Target2
						#endif

						#ifdef _DEPTHOFFSET_ON
							, out float outputDepth : SV_Depth
						#endif
						
					)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.vmeshPositionCS;
				input.positionRWS = packedInput.vmeshInterp00.xyz;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				SurfaceDescription surfaceDescription = (SurfaceDescription)0;
				
				surfaceDescription.Alpha = 1;
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				float4 VPASSpositionCS = float4(packedInput.vpassInterpolators0.xy, 0.0, packedInput.vpassInterpolators0.z);
				float4 VPASSpreviousPositionCS = float4(packedInput.vpassInterpolators1.xy, 0.0, packedInput.vpassInterpolators1.z);

				#ifdef _DEPTHOFFSET_ON
				VPASSpositionCS.w += builtinData.depthOffset;
				VPASSpreviousPositionCS.w += builtinData.depthOffset;
				#endif

				float2 motionVector = CalculateMotionVector( VPASSpositionCS, VPASSpreviousPositionCS );
				EncodeMotionVector( motionVector * 0.5, outMotionVector );

				bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
				if( forceNoMotion )
					outMotionVector = float4( 2.0, 0.0, 0.0, 0.0 );

				#ifdef WRITE_NORMAL_BUFFER
				EncodeIntoNormalBuffer( ConvertSurfaceDataToNormalData( surfaceData ), posInput.positionSS, outNormalBuffer );

				#ifdef WRITE_MSAA_DEPTH
				depthColor = packedInput.vmeshPositionCS.z;
				#endif
				#elif defined(WRITE_MSAA_DEPTH)
				outNormalBuffer = float4( 0.0, 0.0, 0.0, 1.0 );
				depthColor = packedInput.vmeshPositionCS.z;
				#endif

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif
			}

			ENDHLSL
		}

	
	}
	CustomEditor "UnityEditor.Rendering.HighDefinition.HDLitGUI"
	Fallback "Hidden/InternalErrorShader"
	
}
/*ASEBEGIN
Version=18100
2560;245;1919;1005;961.5;381;1;True;True
Node;AmplifyShaderEditor.FunctionNode;17;-387,-3.5;Inherit;False;StarCluster_AmplifyShaderFunction;0;;2;7ac8d45e9b71a274ebee5f7461282171;0;0;2;FLOAT3;0;FLOAT3;1
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;10;0,0;Float;False;True;-1;2;UnityEditor.Rendering.HighDefinition.HDLitGUI;0;14;StarClusterPack/StarCluster_HDRP;7f5cb9c3ea6481f469fdd856555439ef;True;Forward Unlit;0;0;Forward Unlit;9;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Transparent=Queue=400;True;5;0;True;1;0;True;-20;0;True;-21;1;0;True;-22;0;True;-23;False;False;True;0;True;-26;False;True;True;0;True;-5;255;False;-1;255;True;-6;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;0;True;-24;True;0;True;-32;False;True;1;LightMode=ForwardOnly;False;0;Hidden/InternalErrorShader;0;0;Standard;29;Surface Type;1;  Rendering Pass ;0;  Rendering Pass;2;  Blending Mode;2;  Receive Fog;1;  Distortion;0;    Distortion Mode;0;    Distortion Only;1;  Depth Write;0;  Cull Mode;0;  Depth Test;0;Double-Sided;0;Alpha Clipping;0;Motion Vectors;1;  Add Precomputed Velocity;0;Shadow Matte;0;Cast Shadows;1;DOTS Instancing;0;GPU Instancing;1;Tessellation;0;  Phong;0;  Strength;0.5,False,-1;  Type;0;  Tess;16,False,-1;  Min;10,False,-1;  Max;25,False,-1;  Edge Length;16,False,-1;  Max Displacement;25,False,-1;Vertex Position,InvertActionOnDeselection;1;0;7;True;True;True;True;True;True;False;False;;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;11;0,0;Float;False;False;-1;2;UnityEditor.Rendering.HighDefinition.HDLitGUI;0;14;New Amplify Shader;7f5cb9c3ea6481f469fdd856555439ef;True;ShadowCaster;0;1;ShadowCaster;0;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;0;False;False;False;True;0;True;-26;True;False;False;False;False;0;False;-1;False;True;1;False;-1;False;False;True;1;LightMode=ShadowCaster;False;0;Hidden/InternalErrorShader;0;0;Standard;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;12;0,0;Float;False;False;-1;2;UnityEditor.Rendering.HighDefinition.HDLitGUI;0;14;New Amplify Shader;7f5cb9c3ea6481f469fdd856555439ef;True;META;0;2;META;0;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;0;False;False;False;True;2;False;-1;False;False;False;False;False;True;1;LightMode=Meta;False;0;Hidden/InternalErrorShader;0;0;Standard;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;13;0,0;Float;False;False;-1;2;UnityEditor.Rendering.HighDefinition.HDLitGUI;0;14;New Amplify Shader;7f5cb9c3ea6481f469fdd856555439ef;True;SceneSelectionPass;0;3;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;0;False;False;False;True;0;True;-26;True;False;False;False;False;0;False;-1;False;True;1;False;-1;False;False;True;1;LightMode=SceneSelectionPass;False;0;Hidden/InternalErrorShader;0;0;Standard;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;14;0,0;Float;False;False;-1;2;UnityEditor.Rendering.HighDefinition.HDLitGUI;0;14;New Amplify Shader;7f5cb9c3ea6481f469fdd856555439ef;True;DepthForwardOnly;0;4;DepthForwardOnly;0;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;0;False;False;False;True;0;True;-26;False;True;True;0;True;-7;255;False;-1;255;True;-8;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;False;-1;False;False;True;1;LightMode=DepthForwardOnly;False;0;Hidden/InternalErrorShader;0;0;Standard;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;15;0,0;Float;False;False;-1;2;UnityEditor.Rendering.HighDefinition.HDLitGUI;0;14;New Amplify Shader;7f5cb9c3ea6481f469fdd856555439ef;True;Motion Vectors;0;5;Motion Vectors;0;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;0;False;False;False;True;0;True;-26;False;True;True;0;True;-9;255;False;-1;255;True;-10;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;False;-1;False;False;True;1;LightMode=MotionVectors;False;0;Hidden/InternalErrorShader;0;0;Standard;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;16;0,0;Float;False;False;-1;2;UnityEditor.Rendering.HighDefinition.HDLitGUI;0;14;New Amplify Shader;7f5cb9c3ea6481f469fdd856555439ef;True;DistortionVectors;0;6;DistortionVectors;0;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;0;True;4;1;False;-1;1;False;-1;4;1;False;-1;1;False;-1;True;1;False;-1;1;False;-1;False;True;0;True;-26;False;True;True;0;True;-11;255;False;-1;255;True;-12;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;2;False;-1;True;3;False;-1;False;True;1;LightMode=DistortionVectors;False;0;Hidden/InternalErrorShader;0;0;Standard;0;0
WireConnection;10;0;17;0
WireConnection;10;6;17;1
ASEEND*/
//CHKSM=36AA431BA9A783C9D10A1BECE6318331584FDA94