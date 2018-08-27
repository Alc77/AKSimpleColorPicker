precision highp float;

uniform vec2 uResolution;
uniform vec2 uTouch;
uniform float uPickerWidth;

//  Function from Iñigo Quiles
//  https://www.shadertoy.com/view/MsS3Wc
vec3 hsb2rgb(in vec3 c){
	vec3 rgb = clamp(abs(mod(c.x*6.0+vec3(0.0,4.0,2.0),6.0)-3.0)-1.0,0.0,1.0);
	rgb = rgb*rgb*(3.0-2.0*rgb);
	return c.z * mix(vec3(1.0), rgb, c.y);
}

void main(void)
{
	vec4 mainColor;
	vec2 pos = gl_FragCoord.xy/uResolution.xy;
	vec2 t = uTouch/uResolution.xy;
	vec2 cursorRect = uPickerWidth/uResolution.xy;
	// cursor
	if (abs(t.x - pos.x) < cursorRect.x &&
		((pos.y > (1.0 - 2.0 * cursorRect.y) && (pos.y - (1.0 - 2.0 * cursorRect.y))/cursorRect.y > abs(t.x - pos.x)/cursorRect.x) ||
		 (pos.y < 2.0 * cursorRect.y && (2.0 * cursorRect.y - pos.y)/cursorRect.y > abs(t.x - pos.x)/cursorRect.x))) {
			float colorCoef = 0.5 - 0.5 * abs(t.x - pos.x)/cursorRect.x;
			mainColor = vec4(colorCoef, colorCoef, colorCoef, 1.0);
		}
	// picker area
	else {
		vec3 color = hsb2rgb(vec3(pos.x,1.0,1.0));
		mainColor.r = color.r;
		mainColor.g = color.g;
		mainColor.b = color.b;
	}
	gl_FragColor = mainColor;
}
