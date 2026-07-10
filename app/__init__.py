import os
from flask import Flask
from flask_sqlalchemy import SQLAlchemy


db = SQLAlchemy()


def _database_uri():
    """Define o banco conforme o ambiente.

    - Em producao, use DATABASE_URL apontando para PostgreSQL ou outro banco externo.
    - Na Vercel sem DATABASE_URL, usa SQLite em /tmp apenas para evitar erro de escrita.
      Esse SQLite e temporario e nao deve ser usado como banco definitivo.
    - Localmente, mantem o SQLite dentro da pasta instance do Flask.
    """
    database_url = os.getenv("DATABASE_URL")
    if database_url:
        if database_url.startswith("postgres://"):
            database_url = database_url.replace("postgres://", "postgresql://", 1)
        return database_url

    if os.getenv("VERCEL"):
        return "sqlite:////tmp/estoque.db"

    return "sqlite:///estoque.db"


def create_app():
    app = Flask(__name__, instance_relative_config=True)

    app.config["SECRET_KEY"] = os.getenv("SECRET_KEY", "troque-esta-chave")
    app.config["SQLALCHEMY_DATABASE_URI"] = _database_uri()
    app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False

    db.init_app(app)

    from .routes import main, _aplicar_correcoes_padrao
    app.register_blueprint(main)

    with app.app_context():
        db.create_all()
        _aplicar_correcoes_padrao()

    return app
