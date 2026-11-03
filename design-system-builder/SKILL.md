---
name: design-system-builder
description: Extrai sistemas de design a partir de imagens de UI de referência e gera prompts de design de UI prontos para implementação. Use quando os usuários fornecerem screenshots/mockups de UI e quiserem criar designs consistentes, gerar sistemas de design ou construir UIs de MVP que correspondam à estética de referência.
---

# Design System Builder

Extrai um sistema de design completo a partir de imagens de UI (screenshots, mockups, Dribbble/Figma exports) e entrega tokens, componentes, patterns e um prompt de implementação pronto para usar.

## When to use

Apply when the user:
- Attaches or pastes UI screenshots / mockups
- Asks to match a reference aesthetic
- Wants a design system, design tokens, or MVP UI from visual references
- Asks for a prompt to implement UI consistent with references

## Workflow

Copy and track:

```
Progress:
- [ ] 1. Inventory references
- [ ] 2. Extract visual language
- [ ] 3. Build design tokens
- [ ] 4. Define components
- [ ] 5. Capture layout patterns
- [ ] 6. Emit implementation prompt
- [ ] 7. Confirm stack / next step
```

### 1. Inventory references

- List every attached image and what screen/region it shows
- Note product type (dashboard, landing, mobile app, form, etc.)
- If images conflict, call out differences and pick a primary reference (ask if unclear)

### 2. Extract visual language

From the images, observe (do not invent what is not visible):

| Axis | Look for |
|------|----------|
| Color | Brand, surfaces, text, borders, success/warn/error, gradients |
| Typography | Scale, weight, tracking, hierarchy (title → caption) |
| Spacing | Gaps, padding rhythm (4/8/12/16…) |
| Shape | Radius scale, pill vs soft vs sharp |
| Elevation | Shadows, borders, blur, flat vs layered |
| Iconography | Style (outline/filled), size, stroke |
| Motion cues | Implied transitions only if visible (skeletons, toasts) |
| Density | Compact vs airy; information hierarchy |

**Rules**
- Prefer values inferred from the reference over generic defaults
- If a value is ambiguous, state the assumption briefly
- Avoid the generic AI look (purple-on-white, cream+terracotta broadsheet, glow soup) unless the reference actually looks like that

### 3. Build design tokens

Output a `Design Tokens` block using CSS variables (default). Adapt to Tailwind theme / JS theme object only if the user asks or the repo already uses that.

Required token groups:
- `color` (bg, surface, text, muted, border, brand, accent, semantic)
- `typography` (families, sizes, weights, line-heights)
- `spacing` (scale)
- `radius`
- `shadow` / elevation
- `motion` (duration, easing) — only if inferable or needed for MVP
- `z-index` — only if layered UI is present

Keep names semantic (`--color-surface-raised`), not raw (`--gray-2`), unless the reference is clearly a neutral palette system.

### 4. Define components

For each recurring UI piece in the references, document:

```
### [ComponentName]
- Purpose:
- Anatomy: (parts)
- Variants: (size/state/tone)
- Tokens used:
- Behavior notes: (hover/disabled/loading only if visible or required)
- Do / Don't:
```

Minimum set when present in refs: Button, Input/Field, Select, Checkbox/Radio, Card/Panel, Nav/Sidebar, Table/List, Modal/Dialog, Badge/Chip, Tabs, Toast/Alert, Avatar, Dropdown.

Do not invent a huge library — only components evidenced by the references (plus minimal missing primitives needed to implement the requested screen).

### 5. Capture layout patterns

Document recurring structures:
- Page shell (nav, sidebar, content width)
- Grid / stacking rules
- Section templates (hero, metrics row, form stack, empty state)
- Responsive behavior if multiple breakpoints are shown; otherwise note “mobile/desktop unknown”

### 6. Emit implementation prompt

Produce a single copy-pasteable prompt the user (or agent) can use to build the UI. Include:
- Goal screen(s)
- Stack hint (detect from repo if available; else ask / stay stack-agnostic)
- Token summary (or pointer to the tokens block)
- Component list to implement
- Layout pattern for the target screen
- Accessibility baselines (contrast, focus rings, labels)
- Explicit “match reference, don’t improvise style” constraint

### 7. Confirm stack / next step

Ask (briefly) whether to implement in the current codebase now, or stop at the design system + prompt.

## Output format

Deliver in this order:

1. **Reference read** — 3–6 bullets of what the images communicate
2. **Design tokens** — fenced code block
3. **Components** — concise specs
4. **Layout patterns** — concise specs
5. **Implementation prompt** — single fenced block, ready to paste
6. **Open questions** — only if blockers (missing breakpoint, unclear brand color, etc.)

## Implementation prompt template

```markdown
Implement the UI to match the attached reference aesthetic.

## Goal
[screen / flow]

## Stack
[React/Vue/etc + styling approach]

## Design tokens
[paste tokens or key subset]

## Components to build
- [list]

## Screen layout
[pattern description]

## Constraints
- Match spacing, radius, type scale, and color roles from the tokens
- Do not introduce a competing visual style
- Reuse existing design-system/components in the repo when compatible
- Responsive: [rules]
- A11y: focus visible, labeled inputs, sufficient contrast
```

## Quality bar

- Tokens must be usable as-is in code
- Component list must map to visible UI, not a generic kit
- Prompt must be specific enough that another agent can implement without re-analyzing the images from scratch
- Prefer one coherent system over multiple optional themes

## Additional resources

- For extended token/component templates, see [reference.md](reference.md)
