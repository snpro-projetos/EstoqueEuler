# SNPro Estoque

Sistema web de estoque em Flask + Flask-SQLAlchemy com banco SQLite em arquivo.

## Como rodar

```bash
python -m venv venv
```

Git Bash:

```bash
source venv/Scripts/activate
```

PowerShell:

```powershell
.\venv\Scripts\Activate.ps1
```

Instale as dependências:

```bash
pip install -r requirements.txt
```

Rode a aplicação:

```bash
python run.py
```

Acesse:

```txt
http://127.0.0.1:5000
```

## Alterações desta versão

- Página Tipos de Produto criada com cadastro, edição e exclusão.
- Produtos agora usam os tipos cadastrados no banco.
- Categorias e Tipos de Produto possuem proteção contra exclusão quando existem produtos vinculados.
- Modal de confirmação de exclusão padronizado para produto, categoria e tipo de produto.
- Ícones de editar, visualizar e excluir ficaram mais visíveis.
- Menu lateral revisado com identidade SNPro Estoque.
- Paleta visual atualizada para diferenciar das versões anteriores.

## Atualização - Movimentações

Esta versão inclui a página de Movimentações com:

- listagem de entradas, saídas, transferências, empréstimos, retornos, manutenção e descarte;
- filtros por produto, tipo e texto de busca;
- modal para registrar nova movimentação;
- atualização automática de quantidade do produto em entradas, saídas e retornos;
- transferência alterando o local do produto;
- modal de confirmação antes de excluir movimentação.
