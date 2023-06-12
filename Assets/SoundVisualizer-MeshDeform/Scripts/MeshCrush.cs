using System;
using System.Collections.Generic;
using UnityEngine;

public class MeshCrush : MonoBehaviour
{
    public bool isSmooth = false;
    public int bandIndex = 0;


    private Mesh deformingMesh;
    private float AudioVar;
    Vector3[] originalVertices, displacedVertices, normalsOfVerts;
    private MeshFilter deformingMeshFilter;

    //Just save here index of Cortege
    private List<int> VerticleDictionary = new List<int>();


    public float MaxDistance = 2.0f;
    public float MinDistance = 0.3676f;

    // Use this for initialization
    void Start()
    {

        deformingMeshFilter = GetComponent<MeshFilter>();
        deformingMesh = deformingMeshFilter.mesh;
        originalVertices = deformingMesh.vertices;

        Array.Resize(ref normalsOfVerts, originalVertices.Length);

        for (int i = 0; i < originalVertices.Length; ++i)
        {
            normalsOfVerts[i] = GetComponent<Transform>().TransformDirection(
                deformingMesh.normals[i]);
        }

        displacedVertices = new Vector3[originalVertices.Length];
        for (int i = 0; i < originalVertices.Length; i++)
        {
            displacedVertices[i] = originalVertices[i];
        }
    }


    void Update()
    {

        if (isSmooth)
        {
            AudioVar = AudioPeer._audioBandBuffers[bandIndex];
        }
        else
        {
            AudioVar = AudioPeer._audioBand[bandIndex];
        }

        for (int i = 0; i < originalVertices.Length; ++i)
        {
            displacedVertices[i] = Vector3.Lerp(originalVertices[i] * MinDistance,
                                                originalVertices[i] - normalsOfVerts[i] * MaxDistance,
                                                AudioVar);
        }

        deformingMesh.vertices = displacedVertices;
        //deformingMesh.RecalculateTangents();
        //deformingMesh.RecalculateNormals();
        //deformingMesh.RecalculateBounds();
    }


}
