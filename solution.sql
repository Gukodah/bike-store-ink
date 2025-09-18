
-- CUSTOMERS

CREATE TABLE CUSTOMERS (
  customer_id SERIAL PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  phone TEXT,
  email TEXT,
  street TEXT,
  city TEXT,
  state TEXT,
  zip_code TEXT
);

INSERT INTO CUSTOMERS VALUES (
  DEFAULT,
  'Pedro',
  'Gomes', 
  '159974511', 
  'pedro@gmail.com', 
  'Rua Pereira Jao, n 100, Centro',
  'Cesário Lange',
  'São Paulo',
  '18285000'
);
INSERT INTO CUSTOMERS VALUES (
  DEFAULT,
  'Joao',
  'Antonio', 
  '159974522', 
  'joao@gmail.com', 
  'Rua Lombardozo afonso, n 122, Centro',
  'Cesário Lange',
  'São Paulo',
  '18285000'
);
INSERT INTO CUSTOMERS VALUES (
  DEFAULT,
  'Maria',
  'Fonseca', 
  '159974533', 
  'maria@gmail.com', 
  'Rua Madre Liga, n 222, Centro',
  'Cesário Lange',
  'São Paulo',
  '18285000'
);
INSERT INTO CUSTOMERS VALUES (
  DEFAULT,
  'Jones',
  'Manoel', 
  '159974566', 
  'jonesmale@gmail.com', 
  'Rua Padre Liga, n 223, Centro',
  'Cesário Lange',
  'São Paulo',
  '18285000'
);
-- STORES

CREATE TABLE STORES (
  store_id SERIAL PRIMARY KEY,
  store_name TEXT,
  phone TEXT,
  email TEXT,
  street TEXT,
  city TEXT,
  state TEXT,
  zip_code TEXT
);

INSERT INTO STORES VALUES (
  DEFAULT, 
  'Loja A',
  '32461387',
  'lojaa@gmail.com',
  'Rua Jacinto Pinto de Barros, n 600, Centro',
  'Cesário Lange',
  'São Paulo',
  '18285000'
);
INSERT INTO STORES VALUES (
  DEFAULT, 
  'Loja B',
  '32461322',
  'lojaa@gmail.com',
  'Rua Jacinto Leite de Ferro, n 611, Centro',
  'Cesário Lange',
  'São Paulo',
  '18285000'
);
INSERT INTO STORES VALUES (
  DEFAULT, 
  'Loja C',
  '32461333',
  'lojaC@gmail.com',
  'Rua Pedreiro Pinto de Pedra, n 60220, Centro',
  'Cesário Lange',
  'São Paulo',
  '18285000'
);

-- STAFFS

CREATE TABLE STAFFS (
  staff_id SERIAL PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  email TEXT,
  phone TEXT,
  active TEXT,
  
  store_id INTEGER, 
  manager_id INTEGER REFERENCES STAFFS(staff_id),
  CONSTRAINT store_id_fk FOREIGN KEY(store_id) REFERENCES STORES (store_id)
);

INSERT INTO STAFFS VALUES (DEFAULT, 'Marcos', 'Pereira', 'marcos@gmail.com', '15997337022', 'True', 1, 1);
INSERT INTO STAFFS VALUES (DEFAULT, 'Antonio', 'Lima', 'antonio@gmail.com', '15997227011', 'True', 2, 2);
INSERT INTO STAFFS VALUES (DEFAULT, 'Lelio', 'Johanes', 'lelio@gmail.com', '15997227055', 'True', 3, 3);
INSERT INTO STAFFS VALUES (DEFAULT, 'Amelon', 'Jones', 'am@gmail.com', '15997227025', 'True', 3, 3);

-- ORDERS

CREATE TABLE ORDERS (
  order_id SERIAL PRIMARY KEY,
  order_status INTEGER,
  order_date TIMESTAMP WITHOUT TIME ZONE,
  required_date TIMESTAMP WITHOUT TIME ZONE,
  shipped_date TIMESTAMP WITHOUT TIME ZONE,
    
  store_id INTEGER,
  customer_id INTEGER,
  staff_id INTEGER,
  
  CONSTRAINT customer_id_fk FOREIGN KEY (customer_id) REFERENCES CUSTOMERS (customer_id),
  CONSTRAINT store_id_fk FOREIGN KEY (store_id) REFERENCES STORES (store_id),
  CONSTRAINT staff_id_fk FOREIGN KEY (staff_id) REFERENCES STAFFS (staff_id)
);

INSERT INTO ORDERS VALUES 
  (
    DEFAULT, 
    1, 
    '2025-09-10 10:00:00',
    '2025-09-10 10:00:00',
    '2025-09-10 10:00:00',
    1,1,1
  );
INSERT INTO ORDERS VALUES 
  (
    DEFAULT, 
    1, 
    '2025-01-20 10:00:00',
    '2025-01-25 10:00:00',
    '2025-01-30 10:00:00',
    2,2,2
  );
INSERT INTO ORDERS VALUES 
  (
    DEFAULT, 
    1, 
    '2025-03-11 10:00:00',
    '2025-03-11 10:00:00',
    '2025-03-11 10:00:00',
    3,3,3
  );
  
  
