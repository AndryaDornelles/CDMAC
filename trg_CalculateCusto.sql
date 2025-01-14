-- Trigger para calcular o custo
CREATE TRIGGER trg_CalculateCusto
ON ProcedimentoMaterial
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE PM
    SET Custo = M.Preco * PM.Quantidade
    FROM ProcedimentoMaterial PM
    JOIN Material M ON PM.MaterialId = M.Id
    WHERE EXISTS (
        SELECT 1
        FROM Inserted I
        WHERE I.ProcedimentoId = PM.ProcedimentoId AND I.MaterialId = PM.MaterialId
    );
END;