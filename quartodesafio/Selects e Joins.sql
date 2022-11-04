-- todos os servicos prestados por um mecanico 
use mecanica;
select id_mecanico,nome_mecanico from mecanico m
inner join servicos_mecanico sm on m.id_mecanico = 
sm.id_mecanico inner join servico_prestado sp on sm.id_servico = 
sp.idServico order by m.id_mecanico,m.nome_mecanico;

-- quantas ordens de seriço um cliente ja solicitou
select id_cliente,nome_cliente,count(*) as quantidade from cliente c
inner join cliente_solicita_os cso on c.id_cliente = 
cso.id_cliente inner join ordem_de_servico  os where 
cso.id_ordem_servico = os.idOS group by c.id_cliente,c.nome_cliente;

-- todas as ordens de seriço onde o carro é da montadora chevrolet
select os.id_OS,os.descricao, os.status_os from ordem_de_servico os
inner join cliente_solicita_os cls on os.idOS = cls.id_ordemServico where
(select id_cliente, nome_cliente from cliente c inner join carro cr 
on c.id_cliente = cr.id_cliente and montadora = 'chevrolet');

--  todos as ordens de serviço onde o carro é da montadora chevrolet e o ano de
-- fabricação é menor do que 2015
select idOS, descricao from ordem_de_servico os inner join
cliente_solicita_os cls on os.idOS = cls.id_ordemServico
inner join cliente c on cls.id_cliente = c.id_cliente
inner join carro cr on c.id_cliente = cr.id_cliente and
cr.montadora = 'Chevrolet' and cr.ano < '2015-01-01';

-- todas as ordens de servicos concluidas 
select * from ordem_de_servico where status_os = 'Concluido';

-- todas as OS's em execução
select * from ordem_de_servico where status_os = 'Em execucao';

-- todas as OS's em que demoraram mais de 5 dias para serem concluidas
select * from ordem_de_servico os where (os.data_emissao - os.data_conclusao) > 5;


-- clientes que solicitaram OS para mais de um carro 

select idOS, descricao from ordem_de_servico os inner join
cliente_solicita_os cls on os.idOS = cls.id_ordemServico
inner join cliente c on cls.id_cliente = c.id_cliente
inner join carro cr on c.id_cliente = cr.id_cliente inner
join mecanico_analisa_carro mac on mac.carro_id_cliente = cr.id_cliente
group by mac.carro_id_cliente having count(*) > 1;


