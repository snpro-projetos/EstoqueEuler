"""Entrypoint Flask para deploy na Vercel.

A Vercel procura uma variavel chamada `app` em arquivos padrao como
main.py, app.py, index.py, server.py, wsgi.py ou asgi.py. O projeto
original usa run.py, entao este arquivo apenas exporta a aplicacao.
"""

from run import app
