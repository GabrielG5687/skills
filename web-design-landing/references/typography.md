# Typography for Landing Pages

## Scale (pragmatic)
Use a fluid/reasonable scale. Pick one family for UI, optionally one for display.

| Element | Size (mobile->desktop) | Weight | Line Height |
| --- | --- | --- | --- |
| H1 | `32-48px` -> `48-64px` | 600-800 | 1.1 - 1.2 |
| H2 | `28-36px` -> `36-48px` | 600-700 | 1.15 - 1.25 |
| H3 | `24-28px` -> `28-32px` | 600-700 | 1.2 - 1.3 |
| Body | `16-18px` -> `18-20px` | 400-500 | 1.6 - 1.7 |
| Small/UI | `14-16px` -> `14-16px` | 400-500 | 1.5 - 1.6 |

## Rules
- **Max line length**: 60-75ch for body text
- **Avoid thin weights** (<400) for body
- **System fonts are fine**: Inter, Satoshi, Jost, Geist, Spline Sans, Outfit all work
- **Hierarchy by weight/size**: Don't rely only on color
- **Responsive**: Use `clamp()` or sensible breakpoints
- **Legibility**: Prefer `-webkit-font-smoothing: antialiased`

## Red Flags
- Multiple display fonts fighting each other
- Body < 16px on mobile
- All caps long paragraphs
- Excessive tracking/letter-spacing on body
