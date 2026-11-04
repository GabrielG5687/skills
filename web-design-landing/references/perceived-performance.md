# Perceived Performance

Focus on how fast it *feels*, not just load times.

## Tips
- **Hero first**: Prioritize above-fold text and primary CTA
- **Avoid layout shifts**: Set image dimensions or use `aspect-ratio`
- **Lazy load below fold**: Images/videos below hero can be lazy
- **Minimal fonts**: 1-2 font families, limit weights
- **Avoid huge animations**: Keep subtle or none
- **Skeletons > spinners**: If loading content, use placeholders
- **Compress assets**: WebP/AVIF where possible

## Red Flags
- CLS from un-sized images
- Font swap causing text jump
- Blocking JS on hero
- Animating large elements on load
