---
name: ui-refinement
description: Refina interfaces existentes com ajustes incrementais de UI/UX, preservando identidade visual, estrutura, funcionalidades e estado. Use quando o usuário pedir para melhorar, polir, harmonizar ou dar acabamento premium a uma tela existente, sem redesign completo.
---

# UI Refinement — refinamento incremental de interfaces

## Missão

Melhorar a qualidade visual e a usabilidade da interface existente por meio de alterações pequenas, fundamentadas e verificáveis no código. Não recriar a tela nem substituir o design system.

## Princípios obrigatórios

- Preservar antes de melhorar: não remover campos, ações, abas, estados, dados, regras de negócio ou fluxos sem autorização.
- Evolução, não redesign: manter composição, linguagem visual, cores e componentes existentes; propor mudanças estruturais grandes separadamente.
- Reutilizar padrões: primeiro investigar tokens, componentes e estilos já usados no projeto. Não introduzir bibliotecas ou dependências sem necessidade.
- Corrigir na origem: evitar overrides em cascata, !important, valores mágicos e duplicação de estilos.
- Densidade equilibrada: melhorar legibilidade e aproveitamento de espaço sem inflar a interface ou adicionar decoração supérflua.
- Sem regressão: preservar interações, responsividade, acessibilidade e estados de loading, vazio, erro e seleção.

## Fluxo de execução

### 1. Inspecionar

Identificar framework, componentes da tela, CSS/Tailwind, tokens e padrões existentes.
Se houver screenshot, comparar o que é visível com a implementação; não presumir comportamentos que a imagem não prova.
Inspecionar também os estados relacionados: sem seleção, selecionado, lista longa, textos extensos, dados ausentes, loading e mobile.

### 2. Diagnosticar e priorizar

Avaliar:

- Hierarquia visual: foco, títulos, informações secundárias e CTAs.
- Espaçamento: padding, gaps, margens e ritmo vertical.
- Alinhamento: bordas, baseline, distribuição e grids.
- Tipografia: tamanho, peso, contraste, line-height e truncamento.
- Componentes: botões, badges, inputs, cards, abas, tabelas e ícones.
- Densidade: espaços mortos, redundâncias e excesso de elementos.
- Responsividade: overflow, quebra de linhas, min-width e uso do espaço.
- Estados: hover, focus-visible, disabled, selected, empty, loading e erro.

Classificar oportunidades como P1 (prejudica uso/legibilidade), P2 (inconsistência visível) ou P3 (polimento). Distinguir bug confirmado, indício visual e preferência estética.

### 3. Planejar a menor intervenção útil

Selecionar um conjunto coeso de ajustes, com maior impacto e menor risco.
Manter conteúdo e navegação intactos.
Preferir tokens e componentes compartilhados quando isso não afetar indevidamente outras telas.
Se uma mudança afetar várias telas, inspecionar os consumidores antes de alterar.

### 4. Implementar

Editar diretamente os arquivos relevantes quando houver acesso ao projeto.
Refinar dimensões, alinhamentos, espaçamento, tipografia, contraste e estados.
Evitar reformular toda a página, criar componentes desnecessários ou trocar o estilo geral.
Preservar eventos, props, acessibilidade, dados e regras de negócio.
Não introduzir dados fictícios na interface real.

### 5. Validar

Executar as verificações disponíveis (lint, typecheck, build e testes pertinentes).
Quando houver ambiente de navegador ou capturas, conferir desktop, tablet e mobile; comparar antes/depois.
Testar overflow, nomes longos, conteúdo ausente, diferentes estados e navegação por teclado.
Se não for possível executar alguma verificação, declarar a limitação explicitamente.

### 6. Entregar

Responder sucintamente com:

```
Diagnóstico: principais pontos refinados.
Alterações aplicadas: arquivos e efeito visual.
Validação: testes realizados e resultado.
Pendências: apenas o que ficou sem verificar ou exige decisão.
```

## Modo de operação

- Padrão — Refinar e aplicar: analisar e implementar melhorias incrementais sem aguardar aprovação para ajustes de baixo risco.
- Somente análise: se o usuário pedir apenas avaliação, não modificar arquivos.
- Refinamento focado: se o usuário indicar componente ou região, limitar o escopo a ela e às dependências necessárias.
- Redesign: somente se solicitado explicitamente; fora do escopo padrão.

## Checklist de conclusão

- Identidade visual original preservada.
- Nenhuma funcionalidade, campo ou ação removida.
- Espaçamentos, alinhamentos e tipografia consistentes.
- Sem overflow ou truncamento indevido.
- Estados e responsividade considerados.
- Alterações pequenas, legíveis e sem CSS duplicado.
- Verificações executadas ou limitações documentadas.

## Exemplos de ativação

- "Use ui-refinement para dar acabamento premium nesta tela, sem mudar o layout."
- "Refine os cards, espaçamentos e botões desta página."
- "Ajuste a densidade visual do painel de Pessoas mantendo todos os campos."
- "Melhore a hierarquia visual desta tabela sem redesenhar o componente."
