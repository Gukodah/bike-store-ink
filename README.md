# Bike Store Ink

Base de dados que utiliza o SGBD **PostgreSQL** para representar a organização interna do processo de operação de uma loja de venda de bicicletas.

---

## Etapas para produção da solução

### 1. DDL (Data Definition Language)
Iniciei escrevendo todo o código referente à definição do schema (tabelas, chaves, constraints).

### 2. Modelagem e relacionamentos
Busquei decifrar os relacionamentos entre as entidades e entender melhor o contexto.

- **2.1** — A base organiza **Pedidos (Orders)**.  
- **2.2** — Os **Pedidos** são feitos por **Clientes (Customers)**; um mesmo cliente pode ter **N** pedidos.  
- **2.3** — Os **Produtos (Products)** incluídos nos pedidos possuem diferentes **Lojas (Stores)** fornecedoras, que disponibilizam os produtos aos clientes.  
- **2.4** — O fornecimento para um **Cliente** por meio de um **Pedido** envolve: **Loja (Store)**, **Administrador da Loja (Staff)** e **Itens do Pedido (Order_Items)**.

### 3. DML (Data Manipulation Language)
Inseri dados nas tabelas para permitir testes das consultas.

### 4. Hierarquia em `staffs`
A tabela **`staffs`** possui o campo **`manager_id`** (FK para a própria tabela) para organizar a **hierarquia** de administradores.  
Quando um administrador não possui superior, **`manager_id` = NULL**, indicando que é o responsável máximo de determinada loja.

### 5. Seed inicial
**22:53** — Concluí o *seeding* (adição de dados iniciais) de todas as tabelas.

### 6. Ajuste dos seeds
Ajustei os dados iniciais para garantir que as consultas do desafio retornem linhas, facilitando a verificação de correção.

### 7. Consulta: clientes sem compras
> “Listar todos os clientes que não tenham realizado uma compra.”  
Exige ao menos um **Customer** sem associação na tabela **`orders`**.

### 8. Consulta: produtos não comprados
> “Listar os produtos que não tenham sido comprados.”  
Exige ao menos um **Product** que **não** apareça em **`order_items`**.

### 9. Consulta: produtos sem estoque
> “Listar os produtos sem estoque.”  
Exige ao menos um **Product** que **não** esteja associado em **`stocks`**.

### 10. Consulta: funcionários sem pedidos
> “Listar os funcionários que não estejam relacionados a um pedido.”  
Exige ao menos um **Staff** que **não** esteja associado a **`orders`**.

### 11. Agrupar vendas por marca e por loja
> “Agrupar a quantidade de vendas de uma determinada **Marca (Brand)** por **Loja (Store)**.”

---

## Tecnologias utilizadas

- **PostgreSQL**

---

## Como instalar e utilizar o projeto

1. **Clone** este repositório.  
2. Acesse **[OneCompiler – PostgreSQL](https://onecompiler.com/postgresql)** para executar SQL online.  
3. **Cole** o conteúdo do arquivo `solution.sql` (na raiz do repositório).  
4. Clique em **Run** (canto superior direito) e verifique o *log* para os resultados de cada desafio, em ordem ascendente.

---

> Este é um desafio da **[Coodesh](https://coodesh.com/)**.
