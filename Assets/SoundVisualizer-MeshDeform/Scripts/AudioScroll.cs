using UnityEngine;
using UnityEngine.UI;

public class AudioScroll : MonoBehaviour
{
    public AudioSource audio;

    public Slider TimeLine;

    // Flag to know if we are draging the Timeline handle
    private bool TimeLineOnDrag = false;

    void Update()
    {
        if (audio.clip.samples == 0) return;
        if (TimeLineOnDrag)
        {
            audio.timeSamples = (int)(audio.clip.samples * TimeLine.value);
        }
        else
        {
            if (audio.clip) TimeLine.value = (float)audio.timeSamples / (float)audio.clip.samples;

        }
    }

    // Called by the event trigger when the drag begin
    public void TimeLineOnBeginDrag()
    {
        TimeLineOnDrag = true;
        audio.Pause();
    }


    // Called at the end of the drag of the TimeLine
    public void TimeLineOnEndDrag()
    {
        audio.Play();
        TimeLineOnDrag = false;
    }
}

