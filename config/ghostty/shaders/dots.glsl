#define DOT_SPACING 40.0
#define DOT_RADIUS 2.0
#define DOT_OPACITY 0.07
#define DOT_COLOR vec3(1.0, 1.0, 1.0)

void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    vec4 terminalColor = texture(iChannel0, fragCoord / iResolution.xy);

    vec2 grid = mod(fragCoord, DOT_SPACING) - DOT_SPACING * 0.5;
    float dist = length(grid);
    float dot = 1.0 - smoothstep(DOT_RADIUS - 1.0, DOT_RADIUS + 1.0, dist);

    vec3 finalColor = mix(terminalColor.rgb, DOT_COLOR, dot * DOT_OPACITY);
    fragColor = vec4(finalColor, terminalColor.a);
}
