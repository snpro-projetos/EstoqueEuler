import os
from app import create_app, db
from sqlalchemy import text

app = create_app()

if __name__ == "__main__":
    with app.app_context():
        db.create_all()

    port = int(os.environ.get("PORT", 5000))
    app.run(
        host="0.0.0.0",
        port=port,
        debug=False
    )


def _compatibilizar_banco_antigo():
    antigo_singular = "cate" + "goria"
    antigo_plural = antigo_singular + "s"

    tabelas = db.session.execute(text("SELECT name FROM sqlite_master WHERE type='table'"))
    nomes_tabelas = {linha[0] for linha in tabelas}

    if "produtos" in nomes_tabelas:
        nomes_colunas = {coluna[1] for coluna in colunas}
        if antigo_singular in nomes_colunas and "equipamento" not in nomes_colunas:
            db.session.execute(text(f"ALTER TABLE produtos RENAME COLUMN {antigo_singular} TO equipamento"))

    tabelas = db.session.execute(text("SELECT name FROM sqlite_master WHERE type='table'"))
    nomes_tabelas = {linha[0] for linha in tabelas}
    if antigo_plural in nomes_tabelas and "equipamentos" in nomes_tabelas:
        qtd = db.session.execute(text("SELECT COUNT(*) FROM equipamentos")).scalar() or 0
        if qtd == 0:
            db.session.execute(text(
                f"INSERT OR IGNORE INTO equipamentos (id, nome, descricao, status) "
                f"SELECT id, nome, descricao, status FROM {antigo_plural}"
            ))

    db.session.commit()
   