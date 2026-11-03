# Design System Builder — Reference

Detailed templates. Read only when the main skill output needs more structure.

## Token template (CSS)

```css
:root {
  /* Color — surfaces */
  --color-bg: ;
  --color-surface: ;
  --color-surface-raised: ;
  --color-border: ;
  --color-border-subtle: ;

  /* Color — text */
  --color-text: ;
  --color-text-muted: ;
  --color-text-inverse: ;

  /* Color — brand / accent */
  --color-brand: ;
  --color-brand-hover: ;
  --color-accent: ;

  /* Color — semantic */
  --color-success: ;
  --color-warning: ;
  --color-danger: ;
  --color-info: ;

  /* Typography */
  --font-sans: ;
  --font-display: ;
  --text-xs: ;   --line-xs: ;
  --text-sm: ;   --line-sm: ;
  --text-md: ;   --line-md: ;
  --text-lg: ;   --line-lg: ;
  --text-xl: ;   --line-xl: ;
  --text-2xl: ;  --line-2xl: ;
  --font-regular: 400;
  --font-medium: 500;
  --font-semibold: 600;
  --font-bold: 700;

  /* Spacing */
  --space-1: 0.25rem;
  --space-2: 0.5rem;
  --space-3: 0.75rem;
  --space-4: 1rem;
  --space-5: 1.25rem;
  --space-6: 1.5rem;
  --space-8: 2rem;
  --space-10: 2.5rem;
  --space-12: 3rem;

  /* Radius */
  --radius-sm: ;
  --radius-md: ;
  --radius-lg: ;
  --radius-full: 9999px;

  /* Shadow */
  --shadow-sm: ;
  --shadow-md: ;
  --shadow-lg: ;

  /* Motion */
  --ease-standard: cubic-bezier(0.2, 0, 0, 1);
  --duration-fast: 120ms;
  --duration-normal: 200ms;
}
```

Adjust the spacing scale to match the reference rhythm when it is clearly not 4px-based.

## Component spec template

```markdown
### Button
- Purpose: Primary actions
- Anatomy: label, optional leading/trailing icon
- Variants:
  - tone: primary | secondary | ghost | danger
  - size: sm | md | lg
  - state: default | hover | disabled | loading
- Tokens used: --color-brand, --radius-md, --text-sm, --font-medium
- Behavior notes: …
- Do: one primary button per action group
- Don't: use primary tone for destructive actions
```

## Layout pattern examples

### App shell
- Left sidebar fixed width + scrollable main
- Top bar with title + actions
- Content max-width / padding from reference

### Dashboard
- Header + filter row
- Metric cards row (equal columns)
- Main chart / table region

### Form stack
- Single column, label above field
- Grouped sections with tight internal spacing, larger section gaps
- Sticky or end-aligned submit actions

### Marketing / landing
- Full-bleed hero only when reference shows it
- One job per section
- Follow reference hierarchy; do not add card grids unless present

## Extraction checklist (per image)

- [ ] Dominant background and surface colors (hex approx OK)
- [ ] Text primary / secondary contrast
- [ ] Accent / CTA color
- [ ] Border treatment (hairline, none, contrast fill)
- [ ] Corner radius on buttons, inputs, cards
- [ ] Shadow presence and softness
- [ ] Type hierarchy (count distinct sizes/weights)
- [ ] Horizontal padding of page and cards
- [ ] Gap between stacked sections and sibling items
- [ ] Navigation pattern
- [ ] Empty / loading / error UI if visible

## Stack adaptation

| Repo signal | Token delivery |
|-------------|----------------|
| CSS / SCSS modules | `:root` CSS variables |
| Tailwind | `theme.extend` in config + class mapping notes |
| styled-components / emotion | theme JS object mirroring token names |
| Existing design system | Map tokens onto existing names; do not duplicate |

Always prefer extending the repo’s current styling approach over introducing a parallel system.
