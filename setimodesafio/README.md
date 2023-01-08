# *Personalizando Acessos e Automatizando ações no MySQL*

## Parte 1 – Personalizando acessos com views 

### Neste desafio você irá criar visões para os seguintes cenários 

      • Número de empregados por departamento e localidade 

      • Lista de departamentos e seus gerentes 

      • Projetos com maior número de empregados (ex: por ordenação desc) 

      • Lista de projetos, departamentos e gerentes 

      • Quais empregados possuem dependentes e se são gerentes 

#### Além disso, serão definidas as permissões de acesso as views de acordo com o tipo de conta de usuários. Lembre-se que as views ficam armazaneadas no banco de dados como uma “tabela”. Assim podemos definir permissão de acesso a este item do banco de dados.  

#### Você poderá criar um usuário gerente que terá acesso as informações de employee e departamento. Contudo, employee não terá acesso as informações relacionadas aos departamentos ou gerentes. 

#### Obs: *O tema de permissão de usuários foi apresentada no curso Explorando Cláusulas de DDL e Esquemas de Banco de Dados no MySQL.* 

  

## Parte 2 – Criando gatilhos para cenário de e-commerce 

### Objetivo: 

#### Sabemos que a criação de triggers está associadas a ações que podem ser tomadas em momento anterior ou posterior a inserção, ou atualização dos dados. Além disso, em casos de remoção podemos utilizar as triggers. Sendo assim, crie as seguintes triggers para o cenário de e-commerce. 

### Exemplo de trigger para base.
#### Entregável: 

    • Triggers de remoção: before delete 

    • Triggers de atualização: before update 

### Remoção: 
#### Usuários podem excluir suas contas por algum motivo. Dessa forma, para não perder as informações sobre estes usuários, crie um gatilho before remove 

### Atualização:  
#### Inserção de novos colaboradores e atualização do salário base. 
#
#### E agora... Finalizou seu desafio ? 
#### Adicione o link do github com o projeto e submeta para avaliação. 
