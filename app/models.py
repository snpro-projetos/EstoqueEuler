from . import db
from datetime import datetime
from decimal import Decimal


class Usuario(db.Model):
    __tablename__ = "usuarios"

    id = db.Column(db.Integer, primary_key=True)
    nome = db.Column(db.String(120), nullable=False)
    email = db.Column(db.String(150), unique=True, nullable=False)
    senha_hash = db.Column(db.String(255), nullable=False)
    perfil = db.Column(db.String(30), nullable=False, default="Operador")
    status = db.Column(db.String(30), nullable=False, default="Ativo")
    criado_em = db.Column(db.DateTime, nullable=False, default=datetime.now)


class Equipamento(db.Model):
    __tablename__ = "equipamentos"

    id = db.Column(db.Integer, primary_key=True)
    nome = db.Column(db.String(80), unique=True, nullable=False)
    descricao = db.Column(db.Text, nullable=True)
    status = db.Column(db.String(30), nullable=False, default="Ativo")


class TipoProduto(db.Model):
    __tablename__ = "tipos_produto"

    id = db.Column(db.Integer, primary_key=True)
    nome = db.Column(db.String(80), unique=True, nullable=False)
    descricao = db.Column(db.Text, nullable=True)
    status = db.Column(db.String(30), nullable=False, default="Ativo")


class Local(db.Model):
    __tablename__ = "locais"

    id = db.Column(db.Integer, primary_key=True)
    nome = db.Column(db.String(100), unique=True, nullable=False)
    endereco = db.Column(db.String(150), nullable=True)
    descricao = db.Column(db.Text, nullable=True)
    status = db.Column(db.String(30), nullable=False, default="Ativo")


class Produto(db.Model):
    __tablename__ = "produtos"

    id = db.Column(db.Integer, primary_key=True)
    sku = db.Column(db.String(50), unique=True, nullable=False)
    nome = db.Column(db.String(150), nullable=False)
    equipamento = db.Column(db.String(80), nullable=False)
    tipo_produto = db.Column(db.String(80), nullable=True)
    local = db.Column(db.String(100), nullable=False)
    quantidade = db.Column(db.Integer, nullable=False, default=1)
    estoque_minimo = db.Column(db.Integer, nullable=False, default=1)
    ticket_medio = db.Column(db.Numeric(10, 2), nullable=False, default=Decimal("0.01"))
    status = db.Column(db.String(30), nullable=False, default="Ativo")
    descricao = db.Column(db.Text, nullable=True)

    @property
    def valor_estoque(self):
        return float((self.quantidade or 0) * (self.ticket_medio or 0))

    @property
    def status_estoque(self):
        if self.quantidade <= self.estoque_minimo:
            return "Estoque Baixo"
        return "Normal"


class Movimentacao(db.Model):
    __tablename__ = "movimentacoes"

    id = db.Column(db.Integer, primary_key=True)
    tipo = db.Column(db.String(40), nullable=False)
    produto_id = db.Column(db.Integer, db.ForeignKey("produtos.id"), nullable=False)
    produto_nome = db.Column(db.String(150), nullable=False)
    quantidade = db.Column(db.Integer, nullable=False, default=1)
    valor_unitario = db.Column(db.Numeric(10, 2), nullable=False, default=Decimal("0.00"))
    total = db.Column(db.Numeric(10, 2), nullable=False, default=Decimal("0.00"))
    local = db.Column(db.String(100), nullable=False)
    local_origem = db.Column(db.String(100), nullable=False)
    local_destino = db.Column(db.String(100), nullable=True)
    observacao = db.Column(db.Text, nullable=True)
    criado_em = db.Column(db.DateTime, nullable=False)

    produto = db.relationship("Produto", backref="movimentacoes")

    @property
    def local_resumo(self):
        origem = self.local_origem or self.local
        if self.tipo == "Transferência" and self.local_destino:
            return f"{origem} -> {self.local_destino}"
        return origem


class ImportacaoPlanilha(db.Model):
    __tablename__ = "importacoes_planilha"

    id = db.Column(db.Integer, primary_key=True)
    nome_arquivo = db.Column(db.String(200), nullable=True)
    produtos_skus = db.Column(db.Text, nullable=False, default="")
    total_novos = db.Column(db.Integer, nullable=False, default=0)
    total_atualizados = db.Column(db.Integer, nullable=False, default=0)
    criado_em = db.Column(db.DateTime, nullable=False, default=datetime.now)


class DashboardGrafico(db.Model):
    __tablename__ = "dashboard_graficos"

    id = db.Column(db.Integer, primary_key=True)
    titulo = db.Column(db.String(120), nullable=False)
    fonte = db.Column(db.String(40), nullable=False, default="produtos")
    tipo_grafico = db.Column(db.String(20), nullable=False, default="barra")
    coluna_grupo = db.Column(db.String(60), nullable=False, default="equipamento")
    metrica = db.Column(db.String(60), nullable=False, default="contagem")
    filtro_coluna = db.Column(db.String(60), nullable=True)
    filtro_operador = db.Column(db.String(20), nullable=True)
    filtro_valor = db.Column(db.String(120), nullable=True)
    criado_em = db.Column(db.DateTime, nullable=False)
