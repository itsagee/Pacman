#version 330 core

in vec3 fragColor; // Input final color from vertex shader

out vec4 finalColor; // Output color to the framebuffer

void main() {
    // Output final color directly
    finalColor = vec4(fragColor, 1.0);
}
