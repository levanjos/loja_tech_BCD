USE loja_tech;

-- 1. Procedure sem parâmetros: listar_categorias_ativas
DROP PROCEDURE IF EXISTS listar_categorias_ativas;
DELIMITER //
CREATE PROCEDURE listar_categorias_ativas()
BEGIN
    SELECT id_categoria, nome, descricao
    FROM categorias
    WHERE ativo = TRUE
    ORDER BY nome ASC;
END //
DELIMITER ;

-- Teste Ex. 1:
CALL listar_categorias_ativas();


-- 2. Procedure com parâmetro IN: buscar_pedidos_por_status
DROP PROCEDURE IF EXISTS buscar_pedidos_por_status;
DELIMITER //
CREATE PROCEDURE buscar_pedidos_por_status(
    IN p_status VARCHAR(20)
)
BEGIN
    SELECT id_pedido, id_cliente, data_pedido, valor_total
    FROM pedidos
    WHERE status = p_status;
END //
DELIMITER ;

-- Teste Ex. 2:
CALL buscar_pedidos_por_status('pendente');


-- 3. Procedure com parâmetros IN (Inserção): inserir_categoria
DROP PROCEDURE IF EXISTS inserir_categoria;
DELIMITER //
CREATE PROCEDURE inserir_categoria(
    IN p_nome VARCHAR(100),
    IN p_descricao TEXT
)
BEGIN
    INSERT INTO categorias (nome, descricao)
    VALUES (p_nome, p_descricao);
END //
DELIMITER ;

-- Teste Ex. 3:
CALL inserir_categoria('Redes e Wi-Fi', 'Roteadores, switches e adaptadores');


-- 4. Procedure com parâmetros IN (Atualização): atualizar_telefone_cliente
DROP PROCEDURE IF EXISTS atualizar_telefone_cliente;
DELIMITER //
CREATE PROCEDURE atualizar_telefone_cliente(
    IN p_id_cliente INT,
    IN p_telefone VARCHAR(15)
)
BEGIN
    UPDATE clientes
    SET telefone = p_telefone
    WHERE id_cliente = p_id_cliente;
END //
DELIMITER ;

-- Teste Ex. 4:
CALL atualizar_telefone_cliente(1, '11999998888');


-- 5. Procedure com parâmetros IN e OUT (Contagem): contar_produtos_categoria
DROP PROCEDURE IF EXISTS contar_produtos_categoria;
DELIMITER //
CREATE PROCEDURE contar_produtos_categoria(
    IN p_id_categoria INT,
    OUT p_total INT
)
BEGIN
    SELECT COUNT(*)
    INTO p_total
    FROM produtos
    WHERE id_categoria = p_id_categoria;
END //
DELIMITER ;

-- Teste Ex. 5:
CALL contar_produtos_categoria(3, @total_produtos);
SELECT @total_produtos AS total_produtos_categoria;