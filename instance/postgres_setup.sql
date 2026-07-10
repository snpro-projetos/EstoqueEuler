-- Script MariaDB gerado para o projeto SNPro Estoque.
-- Uso sugerido:
--   mysql -u seu_usuario -p estoque_euler < instance/postgres_setup.sql
--
-- Observacao: apesar do nome do arquivo, este script esta em sintaxe MariaDB.
-- Ele cria somente a estrutura do banco e nao importa dados.

SET NAMES utf8mb4;
START TRANSACTION;

CREATE TABLE IF NOT EXISTS usuarios (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(120) NOT NULL,
    email VARCHAR(150) NOT NULL,
    senha_hash VARCHAR(255) NOT NULL,
    perfil VARCHAR(30) NOT NULL DEFAULT 'Operador',
    status VARCHAR(30) NOT NULL DEFAULT 'Ativo',
    criado_em DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uq_usuarios_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS equipamentos (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(80) NOT NULL,
    descricao TEXT,
    status VARCHAR(30) NOT NULL DEFAULT 'Ativo',
    PRIMARY KEY (id),
    UNIQUE KEY uq_equipamentos_nome (nome)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS tipos_produto (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(80) NOT NULL,
    descricao TEXT,
    status VARCHAR(30) NOT NULL DEFAULT 'Ativo',
    PRIMARY KEY (id),
    UNIQUE KEY uq_tipos_produto_nome (nome)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS locais (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(150),
    descricao TEXT,
    status VARCHAR(30) NOT NULL DEFAULT 'Ativo',
    PRIMARY KEY (id),
    UNIQUE KEY uq_locais_nome (nome)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS produtos (
    id INT NOT NULL AUTO_INCREMENT,
    sku VARCHAR(50) NOT NULL,
    nome VARCHAR(150) NOT NULL,
    equipamento VARCHAR(80) NOT NULL,
    tipo_produto VARCHAR(80),
    local VARCHAR(100) NOT NULL,
    quantidade INT NOT NULL DEFAULT 1,
    estoque_minimo INT NOT NULL DEFAULT 1,
    ticket_medio DOUBLE NOT NULL DEFAULT 0.01,
    status VARCHAR(30) NOT NULL DEFAULT 'Ativo',
    descricao TEXT,
    PRIMARY KEY (id),
    UNIQUE KEY uq_produtos_sku (sku),
    KEY ix_produtos_nome (nome),
    KEY ix_produtos_equipamento (equipamento),
    KEY ix_produtos_local (local)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS movimentacoes (
    id INT NOT NULL AUTO_INCREMENT,
    tipo VARCHAR(40) NOT NULL,
    produto_id INT NOT NULL,
    produto_nome VARCHAR(150) NOT NULL,
    quantidade INT NOT NULL DEFAULT 1,
    valor_unitario DOUBLE NOT NULL DEFAULT 0.0,
    total DOUBLE NOT NULL DEFAULT 0.0,
    local VARCHAR(100) NOT NULL,
    observacao TEXT,
    criado_em DATETIME NOT NULL,
    PRIMARY KEY (id),
    KEY ix_movimentacoes_produto_id (produto_id),
    KEY ix_movimentacoes_criado_em (criado_em),
    CONSTRAINT fk_movimentacoes_produto FOREIGN KEY (produto_id)
        REFERENCES produtos (id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS importacoes_planilha (
    id INT NOT NULL AUTO_INCREMENT,
    nome_arquivo VARCHAR(200),
    produtos_skus TEXT NOT NULL,
    total_novos INT NOT NULL DEFAULT 0,
    total_atualizados INT NOT NULL DEFAULT 0,
    criado_em DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS dashboard_graficos (
    id INT NOT NULL AUTO_INCREMENT,
    titulo VARCHAR(120) NOT NULL,
    fonte VARCHAR(40) NOT NULL DEFAULT 'produtos',
    tipo_grafico VARCHAR(20) NOT NULL DEFAULT 'barra',
    coluna_grupo VARCHAR(60) NOT NULL DEFAULT 'equipamento',
    metrica VARCHAR(60) NOT NULL DEFAULT 'contagem',
    filtro_coluna VARCHAR(60),
    filtro_operador VARCHAR(20),
    filtro_valor VARCHAR(120),
    criado_em DATETIME NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

COMMIT;
