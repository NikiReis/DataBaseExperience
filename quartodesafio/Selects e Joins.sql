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


--  todos as ordens de serviço onde o carro é da montadora chevrolet e o ano de
-- fabricação é menor do que 2015


-- todas as ordens de servicos concluidas 


-- todas as OS's em execução


-- todas as OS's em que demoraram mais de 5 dias para serem concluidas


-- media de quantos mecanicos foram encaminhados para cada tipo de servico


-- clientes que solicitaram OS para mais de um carro 