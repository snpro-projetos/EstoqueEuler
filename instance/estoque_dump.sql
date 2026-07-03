BEGIN TRANSACTION;
CREATE TABLE categorias (
	id INTEGER NOT NULL, 
	nome VARCHAR(80) NOT NULL, 
	descricao TEXT, 
	status VARCHAR(30) NOT NULL, 
	PRIMARY KEY (id), 
	UNIQUE (nome)
);
INSERT INTO "categorias" VALUES(1,'Periferico','Itens como mouse, teclado, monitor, webcam e headset','Ativo');
INSERT INTO "categorias" VALUES(2,'Desktop','Computadores, gabinetes e equipamentos de mesa','Ativo');
INSERT INTO "categorias" VALUES(3,'Notebook','Notebooks, carregadores e componentes relacionados','Ativo');
INSERT INTO "categorias" VALUES(4,'Servidor','Servidores, pecas e componentes de infraestrutura','Ativo');
INSERT INTO "categorias" VALUES(5,'Periférico','Importado da planilha','Ativo');
INSERT INTO "categorias" VALUES(6,'Componente','Importado da planilha','Ativo');
INSERT INTO "categorias" VALUES(7,'Energia','Importado da planilha','Ativo');
INSERT INTO "categorias" VALUES(8,'Rede','Importado da planilha','Ativo');
INSERT INTO "categorias" VALUES(9,'Cabo','Importado da planilha','Ativo');
INSERT INTO "categorias" VALUES(10,'Acessório','Importado da planilha','Ativo');
CREATE TABLE dashboard_graficos (
	id INTEGER NOT NULL, 
	titulo VARCHAR(120) NOT NULL, 
	fonte VARCHAR(40) NOT NULL, 
	tipo_grafico VARCHAR(20) NOT NULL, 
	coluna_grupo VARCHAR(60) NOT NULL, 
	metrica VARCHAR(60) NOT NULL, 
	filtro_coluna VARCHAR(60), 
	filtro_operador VARCHAR(20), 
	filtro_valor VARCHAR(120), 
	criado_em DATETIME NOT NULL, 
	PRIMARY KEY (id)
);
INSERT INTO "dashboard_graficos" VALUES(1,'Produtos por categoria','produtos','barra','categoria','contagem',NULL,NULL,NULL,'2026-06-25 14:33:35.914137');
INSERT INTO "dashboard_graficos" VALUES(2,'Produtos por local','produtos','barra','local','soma_quantidade',NULL,NULL,NULL,'2026-06-25 14:33:35.914137');
INSERT INTO "dashboard_graficos" VALUES(3,'Movimentacoes por tipo','movimentacoes','pizza','tipo','contagem',NULL,NULL,NULL,'2026-06-25 14:33:35.914137');
CREATE TABLE locais (
	id INTEGER NOT NULL, 
	nome VARCHAR(100) NOT NULL, 
	endereco VARCHAR(150), 
	descricao TEXT, 
	status VARCHAR(30) NOT NULL, 
	PRIMARY KEY (id), 
	UNIQUE (nome)
);
INSERT INTO "locais" VALUES(1,'EP-Prateleira 3A','Estoque Principal','Prateleira principal para itens menores','Ativo');
INSERT INTO "locais" VALUES(2,'EP-Prateleira 3B','Estoque Principal','Prateleira intermediaria do estoque','Ativo');
INSERT INTO "locais" VALUES(3,'EP-Prateleira 3C','Estoque Principal','Prateleira superior do estoque','Ativo');
INSERT INTO "locais" VALUES(4,'Estoque Principal','Importado da planilha','Importado da planilha','Ativo');
INSERT INTO "locais" VALUES(5,'Área de Testes','Importado da planilha','Importado da planilha','Ativo');
INSERT INTO "locais" VALUES(6,'Bancada Técnica','Importado da planilha','Importado da planilha','Ativo');
INSERT INTO "locais" VALUES(7,'Armário de Cabos','Importado da planilha','Importado da planilha','Ativo');
CREATE TABLE movimentacoes (
	id INTEGER NOT NULL, 
	tipo VARCHAR(40) NOT NULL, 
	produto_id INTEGER NOT NULL, 
	produto_nome VARCHAR(150) NOT NULL, 
	quantidade INTEGER NOT NULL, 
	valor_unitario FLOAT NOT NULL, 
	total FLOAT NOT NULL, 
	local VARCHAR(100) NOT NULL, 
	observacao TEXT, 
	criado_em DATETIME NOT NULL, 
	PRIMARY KEY (id), 
	FOREIGN KEY(produto_id) REFERENCES produtos (id)
);
INSERT INTO "movimentacoes" VALUES(1,'Entrada',70,'HD Dell Constellation 7.2K Sas 1TB',3,0.0,0.0,'EP-Prateleira 3C',NULL,'2026-07-03 13:05:36.367372');
INSERT INTO "movimentacoes" VALUES(2,'Saida',77,'HD Dell Constellation 7.2K Sas 1TB',1,0.0,0.0,'EP-Prateleira 3C',NULL,'2026-07-03 13:06:10.337428');
CREATE TABLE produtos (
	id INTEGER NOT NULL, 
	sku VARCHAR(50) NOT NULL, 
	nome VARCHAR(150) NOT NULL, 
	categoria VARCHAR(80) NOT NULL, 
	tipo_produto VARCHAR(80), 
	local VARCHAR(100) NOT NULL, 
	quantidade INTEGER NOT NULL, 
	estoque_minimo INTEGER NOT NULL, 
	ticket_medio FLOAT NOT NULL, 
	status VARCHAR(30) NOT NULL, 
	descricao TEXT, 
	PRIMARY KEY (id), 
	UNIQUE (sku)
);
INSERT INTO "produtos" VALUES(1,'MPC20152','Memória Smart PC2 1RX8 1GB','Periférico','Memória','EP-Prateleira 3C',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(2,'MPC20151','Memória Smart PC2 1RX8 1GB','Periférico','Memória','EP-Prateleira 3C',2,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(3,'MPC22433','Memória Smart PC2 1RX4 1GB','Periférico','Memória','EP-Prateleira 3C',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(4,'MPC22432','Memória Smart PC2 1RX4 1GB','Periférico','Memória','EP-Prateleira 3B',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(5,'MPC22431','Memória Smart PC2 1RX4 1GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(6,'MPC22430','Memória Smart PC2 1RX4 1GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(7,'MPC20142','Memória Markvision PC2 1GB','Periférico','Memória','EP-Prateleira 3A',3,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(8,'MPC20141','Memória Markvision PC2 1GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(9,'MPC20140','Memória Markvision PC2 1GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(10,'MPC20150','Memória Kingston PC2 1GB','Periférico','Memória','EP-Prateleira 3C',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(11,'MPC20139','Memória Kingston PC2 1GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(12,'MPC22429','Memória Markvision PC2 2GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(13,'MPC20143','Memória Markvision PC2 2GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(14,'MPC20144','Memória Markvision PC2 2GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(15,'MPC21107','Memória Smart PC2 2RX4 2GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(16,'MPC21106','Memória Smart PC2 2RX4 2GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(17,'MPC20153','Memória Nanya PC2 2RX8 2GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(18,'MPC20665','Memória Smart PC2 2RX4 2GB','Servidor','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(19,'MPC20667','Memória Smart PC2 2RX4 2GB','Servidor','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(20,'MPC20145','Memória Kingston PC2 2GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(21,'MPC20149','Memória Kingston PC2 2GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(22,'MPC20148','Memória Kingston PC2 2GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(23,'MPC20146','Memória Kingston PC2 4GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(24,'MPC20147','Memória Kingston PC2 4GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(25,'MPC21077','Memória Hynix PC2 2RX4 4GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(26,'MPC21078','Memória Hynix PC2 2RX4 4GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(27,'MPC21080','Memória Dell PC2 2RX4 4GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(28,'MPC21079','Memória Dell PC2 2RX4 4GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(29,'MPC22428','Memória Smart PC2 2RX4 4GB','Servidor','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(30,'MPC22427','Memória Smart PC2 2RX4 4GB','Servidor','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(31,'MPC22426','Memória Smart PC2 2RX4 4GB','Servidor','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(32,'MPC22425','Memória Smart PC2 2RX4 4GB','Servidor','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(33,'MPC22424','Memória Smart PC2 2RX4 4GB','Servidor','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(34,'MPC22423','Memória Smart PC2 2RX4 4GB','Servidor','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(35,'MPC30080','Memória Hinix PC3 2RX4 8GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(36,'MPC31759','Memória Hinix PC3 2RX4 8GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(37,'MPC31331','Memória Hinix PC3 2RX4 8GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(38,'MPC31758','Memória Hinix PC3 2RX4 8GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(39,'MPC31330','Memória Hinix PC3 2RX4 8GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(40,'MPC30567','Memória Smart PC3 2RX4 8GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(41,'MPC30079','Memória Smart PC3 2RX4 8GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(42,'MPC30566','Memória Smart PC3 2RX4 8GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(43,'MPC32100','Memória Markvision PC3 4GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(44,'MPC32221','Memória Markvision PC3 4GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(45,'MPC32220','Memória Markvision PC3 4GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(46,'MPC32099','Memória Markvision PC3 4GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(47,'MPC30231','Memória Kingston PC3 4GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(48,'MPC30622','Memória Brazil PC PC3 4GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(49,'MPC31195','Memória Brazil PC PC3 4GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(50,'MPC30548','Memória Samsung PC3L 2RX8 4GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(51,'MPC30553','Memória Samsung PC3L 2RX8 4GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(52,'MPC30558','Memória Samsung PC3L 2RX8 4GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(53,'MPC30551','Memória Samsung PC3L 2RX8 4GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(54,'MPC32231','Memória Smart PC3 2RX8 4GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(55,'MPC30229','Memória Smart PC3 2RX8 4GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(56,'MPC32228','Memória Smart PC3 2RX8 4GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(57,'MPC30619','Memória Megaware PC3 4GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(58,'MPC31792','Memória Kingston PC3 8GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(59,'MPC32422','Memória Corsair PC3 8GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(60,'MPC30509','Memória Kingston PC3 2RX8 8GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(61,'MPC31033','Memória MT PC3 2RX4 4GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(62,'MPC31034','Memória MT PC3 2RX4 4GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(63,'MPC31268','Memória MT PC3 2RX4 4GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(64,'MPC31267','Memória MT PC3 2RX4 4GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(65,'MPC30629','Memória Elixir PC3 1RX8 2GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(66,'MPC30857','Memória EVM PC3 2GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(67,'HDSA2262','HD Seagate ST1000DM010 Sata 1TB','Desktop','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(68,'HDSD1553','SSD UP500 Sata 2TB','Desktop','SSD','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(69,'HDSD0217','SSD Micron P300 Sata 50GB','Desktop','SSD','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(70,'HDSS2421','HD Dell Constellation 7.2K Sas 1TB','Servidor','Hard Disk','EP-Prateleira 3C',4,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(71,'HDSS2302','HD Dell Constellation 7.2K Sas 1TB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(72,'HDSS2301','HD Dell Constellation 7.2K Sas 1TB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(73,'HDSS2300','HD Dell Constellation 7.2K Sas 1TB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(74,'HDSA2420','HD Seagate ST3500413AS Sata 500GB','Desktop','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(75,'HDSS1749','HD Dell ST3300657SS 15K Sas 300GB','Desktop','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(76,'HDSS2304','HD Dell Constellation 7.2K Sas 1TB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(77,'HDSS2303','HD Dell Constellation 7.2K Sas 1TB','Servidor','Hard Disk','EP-Prateleira 3C',0,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(78,'HDSS2419','HD Dell MG03SCA100 7.2K Sas 1TB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(79,'HDSS2418','HD Dell Constellation 7.2K Sas 1TB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(80,'HDSS2417','HD Dell Constellation 7.2K Sas 1TB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(81,'HDSS2305','HD Dell Constellation 7.2K Sas 1TB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(82,'HDSA1770','HD Seagate ST2000DM001 Sata 2TB','Desktop','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(83,'HDSA0847','HD Seagate Constellation Sata 2TB','Desktop','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(84,'HDSA1511','HD DELL MG03ACA200 Sata 2TB','Desktop','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(85,'HDSA0984','HD Seagate ST500DM002 Sata 500GB','Desktop','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(86,'HDSA0191','HD WD Blue WD5000AAKX 500GB','Desktop','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(87,'HDSA0591','HD HP MB 0500GCEHE Sata 500GB','Desktop','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(88,'HDSA0195','HD Samsung HD161HJ Sata 160GB','Desktop','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(89,'HDSA0304','HD Samsung HD161HJ Sata 160GB','Desktop','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(90,'HDSA0212','HD Hitachi HDT721032SLA360 Sata 320GB','Desktop','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(91,'HDSA2416','HD Toshiba MQ01ABF050 Sata 500GB','Notebook','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(92,'HDSA1296','HD WB Blue WD5000LPVX Sata 500GB','Notebook','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(93,'HDSA0908','HD WD Blue WD10SPZX Sata 1TB','Notebook','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(94,'SDSA2415','SSD TXRUI X600 Sata 256GB','Periferico','SSD','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(95,'MPC30624','Memória Excellence PC3 1Rx8 4GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(96,'MPC30623','Memória Excellence PC3 1Rx8 4GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(97,'MPC32410','Memória Casper PC3 1Rx8 4GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(98,'MPC32409','Memória Casper PC3 1Rx8 4GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(99,'MPC31448','Memória Smart PC3 1Rx8 1GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(100,'MPC31451','Memória Smart PC3 1Rx8 1GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(101,'MPC31450','Memória Smart PC3 1Rx8 1GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(102,'MPC31449','Memória Smart PC3 1Rx8 1GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(103,'MPC30612','Memória Smart PC3 1Rx8 1GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(104,'MPC30618','Memória Smart PC3 1Rx8 1GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(105,'MPC30614','Memória Smart PC3 1Rx8 1GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(106,'MPC30613','Memória Smart PC3 1Rx8 1GB','Periferico','Memória','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(107,'M2NV2314','NVMe PCIe 4.0 NV2 1TB','Periferico','SSD','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(108,'M2SA2408','SSD SK Hynix SC300 SATA M.2 256GB','Periferico','SSD','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(109,'HDSS2407','HD DELL Savvio 10k SAS 300GB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(110,'HDSS2406','HD DELL Savvio 10k SAS 300GB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(111,'HDSS2405','HD IBM HUSML4040ASS600 SAS 300GB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(112,'HDSS1613','HD HGST SLR5B-S20SS SAS 200GB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(113,'HDSS2404','HD HGST SLR5B-S20SS SAS 200GB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(114,'HDSS1523','HD HGST SLR5B-S20SS SAS 200GB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(115,'HDSS2403','HD IBM 10K SAS 900GB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(116,'HDSS2402','HD IBM 10K SAS 900GB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(117,'HDSS2401','HD IBM 10K SAS 900GB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(118,'HDSS2334','HD IBM 15K SAS 600GB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(119,'HDSS2335','HD IBM 15K SAS 600GB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(120,'HDSS2336','HD IBM 15K SAS 600GB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(121,'HDSS2400','HD IBM 15K SAS 600GB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(122,'HDSS2399','HD IBM 15K SAS 600GB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(123,'HDSS2398','HD IBM 15K SAS 600GB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(124,'HDSS2397','HD IBM 15K SAS 600GB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(125,'HDSS2396','HD IBM 15K SAS 600GB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(126,'HDSS2395','HD IBM 15K SAS 600GB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(127,'HDSS2394','HD IBM 15K SAS 600GB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(128,'HDSS2393','HD IBM 15K SAS 600GB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(129,'HDSS2392','HD IBM 15K SAS 600GB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(130,'HDSS0867','HD DELL 10K SAS 600GB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(131,'HDSS0868','HD DELL 10K SAS 600GB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(132,'HDSS0869','HD DELL 10K SAS 600GB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(133,'HDSS0917','HD HP 10K SAS 72GB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(134,'HDSS0919','HD HP 10K SAS 72GB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(135,'HDSS0921','HD HP 10K SAS 72GB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(136,'HDSS0922','HD HP 10K SAS 72GB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(137,'HDSS0915','HD HP 10K SAS 72GB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(138,'HDSS0914','HD HP 10K SAS 72GB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(139,'HDSS0916','HD HP 10K SAS 72GB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(140,'HDSS0918','HD HP 10K SAS 72GB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(141,'HDSS0920','HD HP 10K SAS 72GB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(142,'HDSS0913','HD HP 10K SAS 72GB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(143,'SDSS2390','SSD Sun Zeus IOPS SAS 200GB','Servidor','SSD','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(144,'SDSS2389','SSD SUN Zeus IOPS SAS 200GB','Servidor','SSD','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(145,'SDSS1272','SSD Toshiba PX02SSF020 SAS 200GB','Servidor','SSD','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(146,'SDSS1271','SSD Toshiba PX02SSF020 SAS 200GB','Servidor','SSD','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(147,'HDSA0909n','HD WD  Blue WD10SPZX 1TB','Periferico','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(148,'HDSA0911n','HD WD  Blue WD10SPZX 1TB','Periferico','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(149,'HDSA0937n','HD WD  Blue WD10SPZX 1TB','Periferico','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(150,'HDSA0936n','HD WD  Blue WD10SPZX 1TB','Periferico','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(151,'HDSA0137n','HD Seagate ST1000LM024 1TB','Periferico','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(152,'HDSA2388n','HD Toshiba MQ04ABF100 1TB','Periferico','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(153,'HDSA0718n','HD Samsung ST1000LM024 1TB','Periferico','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(154,'HDSA0250n','HD Seagate ST500LT012 500GB','Periferico','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(155,'HDSA0912n','HD Toshiba MQ01ABD075 750GB','Periferico','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(156,'SDSA1135','SSD Kingston 120GB','Periferico','SSD','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(157,'SDSA2209','SSD Kingston 120GB','Periferico','SSD','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(158,'SDSA1125','SSD ADATA SU650 120GB','Periferico','SSD','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(159,'SDSA2387','SSD Exbom PLUS 120GB','Periferico','SSD','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(160,'SDSA1567','SSD UP500 2TB','Periferico','SSD','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(161,'SDSA2386','SSD Patriot Burst Elite 2TB','Periferico','SSD','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(162,'SDSA2384','SSD Sem Marca 240GB','Periferico','SSD','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(163,'SDSA2383','SSD Sem Marca 240GB','Periferico','SSD','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(164,'SDSA2382','SSD Sem Marca 240GB','Periferico','SSD','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(165,'SDSA2385','SSD Sata Micron 1100 256GB','Periferico','SSD','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(166,'SDSA0716','SSD Sata Micron P300 50GB','Periferico','SSD','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(167,'SDSA2381','SSD Sata Micron P300 50GB','Periferico','SSD','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(168,'SDSA0713','SSD Sata Micron P300 50GB','Periferico','SSD','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(169,'HDSS0736','HD DELL Constallation SAS 500GB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(170,'HDSS0826','HD HGST HUS156060VLS600 SAS 600GB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(171,'HDSS0737','HD DELL Constallation SAS 500GB','Servidor','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(172,'HDSA1096','HD DELL Constellation SATA 500GB','Periferico','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(173,'HDSA1593','HD WD Green WD30EZRX SATA 3TB','Periferico','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(174,'HDSA1447','HD WD Blue WD10EZEX SATA 1TB','Periferico','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(175,'HDSA1425','HD Samsung HD161GJ  SATA 160GB','Periferico','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(176,'HDSA0205','HD Samsung HD502HJ SATA 500GB','Periferico','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(177,'HDSA1151','HD Samsung HD161HJ SATA 160GB','Periferico','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(178,'HDSA0477','HD Samsung HD502HJ SATA 500GB','Periferico','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(179,'HDSA1569','HD Samsung HD161HJ SATA 160GB','Periferico','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(180,'HDSA0926','HD Seagate Barracuda SATA 500GB','Periferico','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(181,'HDSA2380','HD Seagate Barracuda SATA 1TB','Periferico','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(182,'HDSA0182','HD Seagate Barracuda SATA 80GB','Periferico','Hard Disk','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(183,'PD2120','Intel Core I3 2120 3.30Ghz','Desktop','Processador','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(184,'PD620','Intel Pentium G620 2.60Ghz','Desktop','Processador','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(185,'PD430','Intel Celeron 430 1.80Ghz','Desktop','Processador','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(186,'PD631','Intel Pentium 4 631 3.0Ghz','Desktop','Processador','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(187,'PD5400','Intel Pentium Dual Core 2.7Ghz','Desktop','Processador','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(188,'PD2148','Intel Pentium Dual Core E2148 1.60Ghz','Desktop','Processador','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(189,'PD7500','Intel Core 2 Duo E7500 2.93Ghz','Desktop','Processador','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(190,'PD541','Intel Pentium 4 541 3.2Ghz','Desktop','Processador','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(191,'PD2188','Intel Pentium Dual Core 2188 2.0Ghz','Desktop','Processador','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(192,'PDE6550','Intel Core 2 Duo E6550 2.33Ghz','Desktop','Processador','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(193,'PS2630L','Intel Xeon E5-2630L 2.0Ghz','Servidor','Processador','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(194,'PS2690','Intel Xeon E5-2690 V2 3.0Ghz','Servidor','Processador','Estoque Principal',2,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(195,'PS2409','Intel Xeon E5-2409 2.20Ghz','Servidor','Processador','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(196,'PS2403','Intel Xeon E5-2403 1.80Ghz','Servidor','Processador','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(197,'PS2470','Intel Xeon E5-2470 V2','Servidor','Processador','Estoque Principal',2,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(198,'PS2630','Intel Xeon E5-2630 2.30Ghz','Servidor','Processador','Estoque Principal',4,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(199,'PS2603','Intel Xeon  E5-2603 1.80Ghz','Servidor','Processador','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(200,'PS2670','Intel Xeon E5-2670 2.60 Ghz','Servidor','Processador','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(201,'PS2620','Intel Xeon E5-2620 V2 2.10Ghz','Servidor','Processador','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(202,'PS3503','Intel Xeon W3503 2.40Ghz','Servidor','Processador','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(203,'PS3470','Intel Xeon 3470 2.93Ghz','Servidor','Processador','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(204,'PS2650','Intel Xeon E5-2650L V2 1.70Ghz','Servidor','Processador','Estoque Principal',13,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(205,'PS5645','Intel Xeon E5645 2.40','Servidor','Processador','Estoque Principal',6,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(206,'PS2609','Intel Xeon E5-2609 2.40Ghz','Servidor','Processador','Estoque Principal',2,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(207,'PS5550','Intel Xeon X5550 2.66Ghz','Servidor','Processador','Estoque Principal',10,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(208,'PS5620','Intel Xeon 5620 2.40Ghz','Servidor','Processador','Estoque Principal',2,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(209,'SSD24001','SSD Kingston A400 240GB','Componente','SSD','Estoque Principal',4,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(210,'SSD48001','SSD Crucial BX500 480GB','Componente','SSD','Estoque Principal',2,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(211,'HD50001','HD Seagate 500GB SATA','Componente','Hard Disk','Área de Testes',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(212,'HD1TB001','HD WD Blue 1TB SATA','Componente','Hard Disk','Estoque Principal',3,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(213,'PROC001','Processador Intel Core i3 6100','Componente','Processador','Bancada Técnica',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(214,'PROC002','Processador Intel Core i5 7400','Componente','Processador','Bancada Técnica',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(215,'MON001','Monitor AOC 19 Polegadas','Periférico','Monitor','Estoque Principal',2,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(216,'MON002','Monitor LG 22 Polegadas','Periférico','Monitor','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(217,'MOU001','Mouse USB Dell Preto','Periférico','Mouse','Armário de Cabos',8,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(218,'TEC001','Teclado USB Logitech K120','Periférico','Teclado','Armário de Cabos',6,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(219,'FON001','Fonte ATX 500W Real','Energia','Fonte','Área de Testes',2,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(220,'SWI001','Switch TP-Link 8 Portas','Rede','Switch','Estoque Principal',2,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(221,'SWI002','Switch Intelbras 16 Portas','Rede','Switch','Estoque Principal',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(222,'NOB001','Nobreak SMS 600VA','Energia','Nobreak','Área de Testes',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(223,'CAB001','Cabo de Rede Cat5e 1 Metro','Cabo','Cabo de Rede','Armário de Cabos',25,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(224,'CAB002','Cabo de Rede Cat6 3 Metros','Cabo','Cabo de Rede','Armário de Cabos',18,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(225,'WEB001','Webcam Logitech C270','Periférico','Webcam','Estoque Principal',2,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(226,'HED001','Headset USB Intelbras','Periférico','Headset','Estoque Principal',3,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(227,'RAMDDR3','Memória DDR3 4GB Kingston','Componente','Memória','EP-Prateleira 3B',5,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(228,'RAMDDR4','Memória DDR4 8GB Crucial','Componente','Memória','EP-Prateleira 3B',4,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(229,'NOTE001','Notebook Dell Latitude Usado','Notebook','Notebook','Área de Testes',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(230,'DESK001','Desktop Dell Optiplex Usado','Desktop','Desktop','Área de Testes',1,0,0.0,'Ativo',NULL);
INSERT INTO "produtos" VALUES(231,'SRV001','Servidor Dell PowerEdge T310','Servidor','Servidor','Estoque Principal',1,0,0.0,'Inativo',NULL);
INSERT INTO "produtos" VALUES(232,'ADP001','Adaptador HDMI para VGA','Acessório','Adaptador','Armário de Cabos',10,0,0.0,'Ativo',NULL);
CREATE TABLE tipos_produto (
	id INTEGER NOT NULL, 
	nome VARCHAR(80) NOT NULL, 
	descricao TEXT, 
	status VARCHAR(30) NOT NULL, 
	PRIMARY KEY (id), 
	UNIQUE (nome)
);
INSERT INTO "tipos_produto" VALUES(1,'SSD','Unidades de estado solido','Ativo');
INSERT INTO "tipos_produto" VALUES(2,'Processador','CPUs e componentes de processamento','Ativo');
INSERT INTO "tipos_produto" VALUES(3,'Memoria','Memorias RAM e modulos relacionados','Ativo');
INSERT INTO "tipos_produto" VALUES(4,'Hard Disk','Discos rigidos e armazenamentos magneticos','Ativo');
INSERT INTO "tipos_produto" VALUES(5,'Memória','Importado da planilha','Ativo');
INSERT INTO "tipos_produto" VALUES(6,'Monitor','Importado da planilha','Ativo');
INSERT INTO "tipos_produto" VALUES(7,'Mouse','Importado da planilha','Ativo');
INSERT INTO "tipos_produto" VALUES(8,'Teclado','Importado da planilha','Ativo');
INSERT INTO "tipos_produto" VALUES(9,'Fonte','Importado da planilha','Ativo');
INSERT INTO "tipos_produto" VALUES(10,'Switch','Importado da planilha','Ativo');
INSERT INTO "tipos_produto" VALUES(11,'Nobreak','Importado da planilha','Ativo');
INSERT INTO "tipos_produto" VALUES(12,'Cabo de Rede','Importado da planilha','Ativo');
INSERT INTO "tipos_produto" VALUES(13,'Webcam','Importado da planilha','Ativo');
INSERT INTO "tipos_produto" VALUES(14,'Headset','Importado da planilha','Ativo');
INSERT INTO "tipos_produto" VALUES(15,'Notebook','Importado da planilha','Ativo');
INSERT INTO "tipos_produto" VALUES(16,'Desktop','Importado da planilha','Ativo');
INSERT INTO "tipos_produto" VALUES(17,'Servidor','Importado da planilha','Ativo');
INSERT INTO "tipos_produto" VALUES(18,'Adaptador','Importado da planilha','Ativo');
COMMIT;
