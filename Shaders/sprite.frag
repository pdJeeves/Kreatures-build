#version 130

uniform sampler2D texture0;

in vec2 texCoord0;

out vec4 colorOut;

void main() 
{
//	colorOut = vec4(texCoord0, 0, 1.0);
  colorOut = texture2D(texture0, texCoord0);
  
  if(colorOut.w == 0)
  	discard;
}

