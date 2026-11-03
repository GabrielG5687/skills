---
name: landing-page-scaffold
description: Gera um protótipo de landing page em HTML autocontido com cinco seções padrão (Hero → Prova Social → Recursos → Preços → CTA), produzindo um único arquivo HTML com estilos embutidos, pronto para visualizar em qualquer navegador. Ativada quando o usuário pede para construir, gerar ou montar uma landing page, wireframe ou protótipo de página de marketing, ou menciona seções específicas como hero, preços ou CTA.
---

# Landing Page Scaffold

Gera **um único arquivo HTML autocontido** (CSS + JS mínimos embutidos, sem build) com cinco seções na ordem fixa abaixo. Abrível em qualquer navegador via duplo-clique / Live Preview.

## Section order (fixed)

1. **Hero**
2. **Prova social** (logos, citação ou métricas — uma ideia só)
3. **Recursos** (benefícios / features)
4. **Preços**
5. **CTA** final

Do not reorder. Do not add extra marketing sections (FAQ, blog, footer link farms) unless the user explicitly asks.

## Workflow

```
Progress:
- [ ] 1. Collect brief (product, audience, tone, CTA)
- [ ] 2. Choose visual direction + CSS variables
- [ ] 3. Write the single HTML file
- [ ] 4. Self-check against design rules
- [ ] 5. Tell user the file path and how to open it
```

### 1. Collect brief

If missing, infer sensible defaults and state them in one short line. Prefer asking only when the product name or primary CTA is unknown.

Capture:
- Product / brand name
- One-line value proposition
- Primary CTA label + target (`#` placeholder OK)
- Tone (ex.: confident B2B, playful consumer)
- Optional: pricing tiers (else use 2–3 placeholder plans)

### 2. Visual direction

Define CSS variables on `:root` before layout. Pick **one** coherent direction (not a generic AI theme).

**Avoid by default** (unless the user or a reference demands it):
- Purple-on-white / purple-to-indigo gradients
- Warm cream (`#F4F1EA`-like) + terracotta + high-contrast serif broadsheet
- Dark-mode-by-default, glow effects, pill clusters, emoji decoration

**Prefer**:
- Expressive fonts via Google Fonts `<link>` (not Inter, Roboto, Arial, system-ui alone)
- Atmosphere: gradient, subtle pattern, or full-bleed photo/gradient plane — not a flat single fill
- Clear brand color + neutral surfaces

### 3. Write the HTML file

**Default path:** `landing-preview/index.html` (create folder if needed). If the user gives another path, use it.

**Document shape:**
- One `.html` file
- `<style>` in `<head>`
- Optional tiny `<script>` only for mobile nav or plan toggle — no frameworks
- Semantic tags: `header`, `main`, `section`, `footer`
- `lang` matching the copy language (default `pt-BR` if user writes in Portuguese)

**Hero (first viewport) — hard rules:**
- One composition, not a dashboard
- Brand / product name is hero-level (not only nav text)
- Budget: brand, **one** headline, **one** short supporting sentence, **one** CTA group, **one** dominant visual (full-bleed background or edge-to-edge media)
- No inset hero cards, side-panel heroes, collages, or floating media blocks
- No overlays on hero media: badges, stickers, chips, promo labels
- No cards in the hero
- Nav may include brand + links + CTA, but must not overpower the brand signal

**Other sections — hard rules:**
- One job per section: one headline + short support line + content
- Cards allowed only when they group a real choice/interaction (e.g. pricing plans)
- Resources: prefer simple list/grid without decorative stat strips or icon-row clutter
- Prova social: logos **or** quote **or** metrics — not all three stacked
- Include at least 2–3 intentional CSS motions (e.g. fade-in on scroll, CTA hover, subtle hero shift) — presence, not noise
- Responsive: readable on mobile and desktop (`clamp`, fluid type, stacking columns)

**Preços:**
- 2 ou 3 planos; destacar 1 recomendado sem “sticker” solto no hero
- CTA por plano apontando para o mesmo destino ou `#`

**CTA final:**
- Headline + short line + primary button
- No competing secondary promo blocks

### 4. Self-check

Before finishing:

- [ ] Exactly one HTML file, opens without a server
- [ ] Sections in order: Hero → Prova social → Recursos → Preços → CTA
- [ ] First viewport passes the brand test (removing nav still feels on-brand)
- [ ] No forbidden hero clutter / cards / overlays
- [ ] CSS variables define the look; fonts are non-default
- [ ] Motion present but restrained
- [ ] Mobile layout does not break

### 5. Deliver

Reply with:
1. File path
2. One-line how to open (`open file://...` or “Open with browser”)
3. Brief note of assumptions (product name, plans, tone)

Do **not** add a README unless asked.

## Copy defaults (when user gives little content)

| Slot | Fallback |
|------|----------|
| Brand | Nome do produto do usuário ou “Marca” |
| Headline | Benefício principal em uma frase |
| Support | Uma sentença sobre para quem é |
| CTA | “Começar” / “Falar com vendas” conforme tom |
| Plans | Starter / Pro / Business com preços placeholder |

Write copy in the user’s language.

## Wireframe mode

If the user asks for **wireframe** / low-fidelity:
- Grayscale palette, simple borders, placeholder blocks
- Same five sections and structure
- Keep autocontained HTML; label sections with visible `aria`/headings

## Out of scope

- React/Vue/Svelte components (unless user explicitly asks to convert after the HTML prototype)
- Backend, analytics, real payments
- Multi-page sites

## Example trigger → action

User: “Monta uma landing para um app de finanças pessoais”

→ Create `landing-preview/index.html` with the five sections, pt-BR copy, distinct visual direction, and return the path.
