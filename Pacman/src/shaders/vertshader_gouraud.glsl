#version 330 core

layout(location = 0) in vec3 vertexPosition;
layout(location = 1) in vec3 vertexNormal;

out vec3 fragColor; // Output final color to fragment shader

uniform mat4 modelViewTransform;
uniform mat4 projectionTransform;
uniform mat3 normalMatrix;
uniform vec3 lightPosition;
uniform vec3 materialColor;
uniform float ka; // Ambient coefficient
uniform float kd; // Diffuse coefficient
uniform float ks; // Specular coefficient
uniform float p; // Specular exponent

void main() {
    //lighting
    vec3 fragPosition = vec3(modelViewTransform * vec4(vertexPosition, 1.0));
    vec3 fragToLight = lightPosition - fragPosition;
    vec3 lightDir = normalize(fragToLight);
    vec3 normal = normalize(normalMatrix * vertexNormal);


    vec3 ambient = ka * materialColor;

    //diffuse component
    float diff = max(dot(normal, lightDir), 0.0);
    vec3 diffuse = kd * diff * materialColor;

    //specular component
    vec3 viewDir = normalize(-fragPosition); // Assuming camera at origin
    vec3 reflectDir = reflect(-lightDir, normal);
    float spec = pow(max(dot(viewDir, reflectDir), 0.0), p);
    vec3 specular = ks * spec * vec3(1.0); // Assuming white light color for simplicity


    fragColor = ambient + diffuse + specular;

    gl_Position = projectionTransform * modelViewTransform * vec4(vertexPosition, 1.0);
}
