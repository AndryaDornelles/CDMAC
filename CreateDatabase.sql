CREATE DATABASE [Clinica]

CREATE TABLE [Fornecedor] (
    [Id] INT NOT NULL IDENTITY(200,1),
    [MaterialId] INT NOT NULL

    CONSTRAINT [PK_Fornecedor] PRIMARY KEY ([Id]) 
)

CREATE TABLE [Material] (
    [Id] INT NOT NULL IDENTITY(100,1),
    [Nome] NVARCHAR(80) NOT NULL,
    [FornecedorId] INT NOT NULL,
    [QuantidadeEstoque] INT NOT NULL,
    [QuantidadeNecessaria] INT NOT NULL

    CONSTRAINT [PK_Material] PRIMARY KEY([Id])
    CONSTRAINT [FK_Material_Fornecedor] FOREIGN KEY ([FornecedorId])
        REFERENCES [Fornecedor]([Id])
)

ALTER TABLE [Fornecedor]
    ADD [Nome] VARCHAR(80) NOT NULL
