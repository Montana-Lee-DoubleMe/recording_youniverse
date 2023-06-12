using System;
using UnityEngine;

[RequireComponent(typeof(AudioSource))]
public class AudioPeer : MonoBehaviour
{

    public static AudioPeer me;

    public float DownScaleMaxTime = 7.0f;
    public float DownScaleMaxRatio = 0.9f;

    public float BufferStep = 0.0007F;
    public float BufferFallSpeed = 1.3f;


    public static float[] _samples = new float[512];

    //RAW data from channel
    public static float[] _freqBand = new float[8];
    //Smoothed raw data (to avoid flickering)
    public static float[] _bandBuffer = new float[8];
    //Normalized data from channel (0..1)
    public static float[] _audioBand = new float[8];
    //Smoothed and normalized audio data
    public static float[] _audioBandBuffers = new float[8];


    private AudioSource _audioSource;
    private float[] _bufferDecrease = new float[8];
    private float[] _freqBandHighest = new float[8];

    private float ZERO_TOLERANCE = 0.000001f;

    void Awake()
    {

        // As we use static vars, it's good idea to
        // clear data from arrays periodically
        Array.Clear(_samples, 0, _samples.Length);
        Array.Clear(_freqBand, 0, _freqBand.Length);
        Array.Clear(_bandBuffer, 0, _bandBuffer.Length);
        Array.Clear(_bufferDecrease, 0, _bufferDecrease.Length);
        Array.Clear(_freqBandHighest, 0, _freqBandHighest.Length);
        Array.Clear(_audioBand, 0, _audioBand.Length);
        Array.Clear(_audioBandBuffers, 0, _audioBandBuffers.Length);

        me = this;
        _audioSource = GetComponent<AudioSource>();

        InvokeRepeating("DownMax", 0.01f, DownScaleMaxTime);
    }


    //If track has different musical parts, it's good idea slightly drop maximum frequency.
    void DownMax()
    {
        for (int i = 0; i < 8; ++i)
        {
            _freqBandHighest[i] = _freqBandHighest[i] * DownScaleMaxRatio;
        }
    }

    //Normalization of channels
    void CreateAudioBands()
    {
        for (int i = 0; i < 8; ++i)
        {
            if (_freqBand[i] > _freqBandHighest[i])
            {
                _freqBandHighest[i] = _freqBand[i];
            }
            if (_freqBandHighest[i] == 0) _freqBandHighest[i] = ZERO_TOLERANCE;

            _audioBand[i] = (_freqBand[i] / _freqBandHighest[i]);
            _audioBandBuffers[i] = (_bandBuffer[i] / _freqBandHighest[i]);
        }
    }

    void Update()
    {
        GetSpectrumAudioSource();
        MakeFrequencyBands();
        BandBuffer();
        CreateAudioBands();
    }

    //Smoothing audio data
    void BandBuffer()
    {
        //If we got GREATER value, then we assign this value Instanly
        for (int i = 0; i < 8; ++i)
        {
            if (_freqBand[i] > _bandBuffer[i])
            {
                _bandBuffer[i] = _freqBand[i];
                _bufferDecrease[i] = BufferStep;
            }
        }
        //If we got lesser value, than we continiously decrease current value on "BufferStep"
        for (int i = 0; i < 8; ++i)
        {
            if (_freqBand[i] < _bandBuffer[i])
            {
                if (_bandBuffer[i] - _bufferDecrease[i] < 0)
                {
                    //to avoid negative value
                    _bandBuffer[i] = _freqBand[i];
                    _bufferDecrease[i] = BufferStep;
                    return;
                }
                _bandBuffer[i] -= _bufferDecrease[i];
                //Better use non-linear continious decreasing. 
                //So better increase "bufferDecrease" multiplicatively for faster decreasin freq value. 
                _bufferDecrease[i] *= BufferFallSpeed;
            }
        }
    }

    void GetSpectrumAudioSource()
    {
        _audioSource.GetSpectrumData(_samples, 0, FFTWindow.Blackman);
    }

    void MakeFrequencyBands()
    {
        int count = 0;
        for (int i = 0; i < 8; ++i)
        {
            float avg = 0;
            int sampleCount = (int)Mathf.Pow(2, i) * 2;
            if (i == 7)
            {
                sampleCount += 2;
            }

            for (int j = 0; j < sampleCount; ++j)
            {
                avg += _samples[count] * (count + 1);
                ++count;
            }
            if (count != 0) avg /= count;
            _freqBand[i] = avg * 10;
        }

    }
}