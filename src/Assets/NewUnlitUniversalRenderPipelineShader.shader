Shader "Custom/NewUnlitUniversalRenderPipelineShader"
{
    Properties //Unity上での表示が決まる部分
    {
        _Color("Color", Color) = (1, 1, 1, 1)
        //[MainTexture] _BaseMap("Base Map", 2D) = "white"
    }

    SubShader
    {
        Tags { "RenderType" = "Opaque" }
        LOD 100

        Pass
        {
            Cull Back //裏面を削除
            ZTest LEqual //手前にあるものを描画

            HLSLPROGRAM //HLSL

            #pragma vertex vert
            #pragma fragment frag

            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

            struct Attributes
            {
                float4 positionOS : POSITION;
                //float2 uv : TEXCOORD0;
                //float3 normal : NORMAL;
            };

            struct Varyings
            {
                float4 positionHCS : SV_POSITION;
                //float2 uv : TEXCOORD0;
                //float3 normal : NORMAL;
            };

            float4 _Color;

            //TEXTURE2D(_BaseMap);
            //SAMPLER(sampler_BaseMap);

            //CBUFFER_START(UnityPerMaterial)
            //    half4 _BaseColor;
            //    float4 _BaseMap_ST;
            //CBUFFER_END

            Varyings vert(Attributes IN)
            {
                Varyings OUT;
                OUT.positionHCS = TransformObjectToHClip(IN.positionOS.xyz);
                //OUT.uv = TRANSFORM_TEX(IN.uv, _BaseMap);
                //OUT.normal = IN.normal.xyz;
                return OUT;
            }

            half4 frag(Varyings IN) : SV_Target
            {
                //half4 color = SAMPLE_TEXTURE2D(_BaseMap, sampler_BaseMap, IN.uv) * _BaseColor;
                //half4 color = half4(1,1,0,1); //赤、緑、青、不透明度
                //half4 color = half4(IN.normal.xyz*0.5+0.5,1);
                //half4 color = lerp(half4(1,0,0,1), half4(0,0,1,1), IN.normal.x*0.5+0.5); //赤から青へのグラデーション

                return _Color;
            }
            ENDHLSL
        }
    }
}
