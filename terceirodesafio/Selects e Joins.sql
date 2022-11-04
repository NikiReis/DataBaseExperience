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
-- para corrigir 
select count(distinct(id_fornecedor)) from fornecedor f
inner join fornecimento_tem_produto as ftp on f.id_fornecedor = ftp.id_fornecedor
where (select id_produto, nome_produto from produto p inner join
fornecimento_tem_produto on p.id_produto = ftp.id_produto);

-- produtos disponíveis no estoque ordenando pelo estoque e quantidade de produto disponível

select p.id_produto,nome_produto,descricao,etp.quantidade_produto from produto as p
inner join estoque_tem_produto as etp on p.id_produto = etp.id_produto
inner join estoque as e on etp.id_estoque = e.id_estoque
order by e.id_estoque,etp.quantidade_produto;

-- nome dos cliente em que suas entregas foram entregues com atraso
-- para corrigir
select c.id_cliente, nome_cliente,endereco,codigo_rastreio from cliente c
inner join entrega e on c.id_cliente = e.id_cliente and e.status_entrega = 'Entregue ao destinatario' 
where (select t.id_transportadora,nome_transportadora from transportadora t
inner join entrega on t.id_transportadora = entrega.id_cliente
and entrega.data_entrega > entrega.data_prevista) ;

-- quantidade de clientes que pagaram o produto exclusivamente com o metodo de pagamento pix

select count(*) as quantidade_de_pix from cliente as c
inner join pedido as p on c.id_cliente = p.id_cliente
and p.status_pedido='Concluido' inner join pagamento as pg 
where p.id_pagamento = pg.id_pagamento and pg.metodo_pagamento = 
'Pix';
