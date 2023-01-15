-- todos os servicos prestados por um mecanico 
use mecanica;
select m.id_mecanico,nome_mecanico,especialidade,Nome as Nome_Servico,descricao as Descricao_Servico,
valor as Valor_Servico from mecanico m inner join servicos_mecanico sm
on m.id_mecanico = sm.id_mecanico inner join servico_prestado spr
on sm.id_servico = spr.idServico order by m.id_mecanico;

-- quantas ordens de seriço um cliente ja solicitou
select c.id_cliente,nome_cliente,count(*) as quantidade from cliente c
inner join cliente_solicita_os cso on c.id_cliente = 
cso.id_cliente inner join ordem_de_servico  os where 
cso.id_ordemServico = os.id_OS group by c.id_cliente,c.nome_cliente;

-- todas as ordens de seriço onde o carro é da montadora chevrolet
select c.id_cliente,nome_cliente,id_carro,modelo,montadora,ano,descricao,statusOS
from ordem_de_servico os inner join cliente_solicita_os cls on
os.id_OS = cls.id_ordemServico inner join cliente c on cls.id_cliente = 
c.id_cliente inner join carro cr on cr.id_cliente = c.id_cliente and
montadora = 'Chevrolet';

--  todos as ordens de serviço onde o carro é da montadora chevrolet e o ano de
-- fabricação é menor do que 2015

select id_OS, descricao,c.id_cliente,nome_cliente,cr.id_carro,
modelo,montadora,ano from ordem_de_servico os inner join
cliente_solicita_os cls on os.id_OS = cls.id_ordemServico
inner join cliente c on cls.id_cliente = c.id_cliente
inner join carro cr on c.id_cliente = cr.id_cliente and
cr.montadora = 'Chevrolet' and cr.ano < '2015-01-01';

-- todas as ordens de servicos concluidas 
select * from ordem_de_servico where statusOS = 'Concluido';

-- todas as OS's em execução
select * from ordem_de_servico where statusOS = 'Em execucao';

-- todas as OS's em que demoraram mais de 5 dias para serem concluidas
select * from ordem_de_servico os where (os.data_emissao - os.data_conclusao) > 5;


-- clientes que solicitaram OS para mais de um carro 

select id_OS,descricao,nome_cliente,c.id_cliente,cr.id_carro,cr.modelo,
cr.montadora,cr.ano from ordem_de_servico os inner join
cliente_solicita_os cls on os.id_OS = cls.id_ordemServico
inner join cliente c on cls.id_cliente = c.id_cliente
inner join carro cr on c.id_cliente = cr.id_cliente inner join 
mecanico_analisa_carro mac where (select count(distinct(idcarro))
and mac.carro_id_cliente = cr.id_cliente) group by 
mac.carro_id_cliente having count(mac.idcarro) > 1;

