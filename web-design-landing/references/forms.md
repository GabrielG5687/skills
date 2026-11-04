# Forms & Lead Capture

## Principles
- **Less is more**: Every field = drop-off
- **Ask only what you need now**: Save rest for later
- **Clear labels**: Above input, always visible
- **Helpful errors**: Specific, next to field, say how to fix

## Recommendations
| Field count | Verdict |
| --- | --- |
| 1-2 | Ideal for "Get started" style |
| 3 | Acceptable if justified |
| 4+ | Needs strong reason |

## UX Rules
- **Label != placeholder**: Placeholders disappear on typing
- **Button text matches action**: `Get my guide` not `Submit`
- **Input types**: Use `email`, `tel` for mobile keyboards
- **Validation**: Inline on blur or on submit, don't punish early
- **Privacy**: If sensitive, say "We won't spam you" sparingly
- **CTA disabled?**: Only if truly invalid and obvious

## Accessibility
- `<label for="...">` linked to input
- `aria-invalid`, `aria-describedby` for errors
- Errors announced to screen readers
- Focus returns logically after error
