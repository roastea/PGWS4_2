using UnityEngine;

public class GamingColor : MonoBehaviour
{
    public Renderer targetRenderer;
    private Material material;

    private Color[] colors = new Color[]
    {
        Color.red,
        Color.orange,
        //new Color(1f, 0.5f, 0f), //orange
        Color.yellow,
        Color.green,
        Color.cyan,
        Color.blue,
        Color.violet,
        //new Color(0.5f, 0f, 1f), //violet
    };

    private int currentIndex = 0;
    private float timer = 0f;
    public float changeInterval = 1f; //F‚ÌØ‚è‘Ö‚¦ŠÔŠu(s)

    void Start()
    {
        material = targetRenderer.material;
        material.SetColor("_Color", colors[currentIndex]);
    }

    void Update()
    {
        timer += Time.deltaTime;
        if(timer >= changeInterval)
        {
            currentIndex = (currentIndex + 1) % colors.Length;
            material.SetColor("_Color", colors[currentIndex]);
            timer = 0f;
        }
    }
}
