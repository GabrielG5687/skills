# Web Accessibility Checklist

## Structure
- [ ] **Headings**: Logical order, only one `h1`
- [ ] **Landmarks**: Use `header`, `main`, `section`, `footer` where sensible
- [ ] **Links vs buttons**: Navigation -> `a`. Actions -> `button`
- [ ] **Lists**: Use `ul/ol` for lists of items

## Visual
- [ ] **Contrast**: Check text and CTA
- [ ] **Focus visible**: Don't remove `:focus` outlines without replacement
- [ ] **Color alone**: Don't indicate errors only with red
- [ ] **Text resize**: Layout holds at 200% zoom

## Interactive
- [ ] **Keyboard**: All CTAs/forms reachable by Tab, activatable by Enter/Space
- [ ] **Touch targets**: >=44x44px
- [ ] **Alt text**: Descriptive for images conveying meaning
- [ ] **Forms**: Inputs have labels, errors linked

## Quick Tests
- Tab through the page with keyboard only
- Zoom to 125-150% in browser
- Check with DevTools color contrast
- Use browser accessibility tree quickly
