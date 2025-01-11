USE [Clinica]
-- Triger para calcular o custo --

CREATE TRIGGER [trg_CalculateCusto]
ON ProcedimentoMaterial
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE PM
    SET Custo = M.Preco * PM.Quantidade
    FROM ProcedimentoMaterial PM
    JOIN Material M ON PM.MaterialId = M.Id
    WHERE PM.Id IN (SELECT Id FROM Inserted);
END;