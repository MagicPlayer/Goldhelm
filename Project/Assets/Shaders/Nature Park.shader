Shader "Somniis/Natural Park" {
	Properties{
		_ColorTint ("Color", Color) = (1.0,.3,.2576,1)
		_RimPower ("Rim Power", Range(0.2,10.0)) = 3.0
	  	_MainTex ("Texture", 2D) = "white" {}
	  	_BumpMap ("BumpMap", 2D) = "bump" {}
  }  	
  	//with Normal Map
  	//it can be a bit expensive to renderer but
  	//its more beauty
//  	SubShader{
//  		Name "With_Normal"
//  		tags {"RenderType" = "Opaque"}
//  		
//  		CGPROGRAM
//  		#pragma surface surf Lambert
//  		struct Input {
//  			fixed2 uv_MainTex;
//  			fixed2 uv_BumpMap;
//  			fixed3 viewDir;
//  		};
//  		
//  		fixed4 _ColorTint;  		
//  		sampler2D _MainTex;
//  		sampler2D _BumpMap;
//  		float _RimPower;
//  		void surf (Input IN, inout SurfaceOutput o){
//  			o.Albedo = tex2D (_MainTex, IN.uv_MainTex).rgb * 0.5;
//  			o.Normal = UnpackNormal (tex2D(_BumpMap, IN.uv_BumpMap)).rgb * 1,34;
//  			half rim = 1.0 - saturate(dot (normalize(IN.viewDir), o.Normal));
//  			o.Emission = _ColorTint.rgb * pow (rim, _RimPower);
//  			
//  		}
//  		ENDCG
//  	
//  	}
  	
  	//without normal Map
//  	SubShader{
//  		Name "Without_Normal"
//  		tags {"RenderType" = "Opaque"}
//  		
//  		CGPROGRAM
//  		#pragma surface surf Lambert
//  		struct Input {
//  			fixed2 uv_MainTex;
//  			fixed3 viewDir;
//  		};
//  		
//  		fixed4 _ColorTint;  		
//  		sampler2D _MainTex;
//  		sampler2D _BumpMap;
//  		float _RimPower;
//  		void surf (Input IN, inout SurfaceOutput o){
//  			o.Albedo = tex2D (_MainTex, IN.uv_MainTex).rgb * 0.5;
//  			half rim = 1.0 - saturate(dot (normalize(IN.viewDir), o.Normal));
//  			o.Emission = _ColorTint.rgb * pow (rim, _RimPower);
//  			
//  		}
//  		ENDCG
//  	}
//  	
  	//this last one is chep but,
  	//its not so good like the others
  	SubShader {
		Tags { "RenderType"="Opaque" }
		
		CGPROGRAM
		#pragma surface surf Lambert
		
		struct Input{
			fixed2 uv_MainTex;
			fixed4 uv_Effect;
		};
		
		sampler2D _MainTex;
		fixed4 _Effect;
		void surf (Input IN, inout SurfaceOutput o){
			o.Albedo = tex2D (_MainTex, IN.uv_MainTex).rgb * 0.5;
			o.Emission = _Effect.rgb;
		}
		ENDCG
	}
  }