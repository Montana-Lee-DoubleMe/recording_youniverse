using UnityEngine;
using UnityEngine.Rendering;

namespace NoiseBall
{
    [ExecuteInEditMode]
    public class NoiseBallRenderer : MonoBehaviour
    {
        #region Exposed Parameters

        [SerializeField]
        NoiseBallMesh _mesh;

        [Space]
        // [SerializeField]
        public float _radius = 0.8f;

        // [SerializeField]
        public float _noiseAmplitude = 0.05f;

        // [SerializeField]
        public float _noiseFrequency = 1.0f;

        [SerializeField]
        public float _noiseMotion = 1.0f;

        [Space]
        // [SerializeField, ColorUsage(false, true, 0, 8, 0.125f, 3)]
        [ColorUsage(false, true, 0, 8, 0.125f, 3)]

        public Color _lineColor = new Vector4(1.0f, 0.0f,0.0f,0.0f);

        // [SerializeField, ColorUsage(false)]
        [ColorUsage(false)]
        public Color _surfaceColor = Color.white;

        [SerializeField, Range(0, 1)]
        float _metallic = 0.5f;

        [SerializeField, Range(0, 1)]
        float _smoothness = 0.5f;

        [Space]
        [SerializeField]
        ShadowCastingMode _castShadows;

        [SerializeField]
        bool _receiveShadows;

        #endregion

        #region Private Resources

        [SerializeField, HideInInspector]
        Shader _surfaceShader;

        [SerializeField, HideInInspector]
        Shader _lineShader;

        #endregion

        #region Private Variables

        Material _surfaceMaterial;
        Material _lineMaterial;
        MaterialPropertyBlock _materialProperties;
        Vector3 _noiseOffset;

        #endregion

        #region MonoBehaviour Functions

        void Update()
        {
            //_lineColor.a = 0f;
            if (_surfaceMaterial == null)
            {
                _surfaceMaterial = new Material(_surfaceShader);
                _surfaceMaterial.hideFlags = HideFlags.DontSave;
            }

            if (_lineMaterial == null)
            {
                _lineMaterial = new Material(_lineShader);
                _lineMaterial.hideFlags = HideFlags.DontSave;
            }

            if (_materialProperties == null)
                _materialProperties = new MaterialPropertyBlock();

            _noiseOffset += new Vector3(0.13f, 0.82f, 0.11f) * _noiseMotion * Time.deltaTime;

            _surfaceMaterial.color = _surfaceColor;
            _lineMaterial.color = _lineColor;
            _lineMaterial.SetFloat("_Radius", _radius * 1.1f);

            _surfaceMaterial.SetFloat("_Metallic", _metallic);
            _surfaceMaterial.SetFloat("_Glossiness", _smoothness);
            _surfaceMaterial.SetFloat("_Radius", _radius);

            _materialProperties.SetFloat("_NoiseAmplitude", _noiseAmplitude);
            _materialProperties.SetFloat("_NoiseFrequency", _noiseFrequency);
            _materialProperties.SetVector("_NoiseOffset", _noiseOffset);

            Graphics.DrawMesh(
                _mesh.sharedMesh, transform.localToWorldMatrix,
                _surfaceMaterial, 0, null, 0, _materialProperties,
                _castShadows, _receiveShadows, transform
            );

            Graphics.DrawMesh(
                _mesh.sharedMesh, transform.localToWorldMatrix,
                _lineMaterial, 1, null, 1, _materialProperties,
                _castShadows, _receiveShadows, transform
            );
        }

        #endregion
    }
}
