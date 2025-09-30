using UnityEngine;

public class GamingColor : MonoBehaviour
{
    public Renderer targetRenderer;
    private Material material;

    private Color[] colors = new Color[]
    {
        Color.red,
        Color.orange,
        Color.yellow,
        Color.green,
        Color.cyan,
        Color.blue,
        Color.violet,
    };

    private int currentIndex = 0;
    private int nextIndex = 1;
    private float timer = 0f;
    public float fadeDuration = 2f; //�t�F�[�h�ɂ����鎞��(s)

    void Start()
    {
        material = targetRenderer.material;
        material.SetColor("_Color", colors[currentIndex]);
    }

    void Update()
    {
        timer += Time.deltaTime;
        float t = timer / fadeDuration;

        //���炩�ɐF��ω�������
        Color currentColor = Color.Lerp(colors[currentIndex], colors[nextIndex], t);
        material.SetColor("_Color", currentColor);

        if(t >= 1f)
        {
            timer = 0f;
            currentIndex = nextIndex;
            nextIndex = (nextIndex + 1) % colors.Length;
        }
    }
}
