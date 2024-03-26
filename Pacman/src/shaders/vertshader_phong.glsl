#version 330 core

layout(location = 0) in vec3 vertexPosition;
layout(location = 1) in vec3 vertexNormal;
layout(location = 2) in vec2 textureCoords; // New attribute for texture coordinates

out vec3 fragPosition; // Output fragment position in view space
out vec3 fragNormal; // Output fragment normal in view space
out vec2 fragTextureCoords; // Output fragment texture coordinates

uniform mat4 modelViewTransform;
uniform mat4 projectionTransform;
uniform mat3 normalMatrix;

void main() {
    //transforming vertex position to view space
    vec4 viewPosition = modelViewTransform * vec4(vertexPosition, 1.0);
    fragPosition = viewPosition.xyz;

    //passing normal to fragment shader after transformation
    fragNormal = normalize(normalMatrix * vertexNormal);



    fragTextureCoords = textureCoords;

    gl_Position = projectionTransform * viewPosition;
}
