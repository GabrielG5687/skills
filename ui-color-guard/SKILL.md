---
name: ui-color-guard
description: Audita e refina automaticamente contraste, colorimetria, legibilidade e acessibilidade visual em telas existentes, preservando o design system. Use ao revisar cores, temas, badges, botões, tabelas, modais e estados de UI.
---

# UI Color Guard

## Missão

Investigar o código real da interface, detectar combinações de cores ilegíveis e aplicar correções mínimas e consistentes. Não redesenhar telas, não remover elementos nem alterar comportamento funcional. Não declarar garantia absoluta: só aprovar o que foi efetivamente medido e testado.

## Procedimento obrigatório

1. Identifique framework, componentes, tokens, variáveis CSS, Tailwind config e temas claro/escuro. Verifique o escopo solicitado antes de editar.
2. Inspecione screenshots quando fornecidos, mas trate suspeitas visuais como hipóteses; confirme no código e, se possível, no navegador.
3. Mapeie combinações reais de foreground/background para texto, placeholders, links, ícones, badges, botões, inputs, tabelas, cards, overlays, dropdowns, tooltips, toast e modais. Considere cores computadas, opacidade, herança, gradients, imagens de fundo e estados hover/focus/active/selected/disabled/loading/error/success.
4. Calcule a razão de contraste WCAG usando luminância relativa sRGB linearizada: canal <= 0.04045 => canal/12.92; senão ((canal+0.055)/1.055)^2.4. L = 0.2126 R + 0.7152 G + 0.0722 B; contraste = (L_clara+0.05)/(L_escura+0.05). Para transparências, componha foreground e background antes de medir. Para gradientes e imagens, verifique pontos críticos; se não puder medir com segurança, marque para revisão manual.
5. Critérios WCAG AA: texto comum >= 4.5:1; texto grande (>= 24px regular ou >= 18.66px bold) >= 3:1; ícones funcionais e limites visuais necessários de componentes >= 3:1. Texto AAA: 7:1 (ou 4.5:1 grande) como melhoria opcional. Componentes desabilitados podem estar isentos do critério de contraste WCAG, mas devem permanecer reconhecíveis. Logotipos e texto incidental possuem exceções; não aplicar regra cegamente.
6. Corrija primeiro tokens semânticos (text-primary, text-secondary, surface, border, accent, on-accent, status-*), evitando hexadecimais avulsos e !important. Prefira mudanças locais quando token global impactaria telas não auditadas. Preserve branding e intenção semântica; não use só cor para indicar estado.
7. Verifique visualmente estados relevantes em desktop e mobile e em todos os temas disponíveis. Execute lint, typecheck, testes e build existentes quando possível. Se houver Playwright/browser, capture e valide amostras de contraste computado e regressão visual.
8. Entregue relatório sucinto: elemento/local, antes/depois (cores e razões), arquivos alterados, testes executados, pontos não verificados e riscos remanescentes. Nunca alegue conformidade total sem auditoria completa.

## Regras de segurança

- Nunca inverter cores indiscriminadamente.
- Não tornar placeholders indistinguíveis do conteúdo nem badges semanticamente ambíguos.
- Não usar opacidade como solução automática para texto secundário.
- Não alterar lógica, conteúdo, navegação, tamanho de layout ou componentes fora do escopo salvo necessidade comprovada.
- Se não houver acesso ao código ou ambiente de renderização, fornecer diagnóstico e plano, sem afirmar que corrigiu ou testou.

## Prompt de ativação

"Use ui-color-guard para auditar e corrigir contraste e legibilidade desta tela. Meça as combinações reais de texto/fundo, respeite WCAG AA, preserve o design system e aplique ajustes mínimos no código. Verifique estados e temas e apresente relatório antes/depois com pendências."
