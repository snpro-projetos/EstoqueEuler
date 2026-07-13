# Deploy na Vercel com Neon PostgreSQL

Este projeto Flask foi preparado para rodar na Vercel usando PostgreSQL hospedado no Neon.

## 1. Criar o banco no Neon

1. Acesse o Neon.
2. Crie um projeto PostgreSQL.
3. Copie a connection string do banco.

Ela deve ser parecida com:

```txt
postgresql://usuario:senha@host/neondb?sslmode=require
```

Nao coloque essa URL no codigo.

## 2. Criar a estrutura do banco

No Neon, abra o SQL Editor e execute o conteudo de:

```txt
instance/postgres_setup.sql
```

Esse script cria as tabelas, constraints e indices. Ele nao insere dados e nao contem secrets.

## 3. Configurar variaveis na Vercel

No projeto da Vercel, va em **Settings > Environment Variables** e cadastre:

```env
SECRET_KEY=sua_chave_secreta_aqui
DATABASE_URL=postgresql://usuario:senha@host/neondb?sslmode=require
ADMIN_EMAIL=admin@exemplo.com
ADMIN_PASSWORD=senha_admin_aqui
```

Use valores reais apenas no painel da Vercel, nunca no repositorio.

## 4. Fazer deploy

1. Faca commit e push para o repositorio.
2. Importe o projeto na Vercel.
3. Confirme que o arquivo `vercel.json` esta na raiz.
4. Inicie o deploy.

## 5. Testar

Depois do deploy, acesse:

```txt
https://seu-dominio/teste-banco
```

Se a conexao estiver correta, a resposta sera:

```json
{"database":"connected","status":"ok"}
```

Depois acesse:

```txt
https://seu-dominio/login
```

Se a tabela `usuarios` estiver vazia, a aplicacao cria o primeiro administrador com `ADMIN_EMAIL` e `ADMIN_PASSWORD`.

## Observacao sobre rede interna

IPs privados como `10.x.x.x`, por exemplo `10.13.14.114`, nao funcionam diretamente na Vercel porque a Vercel roda fora da rede interna da empresa.

Por isso o banco precisa estar acessivel publicamente por um servico como Neon, usando a `DATABASE_URL` fornecida pelo Neon.
