Shader "Custom/NewUnlitUniversalRenderPipelineShader"
{
    Properties //Unity��ł̕\�������܂镔��
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
            Cull Back //���ʂ��폜
            ZTest LEqual //��O�ɂ�����̂�`��

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
                //half4 color = half4(1,1,0,1); //�ԁA�΁A�A�s�����x
                //half4 color = half4(IN.normal.xyz*0.5+0.5,1);
                //half4 color = lerp(half4(1,0,0,1), half4(0,0,1,1), IN.normal.x*0.5+0.5); //�Ԃ���ւ̃O���f�[�V����

                return _Color;
            }
            ENDHLSL
        }
    }
}
