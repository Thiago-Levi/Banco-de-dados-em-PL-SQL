
CREATE TABLE TB_usuario(
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR2(100) NOT NULL,
    email VARCHAR2(100) UNIQUE NOT NULL,
    senha VARCHAR2(256) NOT NULL
);

INSERT INTO TB_usuario(nome, email, senha)
VALUES('teste1', 'teste1@email.com', 'senha123');

SELECT * FROM TB_usuario;

--------------------------

CREATE TABLE TB_clientes(
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR2(100) NOT NULL,
    email VARCHAR2(100) UNIQUE NOT NULL,
    cpf VARCHAR2(12) UNIQUE NOT NULL,
    cep VARCHAR2(9),
    rua VARCHAR2(100),
    numero NUMBER,
    bairro VARCHAR2(100),
    cidade VARCHAR2(100),
    estado CHAR(2),
    usuario_id NUMBER NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES TB_usuario(id)
);

INSERT INTO TB_clientes(nome, email, cpf, cep, rua, numero, bairro, cidade, estado, usuario_id)
VALUES('cliente1', 'cliente1@email.com', '111111111111', '6190000', 'Minha Rua', 1, 'Meu Bairro', 'Fortaleza', 'CE', 1 );

SELECT * FROM TB_clientes;


------------------------------------------------
CREATE TABLE TB_pedidos(
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cliente_id NUMBER,
    observacao VARCHAR2(256),
    valor_total FLOAT,
    FOREIGN KEY (cliente_id) REFERENCES TB_clientes(id)
);

---------------------------------------------------
CREATE TABLE TB_categorias(
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    descricao VARCHAR2(50)
);

INSERT INTO TB_categorias (descricao)
SELECT 'Informática' FROM DUAL UNION ALL
SELECT 'Celulares' FROM DUAL UNION ALL
SELECT 'Beleza e Perfumaria' FROM DUAL UNION ALL
SELECT 'Mercado' FROM DUAL UNION ALL
SELECT 'Livros e Papelaria' FROM DUAL UNION ALL
SELECT 'Brinquedos' FROM DUAL UNION ALL
SELECT 'Moda' FROM DUAL UNION ALL
SELECT 'Bebê' FROM DUAL UNION ALL
SELECT 'Games' FROM DUAL;


-----------------------------------------------------------

CREATE TABLE TB_pedido_produtos(
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    pedido_id NUMBER,
    produto_id NUMBER,
    quantidade_produto NUMBER,
    valor_produto FLOAT,
    FOREIGN KEY (pedido_id) REFERENCES TB_pedidos(id),
    FOREIGN KEY (produto_id) REFERENCES TB_produtos(id)
);


-------------------------------------------------

CREATE TABLE TB_produtos(
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    descricao VARCHAR2(256),
    quantidade_estoque NUMBER,
    valor FLOAT,
    categoria_id NUMBER,
    produto_imagem VARCHAR2(400)
    FOREIGN KEY (categoria_id) REFERENCES TB_categorias(id)
);


