CREATE DATABASE [Clinica]

CREATE TABLE [Fornecedor] (
    [Id] INT NOT NULL IDENTITY(200,1),
    [Nome] VARCHAR(80) NOT NULL,
    [MaterialId] INT NOT NULL

    CONSTRAINT [PK_Fornecedor] PRIMARY KEY ([Id]) 
)

CREATE TABLE [Material] (
    [Id] INT NOT NULL IDENTITY(100,1),
    [Nome] NVARCHAR(80) NOT NULL,
    [FornecedorId] INT NOT NULL,
    [Preco] DECIMAL(10,2) NOT NULL,
    [QuantidadeEstoque] INT NOT NULL,
    [QuantidadeNecessaria] INT NOT NULL

    CONSTRAINT [PK_Material] PRIMARY KEY ([Id])
    CONSTRAINT [FK_Material_Fornecedor] FOREIGN KEY ([FornecedorId])
        REFERENCES [Fornecedor]([Id])
)

CREATE TABLE [Medico] (
    [Id] UNIQUEIDENTIFIER NOT NULL,
    [Nome] NVARCHAR(80) NOT NULL,
    
    CONSTRAINT [PK_Medico] PRIMARY KEY ([Id])
)

CREATE TABLE [Paciente] (
    [Id] UNIQUEIDENTIFIER NOT NULL,
    [Nome] NVARCHAR(120) NOT NULL,
    [Telefone] NVARCHAR(20) NOT NULL,
    [Convenio] NVARCHAR(20) NOT NULL,
    [MedicoId] UNIQUEIDENTIFIER NOT NULL

    CONSTRAINT [PK_Paciente] PRIMARY KEY ([Id])
    CONSTRAINT [FK_Paciente_Medico] FOREIGN KEY ([MedicoId])
        REFERENCES [Medico]([Id])
)

CREATE TABLE [Procedimento] (
    [Id] INT NOT NULL IDENTITY(300,1),
    [Nome] NVARCHAR(80) NOT NULL,
    [Descricao] TEXT

    CONSTRAINT [PK_Procedimento] PRIMARY KEY ([Id])
)

CREATE TABLE [ProcedimentoMaterial] (
    [ProcedimentoId] INT NOT NULL,
    [MaterialId] INT NOT NULL,
    [Quantidade] NVARCHAR(4) NOT NULL,
    [Custo] DECIMAL(10,2) NOT NULL

    CONSTRAINT PK_ProcedimentoMaterial PRIMARY KEY ([ProcedimentoId], [MaterialId])
)

CREATE TABLE [ProcedimentoRealizado] (
    [Id] INT NOT NULL IDENTITY(400,1),
    [ProcedimentoId] INT NOT NULL,
    [Data] DATETIME NOT NULL,
    [PacienteId] UNIQUEIDENTIFIER NOT NULL,
    [MedicoId] UNIQUEIDENTIFIER NOT NULL

    CONSTRAINT [PK_ProcedimentoRealizado] PRIMARY KEY ([Id])
    CONSTRAINT [FK_ProcedimentoRealizado_Paciente] FOREIGN KEY ([PacienteId])
        REFERENCES [Paciente]([Id]),
    CONSTRAINT [FK_ProcedimentoRealizado_Medico] FOREIGN KEY ([MedicoId])
        REFERENCES [Medico]([Id])
)

CREATE TABLE [Login] (
    [Usuario] UNIQUEIDENTIFIER NOT NULL,
    [Senha] NVARCHAR(MAX) NOT NULL

    CONSTRAINT [PK_Login] PRIMARY KEY ([Usuario])
)

