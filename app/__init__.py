import os

from dotenv import load_dotenv
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.engine import URL


db = SQLAlchemy()


def _env_obrigatoria(nome):
    valor = os.getenv(nome)
    if valor:
        return valor
    raise RuntimeError(f"Variavel de ambiente obrigatoria nao configurada: {nome}")


def _database_uri():
    return URL.create(
        "mysql+pymysql",
        username=_env_obrigatoria("DB_USER"),
        password=_env_obrigatoria("DB_PASSWORD"),
        host=_env_obrigatoria("DB_HOST"),
        port=int(os.getenv("DB_PORT", "3306")),
        database=_env_obrigatoria("DB_NAME"),
        query={"charset": "utf8mb4"},
    ).render_as_string(hide_password=False)


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
