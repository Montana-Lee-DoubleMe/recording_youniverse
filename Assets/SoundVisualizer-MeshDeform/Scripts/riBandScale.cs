using UnityEngine;

public class riBandScale : MonoBehaviour
{

    public int bandPlay;
    public bool isSmooth;
    private RectTransform rt;
    private Vector2 startSizeDelta;

    void Start()
    {
        rt = GetComponent<RectTransform>();
        startSizeDelta = rt.sizeDelta;
    }

    void Update()
    {
        if (isSmooth)
        {
            rt.sizeDelta = new Vector2(startSizeDelta.x * AudioPeer._audioBandBuffers[bandPlay], rt.sizeDelta.y);
        }
        else
        {
            rt.sizeDelta = new Vector2(startSizeDelta.x * AudioPeer._audioBand[bandPlay], rt.sizeDelta.y);
        }
    }
}
