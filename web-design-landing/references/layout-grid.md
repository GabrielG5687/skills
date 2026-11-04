# Layout & Grid

## Containers
- **Max-width**: `1024px`, `1152px`, `1280px` are safe
- **Padding**: `px-4 sm:px-6 lg:px-8` common with Tailwind
- **Centered**: `mx-auto`

## Patterns
| Pattern | When to use |
| --- | --- |
| **Single column** | Hero, final CTA, simple pages (great on mobile) |
| **Two column (text + media)** | Hero, feature split, "problem/solution" |
| **Card grid** | Features, testimonials, pricing (2-4 columns) |
| **Auto-fit grid** | Responsive without many breakpoints |

## CSS Tips
```css
/* Auto-responsive grid */
.grid-auto {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 1.5rem;
}
```

## Rules
- **Mobile first**: Design vertical, enhance on larger
- **Avoid 12-col overkill** for simple landing pages
- **Flexbox for alignment**: Great for nav/CTAs
- **Grid for sections**: Great for complex splits
- **Don't center everything**: Left-aligned text reads better
