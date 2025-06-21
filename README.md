# 🎶 Sistema de Gerenciamento de Orquestra

Este projeto consiste na modelagem e desenvolvimento de um banco de dados relacional para o gerenciamento de uma orquestra sinfônica. Abrange informações sobre músicos, orquestras, instrumentos, sinfonias e muito mais, além de implementação de regras de negócio usando **Procedures**, **Functions**, **Triggers** e **Views**.

---

## 📊 Modelagem

- Banco de dados: `escola_musica`
- Diagrama ER: Disponível no arquivo `.mwb` (MySQL Workbench)

### Entidades Principais:
- **Orquestra**
- **Músicos**
- **Sinfonias**
- **Instrumentos**
- **Endereço dos Músicos**
- **Histórico de Funções**
- **Tipo de Instrumento**
- **Orquestra Sinfônica (Relação entre Orquestra e Sinfonia)**

---

## 🚀 Funcionalidades Desenvolvidas

### 🔧 Procedures
- ✅ **Reajuste Salarial**
- ✅ **Troca de Instrumento**
- ✅ **Promoção de Função + Aumento Salarial**
- ✅ **Aumento Salarial Global**
- ✅ **Adicionar Salário Fixo**
- ✅ **Listagem de Sinfonias por Compositor**

### 🔢 Functions
- ✅ **Classificação Salarial (Básico, Médio, Alto)**
- ✅ **Valor Total de Instrumentos por Orquestra**
- ✅ **Tempo de Serviço do Músico**
- ✅ **Verificar se é Músico Sênior (≥10 anos)**
- ✅ **Compositor Mais Executado na Orquestra**

### ⚙️ Triggers
- ✅ **Validação de Salário Mínimo (≥ R$ 2.000,00)**
- ✅ **Registro Automático no Histórico ao Alterar Função**
- ✅ **Impede Exclusão de Músico com Instrumentos Vinculados**
- ✅ **Preenche 'Sem complemento' em endereços vazios**
- ✅ **Ajusta Telefones para Padrão Internacional (+55)**
- ✅ **Atualiza status da Orquestra para 'Inativa' se não houver músicos**

### 👀 Views (Visões)
- 🔍 **Músicos com Instrumentos e Orquestras**
- 🔍 **Orquestras Modernas (Fundadas após 1950)**
- 🔍 **Repertório Brasileiro**
- 🔍 **Músicos Residentes (que moram na mesma cidade da orquestra)**
- 🔍 **Sinfonias Mais Recentes**
- 🔍 **Histórico de Mudança de Função**
- 🔍 **Instrumentos Mais Raros**
- 🔍 **Músicos Violinistas**
- 🔍 **Perfil Salarial por Função**
- 🔍 **Músicos Jovens (Nascidos após 1990)**
- 🔍 **Orquestras Completas (Total de músicos, sinfonias e valor dos instrumentos)**
- 🔍 **Instrumentos Detalhados por Valor e Tipo**

🧠 Relatórios Disponíveis
🎻 Lista completa de músicos, funções, orquestras, instrumentos e sinfonias.

🎵 Instrumentos mais caros e mais raros.

📊 Perfil salarial por função.

🏙️ Músicos residentes na mesma cidade da orquestra.

📅 Orquestras fundadas após 1950 e sinfonias mais recentes.

🏆 Compositores mais executados.

👶 Músicos jovens (nascidos após 1990) e 🎓 músicos sêniors (com mais de 10 anos de experiência).

🎯 Tempo de serviço de cada músico.

🎼 Estatísticas de idade, quantidade de músicos, repertório e valor dos instrumentos por orquestra.

💻 Tecnologias Utilizadas

<ul> MySQL</ul

<ul>MySQL Workbench (para modelagem)</ul>

<ul>SQL (DDL, DML, DQL e DCL)</ul>

<ul>Conceitos de Banco de Dados Relacional</ul>


