# Login do EstoqueMaster

Foi adicionada uma tela de login funcional protegendo as rotas internas da aplicação.

## Credenciais padrão

Email: euler.junior@snpro.com.br
Senha: EstoqueEuler2026

## Como trocar sem editar código

No Render, crie ou altere a variável de ambiente:

LOGIN_PASSWORD=SuaNovaSenha

Depois faça redeploy da aplicação.

Também é possível alterar o email por variável de ambiente:

LOGIN_EMAIL=outro.email@dominio.com.br

## Observação de segurança

Para produção, defina também uma SECRET_KEY forte nas variáveis de ambiente do Render.
