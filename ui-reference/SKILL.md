---
name: ui-reference
description: Reproduz interfaces de usuário seguindo fielmente uma imagem de referência como especificação visual, sem redesign nem alterações criativas. Use when the user provides /ui-reference, a UI screenshot/mockup, or asks to follow, copy, reproduce, or implement a layout exactly as in the image.
---

# Skill UI Reference

## Objetivo

Permitir que a IA reproduza interfaces de usuário seguindo fielmente uma imagem de referência fornecida pelo usuário.

A imagem deve ser considerada a especificação visual principal da implementação.

O objetivo é reproduzir o design apresentado, mantendo sua estrutura, aparência, proporções, componentes e identidade visual, sem interpretações ou modificações criativas não solicitadas.

## Gatilhos

Ativar quando o usuário solicitar:

- `/ui-reference`
- "Siga exatamente essa imagem"
- "Reproduza essa interface"
- "Faça igual à referência"
- "Implemente esse layout"
- "Copie o design dessa imagem"
- "Quero essa tela exatamente como está na imagem"
- "Não altere o design da referência"

## Procedimento

1. Analisar detalhadamente a imagem fornecida pelo usuário.
2. Identificar a estrutura visual e a hierarquia dos elementos.
3. Mapear os componentes presentes na referência.
4. Identificar cores, tipografia, dimensões, espaçamentos, bordas, sombras e alinhamentos.
5. Analisar a estrutura atual do projeto antes de implementar.
6. Identificar componentes, estilos e recursos existentes que possam ser reutilizados.
7. Implementar a interface reproduzindo fielmente a referência.
8. Comparar a implementação com a imagem original.
9. Identificar diferenças visuais entre a implementação e a referência.
10. Corrigir as divergências identificadas até alcançar a maior fidelidade possível.

## Regras de fidelidade visual

- A imagem fornecida é a fonte da verdade.
- Reproduzir o layout sem reinterpretar sua estrutura.
- Respeitar as dimensões e proporções dos elementos.
- Reproduzir fielmente cores e tonalidades.
- Respeitar tipografia, tamanhos e pesos das fontes.
- Manter os espaçamentos e alinhamentos.
- Reproduzir bordas, sombras e arredondamentos.
- Preservar a hierarquia visual.
- Manter a quantidade e a disposição dos componentes.
- Reproduzir os detalhes visuais presentes na imagem.

## Regras de implementação

- Utilizar as tecnologias já existentes no projeto.
- Respeitar a arquitetura e os padrões de desenvolvimento.
- Reutilizar componentes existentes quando forem compatíveis com a referência.
- Evitar alterações em arquivos que não estejam relacionados à implementação.
- Não instalar dependências sem necessidade.
- Não modificar outras telas por iniciativa própria.
- Não substituir componentes específicos por soluções genéricas.
- Utilizar medidas e propriedades visuais coerentes com a referência.

## Regras de segurança visual

- Nunca realizar redesign por conta própria.
- Nunca modernizar a interface sem autorização.
- Nunca simplificar elementos presentes na imagem.
- Nunca adicionar componentes que não existam na referência.
- Nunca remover elementos por considerar que são desnecessários.
- Nunca trocar cores, fontes ou ícones por preferência estética.
- Nunca alterar a hierarquia visual.
- Nunca inventar informações ou elementos decorativos.
- Nunca considerar uma interface aproximada como reprodução concluída.

## Responsividade

- Priorizar a fidelidade na resolução original da referência.
- Preservar as proporções dos componentes.
- Adaptar a interface para telas menores sem descaracterizar o design.
- Manter a hierarquia e a organização visual.
- Não ocultar ou reorganizar elementos arbitrariamente.
- Não permitir que a responsividade comprometa a aparência na resolução de referência.

## Validação obrigatória

Após a implementação:

1. Executar a aplicação.
2. Abrir a tela desenvolvida.
3. Comparar visualmente com a imagem original.
4. Identificar diferenças de posicionamento, tamanho, cor e espaçamento.
5. Corrigir os elementos divergentes.
6. Repetir a comparação após os ajustes.

A validação visual é obrigatória e faz parte da implementação.

## Tratamento de ambiguidades

- Se algum detalhe estiver ilegível, utilizar a melhor aproximação possível.
- Não inventar elementos para preencher espaços.
- Não modificar partes da interface que estejam claramente identificadas.
- Não reinterpretar elementos por falta de informação.
- Solicitar esclarecimentos somente quando uma informação for indispensável para continuar.

## Resultado esperado

Após a implementação, apresentar:

- Interface implementada conforme a referência.
- Componentes reproduzidos.
- Arquivos criados ou modificados.
- Comparação visual realizada.
- Divergências identificadas e corrigidas.
- Limitações encontradas durante a reprodução.

## Regra principal

A IA deve reproduzir exclusivamente o design apresentado na imagem, respeitando sua estrutura, aparência e identidade visual.

**A imagem não é uma inspiração. É a especificação visual que deve ser seguida.**
