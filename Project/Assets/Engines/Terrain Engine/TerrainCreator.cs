using UnityEngine;
using System.Collections;
using System.Collections.Generic;

/// <summary>
/// this is the terrain creator engine Version 1.0 created by Somniis Assoc.
/// </summary>
public class TerrainCreator : MonoBehaviour
{
    public GameObject ground;

    void Start()
    {
        GenerateFirstFloor();

    }

    void GenerateFirstFloor()
    {
        //this for loop will generate the X-axis or rows,
        /*It works by this way: generate a whole row, so check if is necessary to create an another 
         column. If yes, the variable I return to zero and the variable index increment one, when the
         index return 8, the work is ceased*/
        int index = 0;
        for (int i = 0; i < 8; i++)
        {
            float X = 2.9f * i;
            float Z = 2.9f * index;
            Instantiate(ground, new Vector3(X, 0, Z), new Quaternion(0, 0, 0, 0));

            if (i == 7 && index < 7)
            /*this -1 is for when the increment happens, the variable return 0*/
            { i = -1; index++; }
        }

        //when this void finishes it work, it will call the second void
        GenerateSecondFloor();
    }

    struct ForwardDirection
    {
        public float x;
        public float z;
    }

    List<ForwardDirection> ValidMatrix = new List<ForwardDirection>();
    void GenerateSecondFloor()
    {
        /*this void is quite similar to GenerateFirstFloor, the difference is in the random, some ground will be placed,
         and some ground will not be placed*/
        int index = 0;
        for (int i = 0; i < 8; i++)
        {
            float X = 2.9f * i;
            float Z = 2.9f * index;
            ForwardDirection forward = new ForwardDirection();
            if (Random.Range(0, 4) < 2/*changing this 2 I can control partially the level of instances*/)
            {
                Instantiate(ground, new Vector3(forward.x = X, 1, forward.z = Z), new Quaternion(0, 0, 0, 0));
                ValidMatrix.Add(forward);
            }

            if (i == 7 && index < 7)
            { i = -1; index++; }
        }

        //when this void finishes it work, it will call the Third void
        GenerateThirdFloor();
    }

    void GenerateThirdFloor()
    {
        /*the simplest void, it only check in validMatrix where place the Third floor and make a decision, if 
         a ground will be placed or will not*/
        foreach (ForwardDirection ford in ValidMatrix)
        {
            if (Random.Range(0, 2) == 0 /*changing this second 0 I can control partially the level of instances*/)
            {
                Instantiate(ground, new Vector3(ford.x, 2, ford.z), new Quaternion(0, 0, 0, 0));
            }
        }

        GameObject[] grounds = GameObject.FindGameObjectsWithTag("Ground");
        foreach (GameObject ground in grounds)
        {
            ground.transform.parent = transform;
        }
    }
}
