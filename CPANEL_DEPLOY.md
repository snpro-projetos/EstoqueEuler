# Deploy no cPanel

Este projeto e uma aplicacao Flask. No cPanel, use o recurso **Setup Python App** quando ele estiver disponivel.

## 1. Arquivos para enviar

Envie estes itens para a pasta da aplicacao no cPanel:

```txt
app/
instance/postgres_setup.sql
passenger_wsgi.py
requirements.txt
run.py
.env.example
```

Nao envie:

```txt
.env
venv/
__pycache__/
instance/estoque.db
.git/
```

## 2. Configuracao do Python App

No cPanel, abra **Setup Python App** e configure:

```txt
Application root: pasta onde voce enviou o projeto
Application URL: estoque.snpro.com.br
Application startup file: passenger_wsgi.py
Application Entry point: application
```

Depois instale as dependencias:

```bash
pip install -r requirements.txt
```

## 3. Variaveis de ambiente

Configure as variaveis no painel do Python App. Se o painel nao tiver campo para isso, crie um `.env` dentro da pasta da aplicacao, mas nunca publique esse arquivo no Git.

```env
SECRET_KEY=COLOQUE_UMA_CHAVE_SECRETA_FORTE_AQUI
DB_HOST=10.13.14.114
DB_PORT=3306
DB_USER=USUARIO_DO_MARIADB
DB_PASSWORD=SENHA_DO_MARIADB
DB_NAME=estoque_euler
ADMIN_EMAIL=EMAIL_DO_ADMIN_INICIAL
ADMIN_PASSWORD=SENHA_FORTE_DO_ADMIN_INICIAL
```

## 4. Teste

Depois de reiniciar a aplicacao no cPanel, acesse:

```txt
https://estoque.snpro.com.br/teste-banco
```

Se estiver certo, deve retornar:

```json
{"database":"connected","status":"ok"}
```

## 5. Observacao importante sobre rede

O servidor do cPanel precisa conseguir acessar a VM MariaDB em:

```txt
10.13.14.114:3306
```

Se o cPanel estiver fora da rede interna da empresa, esse IP privado nao sera acessivel. Nesse caso, sera necessario VPN, tunel, firewall/liberacao de rede ou hospedar a aplicacao na mesma rede da VM.
