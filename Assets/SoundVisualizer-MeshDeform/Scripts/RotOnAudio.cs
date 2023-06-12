using UnityEngine;

public class RotOnAudio : MonoBehaviour
{
    public float RotateSpeed;
    private Transform _tr;
    private Vector3 rotDir;

    //TimeEdge
    private float bandA;
    private float bandB;
    private float timeDelta;
    public float timeEdge;
    public float channelEdge;
    public int channelIndex;

    // Use this for initialization
    void Start()
    {
        _tr = GetComponent<Transform>();
    }

    void ChangeRotationVector()
    {
        rotDir = Random.insideUnitSphere;
    }

    // Update is called once per frame
    void Update()
    {
        _tr.Rotate(rotDir * Time.deltaTime * RotateSpeed);
        bandA = Time.timeSinceLevelLoad;
        timeDelta = bandA - bandB;
        //Debug.Log(timeDelta);

         // Load user audio file to IcoSphere
        GameObject theNoiseBall = GameObject.Find("NoiseBall");
        NoiseBall.NoiseBallRenderer noiseBall = theNoiseBall.GetComponent<NoiseBall.NoiseBallRenderer>();
        noiseBall._noiseFrequency = Mathf.Lerp(bandB, bandA, 0.5f) / 1000;
        //Debug.Log(bandB);

        if (timeDelta < timeEdge) return;
        bandB = bandA;
        if (AudioPeer._audioBand[channelIndex] > channelEdge)
        {
            ChangeRotationVector();
        }
    }
}
