using System.Collections.Generic;
using UnityEngine;

public class MeshDeform : MonoBehaviour
{

    private float ZERO_SCALE = 0.0000001f;

    public enum DefType
    {
        Perlin,
        RandomVerticle
    };

    public int BandIndex = 0;
    public bool isSmooth = false;
    public float speed = 1.0f;

    [Tooltip("REMEMBER: You CANT change DeformType type on the fly (after Play)!")]
    public DefType DeformType = DefType.RandomVerticle;
    private DefType DeformTypePrivate;

    public bool isSlowed = false;
    public float timeEdge;

    Mesh deformingMesh;
    Vector3[] originalVertices, displacedVertices;
    private List<Vector3> firstVertces = new List<Vector3>();
    private List<Vector3> SharedV3 = new List<Vector3>();
    private List<List<int>> SharedVert = new List<List<int>>();
    private List<int> deformVertIndex;

    //Just save here index of Cortege
    private List<int> VerticleDictionary = new List<int>();

    //TimeEdge
    private float bandA;
    private float bandB;
    private float timeDelta;

    [Header("[Random Verticle]")]
    public int RandomVerticlesCountMin;
    public int RandomVerticlesCountMax;
    public float RandomVerticlesRefreshTime = 0.0f;

    [Header("[Perlin Verticle]")]
    public float PerlinResizeForce = 0.0f;
    public float PerlinScale = 0.0f;
    private MeshFilter deformingMeshFilter;

    private float timex;
    private float timey;
    private float timez;
    private float audioVar;


    // Use this for initialization
    void Start()
    {

      
    }


   

    

    void Update()
    {
                        audioVar = AudioPeer._audioBand[BandIndex];
GameObject theNoiseBall = GameObject.Find("NoiseBall");
        NoiseBall.NoiseBallRenderer noiseBall = theNoiseBall.GetComponent<NoiseBall.NoiseBallRenderer>();
        noiseBall._noiseAmplitude = audioVar*0.1f;
        noiseBall._noiseFrequency = audioVar*3;
        // noiseBall._noiseFrequency = audioVar*1;




    }
}


    
