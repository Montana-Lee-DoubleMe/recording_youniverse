using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ParticleForceFieldsDemo_CameraRig : MonoBehaviour
{
    public Transform pivot;
    Vector3 targetRotation;

    public float rotationSpeed = 2.0f;
    public float rotationLerpSpeed = 4.0f;

    Vector3 startRotation;

    void Start()
    {
        startRotation = pivot.localEulerAngles;
        targetRotation = startRotation;
    }

    void Update()
    {
        float horizontal = Input.GetAxis("Horizontal");
        float vertical = Input.GetAxis("Vertical");

        if (Input.GetKeyDown(KeyCode.R))
        {
            targetRotation = startRotation;
        }

        horizontal *= rotationSpeed;
        vertical *= rotationSpeed;

        targetRotation.y += horizontal;
        targetRotation.x += vertical;

        targetRotation.x = Mathf.Clamp(targetRotation.x, -45.0f, 45.0f);
        targetRotation.y = Mathf.Clamp(targetRotation.y, -45.0f, 45.0f);

        Vector3 currentRotation = pivot.localEulerAngles;

        currentRotation.x = Mathf.LerpAngle(currentRotation.x, targetRotation.x, Time.deltaTime * rotationLerpSpeed);
        currentRotation.y = Mathf.LerpAngle(currentRotation.y, targetRotation.y, Time.deltaTime * rotationLerpSpeed);

        pivot.localEulerAngles = currentRotation;
    }
}
