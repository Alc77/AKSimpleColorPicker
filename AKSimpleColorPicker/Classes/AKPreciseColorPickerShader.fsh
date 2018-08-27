precision highp float;

uniform vec2 uResolution;
uniform vec3 uMainColor;
uniform float uPickerRadius;
uniform vec2 uPickerPosition;

void main(void) {
	vec2 position = gl_FragCoord.xy/uResolution.xy;
	vec2 pickerPos = gl_FragCoord.xy - uPickerPosition.xy;
	vec4 color;
	
	float dist = length(pickerPos);
	// inner part of the cursor
	if (dist < 0.6 * uPickerRadius && dist > 0.2 * uPickerRadius) {
		float col = 1.25 * dist/uPickerRadius - 0.25;
		color = vec4(col, col, col, 1.0);
	}
	// outer part of the cursor
	else if (dist < uPickerRadius && dist >= 0.6 * uPickerRadius) {
		float col = 1.25 - 1.25 * dist/uPickerRadius;
		color = vec4(col, col, col, 1.0);
	}
	// picker area
	else {
        color.r = position.x * (uMainColor.r + (1.0 - position.y) * (1.0 - uMainColor.r));
        color.g = position.x * (uMainColor.g + (1.0 - position.y) * (1.0 - uMainColor.g));
        color.b = position.x * (uMainColor.b + (1.0 - position.y) * (1.0 - uMainColor.b));
	}	
	gl_FragColor = color;
}
