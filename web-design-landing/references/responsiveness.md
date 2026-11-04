# Responsiveness

## Breakpoints (pragmatic)
| Name | Range | Focus |
| --- | --- | --- |
| `xs` | 320-374px | Very small phones (test here) |
| `sm` | 375-639px | iOS/Android common |
| `md` | 640-767px | Large phones/small tablets |
| `lg` | 768-1023px | Tablets |
| `xl` | 1024-1279px | Laptops |
| `2xl` | 1280px+ | Desktops |

## Checklist
- [ ] **Text readable**: No horizontal scroll
- [ ] **CTAs tappable**: >= 44x44px
- [ ] **Images scale**: Use `max-width: 100%`, `object-fit`
- [ ] **Stacking**: Columns become single column
- [ ] **Nav**: Works on mobile (or simplified)
- [ ] **Forms**: Full width inputs/buttons on small screens
- [ ] **Padding reduced**: Sections tighten up

## Common Issues
- **Fixed widths**: Use max-width + padding
- **Horizontal overflow**: Caused by long words, fixed px, or negative margins
- **Text too small**: <16px on inputs can zoom iOS
- **CTAs side by side cramped**: Stack vertically
