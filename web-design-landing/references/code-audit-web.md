# Code Audit for Landing Pages

Look for these when given HTML/JSX/TSX/CSS/Tailwind.

## HTML/Semantics
| Check | Issue | Fix |
| --- | --- | --- |
| Multiple `<h1>` | Confuses outline | Use single H1 per page |
| `<div>` as button | Not keyboard accessible | Use `<button>` or add role/tabindex + handlers |
| Placeholder as label | Unaccessible | Use real `<label>` |
| Empty links `href="#"` | Bad for a11y/UX | Use button or real route |

## CSS/Layout
| Check | Issue | Fix |
| --- | --- | --- |
| `overflow-x: hidden` hiding issues | Masks bugs | Fix root cause (widths/margins) |
| Fixed `px` widths breaking mobile | Horizontal scroll | Use `max-width`, `%`, `clamp()` |
| Large padding only on desktop | Cramped mobile | Add responsive padding |
| `!important` overuse | Hard to override | Prefer specificity/context |

## Tailwind Specific
| Check | Issue | Fix |
| --- | --- | --- |
| `text-gray-400` on white body | Often low contrast | Try `text-gray-600/700` |
| `gap-2` everywhere | Feels tight/rushed | Use scale from spacing guide |
| Buttons with same classes as links | Confusing hierarchy | Separate primary/secondary styles |
| `hidden` removing important content | Can hurt mobile UX | Check stacking order |
| Excessive arbitrary values `[]` | Inconsistent | Move to scale if repeated |

## Images/Assets
- **Lazy loading**: Consider `loading="lazy"` for below-fold
- **Sizing**: Prevent layout shift (width/height or aspect-ratio)
- **Format**: Modern formats help perceived performance
- **Alt**: Don't leave empty unless purely decorative