-- CATEGORIES

CREATE TABLE CATEGORIES (
  category_id SERIAL PRIMARY KEY,
  category_name TEXT
);

INSERT INTO CATEGORIES VALUES (DEFAULT, 'Tenis para Pé Grande');
INSERT INTO CATEGORIES VALUES (DEFAULT, 'Tenis para Pé Médio');
INSERT INTO CATEGORIES VALUES (DEFAULT, 'Tenis para Pé Pequeno');

-- BRANDS

CREATE TABLE BRANDS (
  brand_id SERIAL PRIMARY KEY,
  brand_name TEXT
);

INSERT INTO BRANDS VALUES (DEFAULT, 'Nike');
INSERT INTO BRANDS VALUES (DEFAULT, 'Adidas');
INSERT INTO BRANDS VALUES (DEFAULT, 'Tenis Pé');

-- PRODUCTS

CREATE TABLE PRODUCTS (
  product_id SERIAL PRIMARY KEY,
  product_name TEXT,
  model_year INTEGER,
  list_price DECIMAL,
  
  brand_id INTEGER,
  category_id INTEGER,
  
  CONSTRAINT category_id_fk FOREIGN KEY (category_id) REFERENCES CATEGORIES (category_id),
  CONSTRAINT brand_id_fk FOREIGN KEY (brand_id) REFERENCES BRANDS (brand_id)
);

INSERT INTO PRODUCTS VALUES (
  DEFAULT,
  'Tenis confortavel para esportes',
  2018,
  999.99,
  1,
  1
);
INSERT INTO PRODUCTS VALUES (
  DEFAULT,
  'Tenis confortavel para festas',
  2019,
  9199.99,
  2,
  2
);
INSERT INTO PRODUCTS VALUES (
  DEFAULT,
  'Tenis confortavel para danças',
  2020,
  919.99,
  3,
  3
);
INSERT INTO PRODUCTS VALUES (
  DEFAULT,
  'Tenis confortavel para montanhas',
  2022,
  91999.99,
  3,
  3
);

-- STOCKS

CREATE TABLE STOCKS (
  quantity INTEGER,
  store_id INTEGER NOT NULL,
  product_id INTEGER NOT NULL,
  
  CONSTRAINT store_id_fk FOREIGN KEY (store_id) REFERENCES STORES (store_id),
  CONSTRAINT product_id_fk FOREIGN KEY (product_id) REFERENCES PRODUCTS (product_id)
);

INSERT INTO STOCKS VALUES (
  10,
  1,
  1
);
INSERT INTO STOCKS VALUES (
  120,
  2,
  2
);
INSERT INTO STOCKS VALUES (
  3400,
  3,
  3
);

-- ORDER_ITEMS

CREATE TABLE ORDER_ITEMS (
  item_id SERIAL PRIMARY KEY,
  quantity INTEGER,
  last_price DECIMAL(10,2),
  discount DECIMAL(10,2),
  
  product_id INTEGER,
  order_id INTEGER,
  
  CONSTRAINT order_id_fk FOREIGN KEY (order_id) REFERENCES ORDERS (order_id),
  CONSTRAINT product_id_fk FOREIGN KEY (product_id) REFERENCES PRODUCTS (product_id)
);

INSERT INTO ORDER_ITEMS VALUES (
  DEFAULT, 
  2,
  1999.98,
  0,
  1,
  1
);

INSERT INTO ORDER_ITEMS VALUES (
  DEFAULT, 
  5,
  45999.95,
  100,
  2,
  2
);

INSERT INTO ORDER_ITEMS VALUES (
  DEFAULT, 
  10,
  9199.9,
  100,
  3,
  3
);


-- 1) Listar todos Clientes que não tenham realizado uma compra;
SELECT c.*
FROM CUSTOMERS c
LEFT JOIN ORDERS o ON c.customer_id = o.customer_id WHERE o.customer_id IS NULL;

-- 2) Listar os Produtos que não tenham sido comprados
SELECT p.*
FROM PRODUCTS p 
LEFT JOIN ORDER_ITEMS oi ON p.product_id = oi.product_id WHERE oi.product_id IS NULL;

-- 3) Listar os Produtos sem Estoque
SELECT p.*
FROM PRODUCTS p 
LEFT JOIN STOCKS S ON p.product_id = s.product_id WHERE s.product_id IS NULL;

-- 4) Agrupar a quantidade de vendas que uma determinada Marca por Loja. 

SELECT
  st.store_id,
  st.store_name,
  b.brand_id,
  b.brand_name,
  SUM(oi.quantity) AS items_sold
FROM stores st
JOIN orders o        ON o.store_id      = st.store_id
JOIN order_items oi  ON oi.order_id     = o.order_id
JOIN products p      ON p.product_id    = oi.product_id
JOIN brands b        ON b.brand_id      = p.brand_id
GROUP BY
  st.store_id, st.store_name,
  b.brand_id, b.brand_name
ORDER BY st.store_name, b.brand_name;

-- 5) Listar os Funcionarios que não estejam relacionados a um Pedido. 
SELECT s.*
FROM STAFFS s 
LEFT JOIN ORDERS o ON s.staff_id = o.staff_id WHERE o.staff_id IS NULL;
