#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;
layout (location = 2) in vec2 aTexCoord;

out vec3 FragNormal ; 
out vec3 FragPosition ;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

// TODO 6-2
// Implement Glass-Empricial shading
void main()
{
	gl_Position = projection * view * model * vec4(aPos, 1.0) ;
    FragNormal =  normalize(mat3(transpose(inverse(model))) * aNormal) ;
    FragPosition = vec3(model * vec4(aPos, 1.0)) ; 
}