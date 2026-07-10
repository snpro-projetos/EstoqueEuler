# Deploy do EstoqueMaster na Vercel

Este pacote ja foi ajustado para deploy Flask na Vercel.

## O que foi alterado

- Adicionado `main.py` exportando `app` a partir de `run.py`.
- Removida a necessidade de `pyproject.toml` para declarar o entrypoint.
- Ajustado `app/__init__.py` para:
  - aceitar `DATABASE_URL` em producao;
  - usar SQLite em `/tmp/estoque.db` quando estiver na Vercel sem banco externo;
  - criar as tabelas automaticamente na inicializacao da aplicacao.

## Importante

Nao mantenha um `pyproject.toml` incompleto na raiz do projeto. Se existir apenas:

```toml
[tool.vercel]
entrypoint = "run:app"
```

apague esse arquivo, porque a Vercel pode tentar instalar dependencias via `uv` e gerar o erro:

```txt
No `project` table found in pyproject.toml
```

## Estrutura esperada

```txt
app/
main.py
run.py
requirements.txt
README.md
```

## Comandos

```bash
git add .
git commit -m "Corrige deploy Flask na Vercel"
git push
```

## Banco de dados

Para teste, o SQLite em `/tmp` evita erro de escrita na Vercel, mas os dados podem ser perdidos em reinicios da funcao.
Para uso real, configure uma variavel de ambiente `DATABASE_URL` apontando para PostgreSQL.
