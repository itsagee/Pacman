// #version 330 core

// // Specify the inputs to the fragment shader
// in vec3 vertNormal;

// // Specify the output of the fragment shader
// out vec4 fColor;

// void main() {
//     // Since you don't have a texture, you can use the normal as color
//     vec3 normalizedNormal = normalize(vertNormal);
//     fColor = vec4((normalizedNormal.x + 1) / 2, (normalizedNormal.y + 1) / 2, (normalizedNormal.z + 1) / 2, 1.0F);
// }

#version 330 core

// Define constants
#define M_PI 3.141593

// Specify the input locations of attributes
layout(location = 0) in vec3 vertCoordinates_in;
layout(location = 1) in vec3 vertNormal_in;

// Specify the Uniforms of the vertex shader
uniform mat4 modelViewTransform;
uniform mat4 projectionTransform;
uniform mat3 normalMatrix;

// Specify the output of the vertex stage
out vec3 vertNormal;

void main() {
  // gl_Position is the output (a vec4) of the vertex shader
  gl_Position =
      projectionTransform * modelViewTransform * vec4(vertCoordinates_in, 1.0F);
  vertNormal= normalize(normalMatrix * vertNormal_in);
}


