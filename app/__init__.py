import os

from dotenv import load_dotenv
from flask import Flask
from flask_sqlalchemy import SQLAlchemy


db = SQLAlchemy()


def _env_obrigatoria(nome):
    valor = os.getenv(nome)
    if valor:
        return valor
    raise RuntimeError(f"Variavel de ambiente obrigatoria nao configurada: {nome}")


def _database_uri():
    database_url = os.getenv("DATABASE_URL")
    if database_url:
        if database_url.startswith("postgres://"):
            database_url = database_url.replace("postgres://", "postgresql://", 1)
        return database_url

    return "sqlite:///estoque.db"


def create_app():
    load_dotenv()

    app = Flask(__name__, instance_relative_config=True)

    app.config["SECRET_KEY"] = _env_obrigatoria("SECRET_KEY")
    app.config["SQLALCHEMY_DATABASE_URI"] = _database_uri()
    app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False

    db.init_app(app)

    from .routes import main
    app.register_blueprint(main)

    return app
