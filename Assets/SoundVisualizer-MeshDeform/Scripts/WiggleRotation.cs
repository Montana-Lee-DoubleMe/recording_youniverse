using UnityEngine;

public class WiggleRotation : MonoBehaviour
{
    public float maxAngle;
    public float speedRotate;
    private bool isEnded = true;
    private Transform _tr;
    private Quaternion _endRot;
    public bool startRandom = true;
    // Use this for initialization
    void Awake()
    {
        _tr = GetComponent<Transform>();
    }
    void OnEnable()
    {
        if (startRandom)
        {
            _tr.rotation = Quaternion.Euler(Random.Range(0, 360), Random.Range(0, 360), Random.Range(0, 360));
        }
        Generate();
    }

    void Generate()
    {
        _endRot = Quaternion.Euler(Random.Range(-maxAngle, maxAngle), Random.Range(-maxAngle, maxAngle), Random.Range(-maxAngle, maxAngle));
        isEnded = false;
    }


    // Update is called once per frame
    void Update()
    {
        if (isEnded) return;
        _tr.rotation = Quaternion.RotateTowards(_tr.rotation, _endRot, speedRotate * Time.deltaTime);
        if (_tr.rotation == _endRot)
        {
            isEnded = true;
            Generate();
        }
    }
}
