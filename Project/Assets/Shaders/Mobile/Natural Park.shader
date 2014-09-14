Shader "Mobile/Somniis/Natural Park" {
	Properties {
		_Color ("Color",Color) = (1,1,1,1)
		_Effect ("Effect", Color) = (1,1,1,1)
		_MainTex ("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		Tags { "Queue"="Transparent" }
		pass{
			material{
				Diffuse [_Color]
				
			}
			lighting on
			SetTexture [_MainTex]{combine texture * primary DOUBLE, texture}
		}
		
		CGPROGRAM
		#pragma surface surf Lambert
		
		struct Input{
			half2 uv_Effect;
		};
		
		fixed4 _Effect;
		void surf (Input IN, inout SurfaceOutput o){
			o.Emission = _Effect.rgb;
		}
		ENDCG
	}
}