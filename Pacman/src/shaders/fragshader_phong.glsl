#version 330 core

in vec3 fragPosition; //Input fragment position in view space
in vec3 fragNormal; //Input fragment normal in view space

in vec2 fragTextureCoords; // Input fragment texture coordinates

out vec4 finalColor; // Output color to the framebuffer

uniform vec3 lightPosition;
uniform sampler2D samplerUniform; // New uniform for texture sampler
uniform float ka; // Ambient coefficient
uniform float kd; // Diffuse coefficient
uniform float ks; // Specular coefficient
uniform float p; // Specular exponent

void main() {
    // Lighting
    vec3 fragToLight = lightPosition - fragPosition;
    vec3 lightDir = normalize(fragToLight);
    vec3 normal = normalize(fragNormal);

    //ambient
    vec3 ambient = ka * texture(samplerUniform, fragTextureCoords).rgb;

    //diffuse component
    float diff = max(dot(normal, lightDir), 0.0);
    vec3 diffuse = kd * diff * texture(samplerUniform, fragTextureCoords).rgb;

    //specular component
    vec3 viewDir = normalize(-fragPosition);
    vec3 reflectDir = reflect(-lightDir, normal);
    float spec = pow(max(dot(viewDir, reflectDir), 0.0), p);
    vec3 specular = ks * spec * vec3(1.0);


    vec3 fragColor = ambient + diffuse + specular;

    finalColor = vec4(fragColor, 1.0);
}
