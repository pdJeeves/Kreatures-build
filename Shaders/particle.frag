#version 130

uniform vec3 primaryColor;
uniform sampler2D texture0;

in vec2 texCoord0;

void main() 
{
  gl_FragColor = vec4(primaryColor, 1);
}

