#version 130

uniform mat4 projection_matrix;
uniform mat4 modelview_matrix;

in vec3 a_Vertex;
in vec2 a_TexCoord0;

in vec2 a_Position;
in vec2 a_Size;
in vec4 a_Color;

out vec2 texCoord0;

void main() 
{
	texCoord0 = a_TexCoord0;
	vec3 vert = a_Vertex + vec3(a_Position, 0);
	vec4 pos = modelview_matrix * vec4(vert, 1.0);
	gl_Position = projection_matrix * pos;
}

