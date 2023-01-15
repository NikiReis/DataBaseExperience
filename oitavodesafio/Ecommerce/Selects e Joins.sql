select c.id_cliente,nome_cliente,count(*) as quantidade from cliente c
inner join pedido p where c.id_cliente = p.id_cliente group by
c.id_cliente;

-- seleciona todos os cliente em que uma única compra gastaram mais do que R$ 1.200,00

select c.id_cliente,nome_cliente,p.valor_total from cliente c 
inner join pedido p on c.id_cliente = p.id_cliente
and p.valor_total > 1200.0;

-- todos os produtos que são vendidos na loja
select concat(nome_produto,' - ',marca) as Nome_do_Produto, descricao,preco from produto;

-- Todos os produtos fornecidos por determinados fornecedores

select f.id_fornecedor,nome_fornecedor,endereco from fornecedor as f
inner join fonecimento_produto as fp on f.id_fornecedor = fp.id_fornecedor
inner join produto as p on fp.id_produto = p.id_produto order by f.id_fornecedor;

-- quantos produtos cada fornecedor fornece para a loja
select count(distinct(p.id_produto)) as quantidade_produto,f.id_fornecedor,
f.nome_fornecedor,f.endereco from fornecedor f inner join 
fonecimento_produto ftp on f.id_fornecedor = ftp.id_fornecedor inner join 
produto p on ftp.id_produto = p.id_produto group by f.id_fornecedor;

-- produtos disponíveis no estoque ordenando pelo estoque e quantidade de produto disponível

select p.id_produto,nome_produto,descricao,etp.quantidade_produto from produto as p
inner join estoque_tem_produto as etp on p.id_produto = etp.id_produto
inner join estoque as e on etp.id_estoque = e.id_estoque
order by e.id_estoque,etp.quantidade_produto;

-- nome dos cliente em que suas entregas foram entregues com atraso
select c.id_cliente, nome_cliente,c.endereco,codigo_rastreio,t.id_transportadora,
t.nome_transportadora from cliente c inner join pedido p on c.id_cliente = p.id_cliente
inner join transportadora t on p.id_transportadora = t.id_transportadora inner join
entrega e on t.id_transportadora = e.id_transportadora and data_entrega > data_prevista;

-- quantidade de clientes que pagaram o produto exclusivamente com o metodo de pagamento pix

select count(*) as quantidade_de_pix from cliente as c
inner join pedido as p on c.id_cliente = p.id_cliente
and p.status_pedido='Concluido' inner join pagamento as pg 
where p.id_pagamento = pg.id_pagamento and pg.metodo_pagamento = 
'Pix';
