## Bike Store Ink

- Base dados que ultiza o sistema gerenciador de banco de dados PGSQL, representa a organização interna do processo de operação de uma loja de venda de bicicletas.

### Etapas para produção da solução

 #### 1 - Comecei escrevendo todo o código relativo a DDL (Data Definition Language)

 #### 2 - Após isso fui atrás de decifrar os relacionamentos entre as entidades e tentar me inserir melhor no contexto apresentado

   ##### 2.1 - Ao que tudo indica essa base de dados irá organizar "Pedidos (Orders)".

   ##### 2.2 - Esses "Pedidos (Orders)" são feitos por "Clientes (Customers)". Sendo que um mesmo cliente pode ter N pedidos associados a sí.

   ##### 2.3 - Os produtos que serão inclusos nesses pedidos possuem diferentes fornecedores, ou "Lojas" (Stores), que fornecem os produtos que serão disponibilizados aos "Clientes" (Customers).

   ##### 2.4 - O processo de fornecimento de produtos para um "Cliente" (Customer) através de um pedido envolve: Loja (Store), Administrador da Loja (Staff), os item do pedido (Order_items).

#### 3 - Comecei a escrever DML (Data Manipulation Language), visando inserir alguns dados nas tabelas para poder realizar os testes.

### 4 - Fiquei um tempo tentando entender porque na tabela staffs existe um campo manager_id que é uma chave estrangeira que referencia a própria tabela staffs, mas aparentemente isso é para organziar a hierarquia entre os administradores de cada loja, sendo que quando um administrador não tiver um superior esse campo terá o valor NULL, indicando que ele é o administrador superior de uma determinada loja.

### 5 - 22:53 Terminei de seedar (Adiconar dados iniciais) todas as tables.

### 6 - Vou ajustar os seeds (dados iniciais) para que as consultas que vou construir, segundo as exigencias do desafio, retornem linhas para que eu possa checar se estão construidas corretamente ou não.

### 7 - Começando por: Listar todos Clientes que não tenham realizado uma compra; isso siginifica que preciso de ao menos uma row na tabela "CUSTOMERS" que não esteja associada a nenhuma row na tabela "ORDERS"

### 8 - Listar os Produtos que não tenham sido comprados; Preciso adicionar ao menos um produto que não façar parte de nenhuma linha da tabela "order_items".

### 9 - Listar os Produtos sem Estoque; Preciso de ao menos um produto que não esteja associado a nenhum estoque.

### 10 - Listar os funcionarios que não estejam associados a um pedido; isso requer que ao menos um funcionario (staff) esteja não associado a nenhum pedido (Order).

## 11 - Agrupar a quantidade de vendas que uma determinada Marca por Loja. 

### Técnologias utilizadas

  #### 1 - PostgreSQL

### Como instalar o projeto e utiliza-lo

  #### 1 - Clone o repositório

  #### 2 - Abra o site: https://onecompiler.com/postgresql. Esse te possibilita rodar sql em um SGBD PostgreSQL online.

  #### 3 - Cole o código presente no solution.sql que está na raiz do repositório.

  #### 4 - Aperte o botão Run no canto superior direito da tela. Verifique o log para os resultados de cada um dos desafios em ordem ascendente.

>  This is a challenge by [Coodesh](https://coodesh.com/)
