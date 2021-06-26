/* WITH */
-- Example #1
WITH tbl_banco AS (
    SELECT numero, nome 
      FROM banco
)
SELECT * FROM tbl_banco;

-- Example #2
WITH params AS (
    SELECT 213 as banco_numero
),
tbl_banco AS (
    SELECT numero, nome 
      FROM banco 
      JOIN params ON params.banco_numero = banco.numero)
SELECT numero, nome FROM tbl_banco;

-- Examle #3
WITH clientes_e_transacoes AS (
    SELECT cliente.nome AS cliente_nome,
           tipo_transacao.nome AS tipo_transacao_nome,
           cliente_transacoes.valor AS tipo_transacao_valor
      FROM cliente_transacoes
       JOIN cliente ON cliente.numero = cliente_transacoes.cliente_numero
       JOIN tipo_transacao ON tipo_transacao.id = cliente_transacoes.tipo_transacao_id
)
SELECT cliente_nome, tipo_transacao_nome, tipo_transacao_valor
  FROM clientes_e_transacoes;

/* SUBSELECT */
SELECT banco.numero, banco.nome
  FROM banco
  JOIN (
      SELECT 213 AS banco_numero
  ) params ON params.banco_numero = banco.numero;

