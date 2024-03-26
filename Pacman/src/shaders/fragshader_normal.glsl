#version 330 core

// Define constants
#define M_PI 3.141593

// Specify the inputs to the fragment shader
// These must have the same type and name!
in vec3 vertNormal;

// Specify the Uniforms of the fragment shaders
// uniform vec3 lightPosition; // for example

// Specify the output of the fragment shader
// Usually a vec4 describing a color (Red, Green, Blue, Alpha/Transparency)
out vec4 fColor;

void main() {
  vec3 normalizedNormal = vertNormal;//nomralize interpolated normal
  //vec3 color = vec3(normalizedNormal.x, normalizedNormal.y, normalizedNormal.z);//map to color
  fColor = vec4((normalizedNormal.x +1)/2, (normalizedNormal.y+1)/2, (normalizedNormal.z+1)/2, 1.0F);//vec4(color, 1.0F);
}

//vec3((normalizedNormal.x +1)/2, (normalizedNormal.y+1)/2, (normalizedNormal.z+1)/2);
