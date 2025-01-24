<p align="center">
<img loading="lazy" src="http://img.shields.io/static/v1?label=STATUS&message=EM%20DESENVOLVIMENTO&color=GREEN&style=for-the-badge"/>
</p>


# **Projeto: Sistema de Gestão para Clínica Médica**  
Este projeto nasceu da minha experiência como imobilizadora ortopédica, onde sou responsável pela gestão do estoque de materiais e pelo acompanhamento dos procedimentos realizados. O objetivo é criar um sistema que automatize essas tarefas, trazendo mais organização, eficiência e praticidade.

Atualmente, o banco de dados está concluído (mas ainda não foi inserido nenhum dado), e o próximo passo será desenvolver uma **API REST** e uma interface visual para integração e uso diário.

---

## 🎯 **Objetivo**  
O sistema busca atender às seguintes necessidades:  
- **Controle de Estoque**: Acompanhar materiais disponíveis e necessários.  
- **Registro de Procedimentos**: Gerenciar os procedimentos realizados, vinculando médicos, pacientes e materiais.  
- **Cadastro Centralizado**: Armazenar informações de médicos, pacientes e fornecedores.  
- **Cálculo Automático de Custos**: Automatizar o cálculo de custos dos materiais utilizados em cada procedimento.  

---

## 🛠️ **Tecnologias Utilizadas**  

- **Banco de Dados**: SQL Server, emulado via Docker.  
- **Ferramentas**: Azure Data Studio para gerenciamento e consultas SQL.  

---

## 📂 **Estrutura do Banco de Dados**  

O banco foi projetado para atender às necessidades práticas do dia a dia da clínica e inclui as seguintes tabelas:  

- **Fornecedor**: Gerencia informações sobre os fornecedores.  
- **Material**: Controla o estoque e o uso de materiais.  
- **Medico**: Armazena dados dos médicos.  
- **Paciente**: Registra informações dos pacientes e os relaciona aos médicos responsáveis.  
- **Procedimento**: Cadastra os tipos de procedimentos realizados.  
- **ProcedimentoMaterial**: Relaciona os materiais aos procedimentos, incluindo o custo calculado automaticamente.  
- **ProcedimentoRealizado**: Registra os procedimentos realizados, vinculando médicos, pacientes e datas.  

### **Triggers e Regras de Negócio**  
O banco inclui uma trigger que automatiza cálculos importantes:  

- **Trigger `trg_CalculateCusto`**:  
  - Ativada após inserções ou atualizações na tabela `ProcedimentoMaterial`.  
  - Calcula automaticamente o custo total com base no preço unitário do material e na quantidade utilizada.

---

## 🚀 **Próximas Etapas**  

### **1. Desenvolvimento da API REST**  
- Criar endpoints para:  
  - CRUD de médicos, pacientes, fornecedores, materiais e procedimentos.  
  - Registrar procedimentos realizados.  
- Implementar autenticação e segurança.  

### **2. Interface Visual**  
- Desenvolver uma interface amigável para:  
  - Cadastro e consulta de dados.  
  - Controle de estoque e geração de relatórios.  

### **3. Testes e Integração**  
- Garantir a integração perfeita entre API, banco de dados e interface.  
- Realizar testes funcionais, de desempenho e de usabilidade.

---

## 💡 **Motivação**  

Como imobilizadora ortopédica, enfrento diariamente os desafios de gerenciar materiais e monitorar procedimentos manualmente. Este projeto é uma solução prática para otimizar essas tarefas essenciais, tornando-as mais eficientes e seguras com a ajuda da tecnologia.

---

## 📝 **Como Configurar o Banco de Dados**  

### **1. Usando Docker para o SQL Server**  
Certifique-se de ter o Docker instalado e configurado. Siga as etapas abaixo para configurar o SQL Server:  

1. Baixe e execute a imagem do SQL Server no Docker:  
   ```bash
    docker run --name sqlserver -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=1q2w3e4r@#$" -p 1433:1433 -d mcr.microsoft.com/mssql/server
   ```  
2. Certifique-se de que o contêiner está em execução:  
   ```bash
   docker ps
   ```  

### **2. Gerenciando o Banco com Azure Data Studio**  
1. Baixe o [Azure Data Studio](https://learn.microsoft.com/pt-br/sql/azure-data-studio/download-azure-data-studio).  
2. Conecte-se ao servidor `localhost,1433` com as credenciais:  
   - **Login**: `sa`  
   - **Senha**: `1q2w3e4r@#$`  
3. Execute o script SQL incluído no projeto para criar o banco de dados e suas tabelas.  

---

## 📜 **Licença**  
Este projeto está licenciado sob a [Licença MIT](https://opensource.org/licenses/MIT).  

---
