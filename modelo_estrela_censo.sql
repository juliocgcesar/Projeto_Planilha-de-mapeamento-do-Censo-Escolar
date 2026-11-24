-- MODELO ESTRELA - CENSO ESCOLAR 2020 (INEP)
CREATE TABLE Dim_Escola (
    sk_escola INTEGER PRIMARY KEY,
    co_entidade INTEGER NOT NULL,
    no_entidade VARCHAR(150) NOT NULL,
    ds_dependencia_adm VARCHAR(20),
    ds_situacao_funcionamento VARCHAR(25),
    ds_categoria_privada VARCHAR(30)
);

CREATE TABLE Dim_Localizacao (
    sk_localizacao INTEGER PRIMARY KEY,
    co_municipio INTEGER NOT NULL,
    no_municipio VARCHAR(100) NOT NULL,
    sg_uf CHAR(2),
    no_regiao_geografica VARCHAR(20),
    ds_zona_localizacao VARCHAR(15)
);

CREATE TABLE Dim_Infraestrutura (
    sk_infraestrutura INTEGER PRIMARY KEY,
    ds_agua_potavel VARCHAR(15),
    ds_energia_rede_publica VARCHAR(15),
    ds_esgoto_rede_publica VARCHAR(15),
    ds_biblioteca VARCHAR(15),
    ds_lab_informatica VARCHAR(15),
    ds_acesso_internet VARCHAR(15)
);

CREATE TABLE Fato_Censo_Escolar (
    sk_fato INTEGER PRIMARY KEY,
    sk_escola INTEGER NOT NULL REFERENCES Dim_Escola(sk_escola),
    sk_localizacao INTEGER NOT NULL REFERENCES Dim_Localizacao(sk_localizacao),
    sk_infraestrutura INTEGER NOT NULL REFERENCES Dim_Infraestrutura(sk_infraestrutura),
    nu_ano_censo SMALLINT NOT NULL,
    qt_matriculas_bas INTEGER,
    qt_matriculas_prof INTEGER,
    qt_docentes_bas INTEGER,
    qt_turmas_bas INTEGER
);

INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (1, 28012623, 'CRECHE MAE EMILIA', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (2, 28012631, 'COLEGIO ESTADUAL MANOEL JOAQUIM DE OLIVEIRA CAMPOS', 'Estadual', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (3, 28012658, 'ESCOLA MUNICIPAL RAIMUNDO MARTINS', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (4, 28012666, 'ESC MUL ISABEL FREIRE', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (5, 28012674, 'ESC MUL IVANY DA GLORIA FREIRE', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (6, 28012682, 'ESC MUL JOSIAS JOSE DOS SANTOS', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (7, 28012712, 'ESCOLA MUNICIPAL ANTONIO DA SILVA CARVALHO', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (8, 28005163, 'COLEGIO ESTADUAL FRANCISCO FIGUEIREDO', 'Estadual', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (9, 28005180, 'ESCOLA MUNICIPAL MARLUVIA ARAGAO OLIVEIRA', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (10, 28005198, 'ESC ESTADUAL MILTON AZEVEDO', 'Estadual', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (11, 28005201, 'COLEGIO ESTADUAL NACOES UNIDAS', 'Estadual', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (12, 28005210, 'ESCOLA MUNICIPAL ALDON FIGUEIREDO', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (13, 28005228, 'ESCOLA MUNICIPAL AMERINA ESTEVAO OLIVEIRA', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (14, 28005244, 'ESCOLA MUNICIPAL MANOEL BISPO DOS SANTOS', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (15, 28005260, 'ESCOLA MUNICIPAL OVIDIO OLIVEIRA', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (16, 28005279, 'ESCOLA MUNICIPAL DR LEANDRO MACIEL', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (17, 28005287, 'ESCOLA MUNICIPAL DR LOURIVAL BAPTISTA', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (18, 28005309, 'ESCOLA MUNICIPAL HILDETE FALCAO BAPTISTA', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (19, 28005317, 'ESCOLA MUNICIPAL JACKSON DE FIGUEIREDO', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (20, 28005325, 'ESCOLA MUNICIPAL JANUARIO GOMES FEITOSA', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (21, 28005333, 'ESCOLA MUNICIPAL JOAO XXIII', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (22, 28005341, 'ESCOLA MUNICIPAL JOSE ALVES DO CARMO', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (23, 28005350, 'ESCOLA MUNICIPAL DR JOSE COSTA CAVALCANTE', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (24, 28005368, 'ESCOLA MUNICIPAL MANOEL ALCINO XAVIER DA SILVA', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (25, 28005384, 'ESCOLA MUNICIPAL CELUTA MAIA', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (26, 28005414, 'ESCOLA MUNICIPAL STA LUZIA', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (27, 28005449, 'ESCOLA MUNICIPAL NEUZA GOMES DA SILVA SANTOS', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (28, 28005457, 'ESCOLA MUNICIPAL EDITE SILVA DO CARMO', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (29, 28005465, 'ESCOLA MUNICIPAL JOSE FELIX DE SA', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (30, 28005481, 'ESCOLA MUNICIPAL LINDAURA SILVA DA ROCHA', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (31, 28005490, 'ESCOLA MUNICIPAL TEREZINHA DA SILVA ARAUJO', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (32, 28005503, 'ESCOLA RURAL MOCAMBO', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (33, 28005538, 'ESCOLA MUNICIPAL PROFESSORA ANTONIA MARTINS DO ROSARIO', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (34, 28005546, 'ESCOLA MUNICIPAL MANOEL FRANCO FREIRE', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (35, 28028791, 'COLEGIO RENOVADO SAGRADO CORACAO DE JESUS', 'Privada', 'Em atividade', 'Particular');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (36, 28033736, 'CENTRO EDUCACIONAL SAO JOSE', 'Privada', 'Em atividade', 'Particular');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (37, 28034082, 'EDUCANDARIO UM SONHO A MAIS', 'Privada', 'Em atividade', 'Particular');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (38, 28035402, 'ESCOLA NOSSA SENHORA DA CONCEICAO', 'Privada', 'Em atividade', 'Particular');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (39, 28036310, 'UNIVERSO CURSOS E CONSULTORIA - AQUIDABA', 'Privada', 'Em atividade', 'Particular');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (40, 28036379, 'CRECHE MUNICIPAL ACONCHEGO DA MAMAE', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (41, 28086406, 'ESCOLA MUNICIPAL EURICO DE SOUZA', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (42, 28017137, 'EMEI ANTONIO VALENCA ROLLEMBERG', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (43, 28017145, 'EMEI BENJAMIN ALVES DE CARVALHO', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (44, 28017153, 'EMEI MONS JOAO MOREIRA LIMA', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (45, 28017170, 'EMEI DOM HELDER CAMARA', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (46, 28017188, 'EMEI PROFESSORA MARIA GIVALDA DA SILVA SANTOS', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (47, 28017196, 'EMEI DR JOSE AUGUSTO ARANTES SAVAZINE', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (48, 28017234, 'ESCOLA ESPECIAL MANOELITO CARVALHO', 'Privada', 'Em atividade', 'Filantrópica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (49, 28017242, 'COLEGIO PIO DECIMO LTDA - EPP', 'Privada', 'Em atividade', 'Particular');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (50, 28017285, 'CENTRO DE ATENDIMENTO EDUCACIONAL ESPECIALIZADO JOAO CARDOSO NASCIMENTO JUNIOR', 'Estadual', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (51, 28017315, 'CENTRO DE REFERENCIA DE EDUCACAO DE JOVENS E ADULTOS PROFESSOR SEVERINO UCHOA', 'Estadual', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (52, 28017331, 'NUCLEO DE EDUCACAO DA UNIT', 'Privada', 'Em atividade', 'Particular');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (53, 28017366, 'COLEGIO PURIFICACAO LTDA', 'Privada', 'Em atividade', 'Particular');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (54, 28017374, 'CENTRO EDUC CRIARTE', 'Privada', 'Em atividade', 'Particular');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (55, 28017382, 'EMEI DOM AVELAR BRANDAO VILELA', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (56, 28017404, 'EMEF JOSE CONRADO DE ARAUJO', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (57, 28017447, 'EMEF OLGA BENARIO', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (58, 28017463, 'CENTRO EDUC PEQUENO INFANTE LTDA', 'Privada', 'Em atividade', 'Particular');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (59, 28017480, 'CENTRO EDUC PROF JOSE SEBASTIAO DOS SANTOS', 'Privada', 'Em atividade', 'Particular');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (60, 28017501, 'EMEF SABINO RIBEIRO', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (61, 28017579, 'EMEF PRESIDENTE VARGAS', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (62, 28017625, 'EMEI FRANCISCO GUIMARAES ROLLEMBERG', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (63, 28017650, 'EMEF NOSSA SENHORA APARECIDA', 'Municipal', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (64, 28017757, 'COESI COLEGIO DE ORIENTACAO E ESTUDOS INTEGRADOS E ESCOLINHA DO RE MI EIRELI - EPP', 'Privada', 'Em atividade', 'Particular');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (65, 28017773, 'COL AMERICANO BATISTA', 'Privada', 'Em atividade', 'Particular');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (66, 28017781, 'COLEGIO ARQUIDIOCESANO S CORACAO DE JESUS', 'Privada', 'Em atividade', 'Confessional');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (67, 28017803, 'COLEGIO DE CIENCIAS PURA E APLICADA', 'Privada', 'Em atividade', 'Particular');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (68, 28017820, 'COLEGIO DO SALVADOR', 'Privada', 'Em atividade', 'Particular');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (69, 28017838, 'CENTRO DE EXCELENCIA ATHENEU SERGIPENSE', 'Estadual', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (70, 28017846, 'COLEGIO ESTADUAL JACKSON DE FIGUEIREDO', 'Estadual', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (71, 28017854, 'COLEGIO ESTADUAL PROFESSOR PAULO FREIRE', 'Estadual', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (72, 28017862, 'COLEGIO ESTADUAL PROFESSOR JOAO COSTA', 'Estadual', 'Em atividade', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (73, 28017897, 'COL PATROCINIO DE SAO JOSE', 'Privada', 'Em atividade', 'Particular');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (74, 28017919, 'COLEGIO SALESIANO NOSSA SENHORA AUXILIADORA', 'Privada', 'Em atividade', 'Particular');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (75, 28017935, 'COLEGIO UNIFICADO', 'Privada', 'Em atividade', 'Particular');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (76, 28031822, 'ESCOLA ARCO-IRIS', 'Privada', 'Paralisada', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (77, 28017250, 'ASSOC SERGIPANA DE ADM COL TIRADENTES', 'Privada', 'Paralisada', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (78, 28017269, 'ASSOCIACAO DE AMIGOS DO AUTISTA EM SERGIPE', 'Privada', 'Paralisada', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (79, 28017293, 'LAR FABIANO DE CRISTO', 'Privada', 'Paralisada', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (80, 28017412, 'CENTRO EDUC MENINO JESUS', 'Privada', 'Paralisada', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (81, 28017765, 'COL AGUIA LTDA', 'Privada', 'Paralisada', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (82, 28017951, 'COLEGIO APOLO LTDA', 'Privada', 'Paralisada', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (83, 28018087, 'COLEGIO UNIVERSO', 'Privada', 'Paralisada', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (84, 28018192, 'COLEGIO MURILO BRAGA', 'Privada', 'Paralisada', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (85, 28018214, 'EDUCANDARIO NOSSA SRA DA CONCEICAO', 'Privada', 'Paralisada', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (86, 28018249, 'EDUCANDARIO SAO CRISTOVAO', 'Privada', 'Paralisada', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (87, 28018257, 'EDUCANDARIO STO ANTONIO DE PADUA', 'Privada', 'Paralisada', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (88, 28018672, 'ESCOLA ESTADUAL GENERAL VALADAO', 'Estadual', 'Extinta', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (89, 28019580, 'COLEGIO FOLHINHA VERDE', 'Privada', 'Paralisada', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (90, 28019687, 'ASSOCIACAO LIVIO PEREIRA', 'Privada', 'Paralisada', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (91, 28019695, 'ESCOLINHA GOTINHAS DO SABER JARDIM DE INFANCIA', 'Privada', 'Paralisada', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (92, 28019709, 'GREMIO ESCOLAR GRACCHO CARDOSO', 'Privada', 'Paralisada', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (93, 28019954, 'JD DE INFANCIA LEA LEAL', 'Privada', 'Paralisada', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (94, 28019997, 'LAR EVANGELICO DA ASS DE DEUS EST SE', 'Privada', 'Paralisada', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (95, 28020154, 'PRE ESCOLAR CASINHA DA VOVO LTDA', 'Privada', 'Paralisada', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (96, 28020227, 'SOCIEDADE DE ENS E REABILITACAO ROSA AZUL', 'Privada', 'Paralisada', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (97, 28026560, 'CENTRO EDUCACIONAL ORLANDO DANTAS', 'Privada', 'Paralisada', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (98, 28026578, 'CENTRO EDUCACIONAL PROFª MARIA MARQUES', 'Privada', 'Paralisada', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (99, 28026586, 'C EDUCACIONAL PROFª RAQUEL R BERNARDINO', 'Privada', 'Paralisada', 'Não se aplica');
INSERT INTO Dim_Escola (sk_escola, co_entidade, no_entidade, ds_dependencia_adm, ds_situacao_funcionamento, ds_categoria_privada) VALUES (100, 28026594, 'COLEGIO PROFESSOR LARANJEIRAS', 'Privada', 'Paralisada', 'Não se aplica');

INSERT INTO Dim_Localizacao (sk_localizacao, co_municipio, no_municipio, sg_uf, no_regiao_geografica, ds_zona_localizacao) VALUES (1, 2800100, 'Amparo do São Francisco', 'SE', 'Nordeste', 'Urbana');
INSERT INTO Dim_Localizacao (sk_localizacao, co_municipio, no_municipio, sg_uf, no_regiao_geografica, ds_zona_localizacao) VALUES (2, 2800100, 'Amparo do São Francisco', 'SE', 'Nordeste', 'Rural');
INSERT INTO Dim_Localizacao (sk_localizacao, co_municipio, no_municipio, sg_uf, no_regiao_geografica, ds_zona_localizacao) VALUES (3, 2800209, 'Aquidabã', 'SE', 'Nordeste', 'Urbana');
INSERT INTO Dim_Localizacao (sk_localizacao, co_municipio, no_municipio, sg_uf, no_regiao_geografica, ds_zona_localizacao) VALUES (4, 2800209, 'Aquidabã', 'SE', 'Nordeste', 'Rural');
INSERT INTO Dim_Localizacao (sk_localizacao, co_municipio, no_municipio, sg_uf, no_regiao_geografica, ds_zona_localizacao) VALUES (5, 2800308, 'Aracaju', 'SE', 'Nordeste', 'Urbana');

INSERT INTO Dim_Infraestrutura (sk_infraestrutura, ds_agua_potavel, ds_energia_rede_publica, ds_esgoto_rede_publica, ds_biblioteca, ds_lab_informatica, ds_acesso_internet) VALUES (1, 'Sim', 'Sim', 'Sim', 'Não', 'Não', 'Sim');
INSERT INTO Dim_Infraestrutura (sk_infraestrutura, ds_agua_potavel, ds_energia_rede_publica, ds_esgoto_rede_publica, ds_biblioteca, ds_lab_informatica, ds_acesso_internet) VALUES (2, 'Sim', 'Sim', 'Sim', 'Não', 'Sim', 'Sim');
INSERT INTO Dim_Infraestrutura (sk_infraestrutura, ds_agua_potavel, ds_energia_rede_publica, ds_esgoto_rede_publica, ds_biblioteca, ds_lab_informatica, ds_acesso_internet) VALUES (3, 'Sim', 'Sim', 'Não', 'Não', 'Não', 'Sim');
INSERT INTO Dim_Infraestrutura (sk_infraestrutura, ds_agua_potavel, ds_energia_rede_publica, ds_esgoto_rede_publica, ds_biblioteca, ds_lab_informatica, ds_acesso_internet) VALUES (4, 'Sim', 'Sim', 'Não', 'Sim', 'Não', 'Sim');
INSERT INTO Dim_Infraestrutura (sk_infraestrutura, ds_agua_potavel, ds_energia_rede_publica, ds_esgoto_rede_publica, ds_biblioteca, ds_lab_informatica, ds_acesso_internet) VALUES (5, 'Sim', 'Sim', 'Não', 'Não', 'Sim', 'Sim');
INSERT INTO Dim_Infraestrutura (sk_infraestrutura, ds_agua_potavel, ds_energia_rede_publica, ds_esgoto_rede_publica, ds_biblioteca, ds_lab_informatica, ds_acesso_internet) VALUES (6, 'Sim', 'Sim', 'Sim', 'Não', 'Não', 'Não');
INSERT INTO Dim_Infraestrutura (sk_infraestrutura, ds_agua_potavel, ds_energia_rede_publica, ds_esgoto_rede_publica, ds_biblioteca, ds_lab_informatica, ds_acesso_internet) VALUES (7, 'Sim', 'Sim', 'Sim', 'Sim', 'Não', 'Sim');
INSERT INTO Dim_Infraestrutura (sk_infraestrutura, ds_agua_potavel, ds_energia_rede_publica, ds_esgoto_rede_publica, ds_biblioteca, ds_lab_informatica, ds_acesso_internet) VALUES (8, 'Sim', 'Sim', 'Não', 'Não', 'Não', 'Não');
INSERT INTO Dim_Infraestrutura (sk_infraestrutura, ds_agua_potavel, ds_energia_rede_publica, ds_esgoto_rede_publica, ds_biblioteca, ds_lab_informatica, ds_acesso_internet) VALUES (9, 'Sim', 'Sim', 'Sim', 'Sim', 'Sim', 'Sim');
INSERT INTO Dim_Infraestrutura (sk_infraestrutura, ds_agua_potavel, ds_energia_rede_publica, ds_esgoto_rede_publica, ds_biblioteca, ds_lab_informatica, ds_acesso_internet) VALUES (10, 'Não', 'Não', 'Não', 'Não', 'Não', 'Não');

INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (1, 1, 1, 1, 2020, 99, 0, 5, 5);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (2, 2, 1, 2, 2020, 90, 0, 8, 4);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (3, 3, 2, 3, 2020, 29, 0, 3, 3);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (4, 4, 2, 1, 2020, 29, 0, 2, 2);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (5, 5, 1, 4, 2020, 318, 0, 14, 14);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (6, 6, 2, 3, 2020, 15, 0, 2, 2);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (7, 7, 2, 3, 2020, 48, 0, 3, 3);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (8, 8, 3, 5, 2020, 809, 0, 29, 26);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (9, 9, 4, 6, 2020, 154, 0, 12, 7);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (10, 10, 3, 7, 2020, 374, 0, 16, 14);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (11, 11, 3, 1, 2020, 521, 0, 28, 20);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (12, 12, 3, 1, 2020, 268, 0, 19, 13);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (13, 13, 4, 3, 2020, 129, 0, 5, 5);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (14, 14, 4, 3, 2020, 62, 0, 4, 4);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (15, 15, 3, 1, 2020, 345, 0, 25, 20);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (16, 16, 4, 8, 2020, 70, 0, 6, 4);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (17, 17, 4, 8, 2020, 84, 0, 7, 5);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (18, 18, 4, 4, 2020, 320, 0, 17, 13);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (19, 19, 4, 8, 2020, 122, 0, 9, 7);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (20, 20, 4, 8, 2020, 93, 0, 6, 5);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (21, 21, 4, 3, 2020, 75, 0, 5, 4);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (22, 22, 4, 8, 2020, 72, 0, 7, 6);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (23, 23, 4, 8, 2020, 52, 0, 3, 3);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (24, 24, 4, 3, 2020, 169, 0, 11, 8);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (25, 25, 4, 3, 2020, 155, 0, 15, 10);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (26, 26, 4, 8, 2020, 17, 0, 2, 2);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (27, 27, 4, 3, 2020, 101, 0, 5, 4);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (28, 28, 4, 3, 2020, 105, 0, 7, 5);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (29, 29, 4, 2, 2020, 315, 0, 22, 21);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (30, 30, 4, 3, 2020, 36, 0, 3, 3);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (31, 31, 4, 3, 2020, 501, 0, 32, 27);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (32, 32, 4, 3, 2020, 53, 0, 5, 4);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (33, 33, 4, 3, 2020, 155, 0, 6, 5);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (34, 34, 4, 3, 2020, 62, 0, 5, 5);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (35, 35, 3, 7, 2020, 296, 0, 17, 13);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (36, 36, 3, 1, 2020, 27, 0, 7, 7);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (37, 37, 3, 7, 2020, 127, 0, 11, 10);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (38, 38, 3, 9, 2020, 319, 0, 19, 14);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (39, 39, 3, 1, 2020, 35, 35, 5, 1);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (40, 40, 3, 6, 2020, 181, 0, 6, 6);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (41, 41, 3, 1, 2020, 508, 0, 31, 23);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (42, 42, 5, 1, 2020, 174, 0, 9, 10);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (43, 43, 5, 1, 2020, 194, 0, 9, 9);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (44, 44, 5, 1, 2020, 276, 0, 12, 14);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (45, 45, 5, 1, 2020, 247, 0, 11, 12);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (46, 46, 5, 1, 2020, 179, 0, 7, 8);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (47, 47, 5, 1, 2020, 211, 0, 8, 10);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (48, 48, 5, 1, 2020, 0, 0, 0, 0);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (49, 49, 5, 9, 2020, 767, 178, 54, 25);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (50, 50, 5, 2, 2020, 122, 0, 28, 29);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (51, 51, 5, 2, 2020, 1018, 0, 44, 34);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (52, 52, 5, 1, 2020, 151, 0, 6, 5);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (53, 53, 5, 9, 2020, 675, 0, 46, 28);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (54, 54, 5, 9, 2020, 197, 0, 32, 20);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (55, 55, 5, 1, 2020, 561, 0, 26, 28);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (56, 56, 5, 1, 2020, 1011, 0, 50, 36);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (57, 57, 5, 7, 2020, 724, 0, 40, 29);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (58, 58, 5, 1, 2020, 129, 0, 22, 22);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (59, 59, 5, 9, 2020, 626, 0, 32, 18);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (60, 60, 5, 2, 2020, 564, 0, 29, 20);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (61, 61, 5, 9, 2020, 846, 0, 46, 34);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (62, 62, 5, 1, 2020, 186, 0, 7, 9);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (63, 63, 5, 1, 2020, 271, 0, 14, 14);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (64, 64, 5, 7, 2020, 1057, 0, 51, 42);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (65, 65, 5, 9, 2020, 716, 0, 50, 30);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (66, 66, 5, 9, 2020, 992, 0, 98, 49);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (67, 67, 5, 9, 2020, 1671, 0, 113, 62);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (68, 68, 5, 9, 2020, 1029, 0, 60, 38);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (69, 69, 5, 9, 2020, 950, 0, 46, 24);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (70, 70, 5, 7, 2020, 1024, 0, 47, 32);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (71, 71, 5, 9, 2020, 695, 0, 38, 21);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (72, 72, 5, 9, 2020, 672, 0, 33, 19);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (73, 73, 5, 7, 2020, 265, 0, 29, 15);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (74, 74, 5, 9, 2020, 859, 0, 70, 34);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (75, 75, 5, 1, 2020, 424, 0, 34, 28);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (76, 76, 3, 10, 2020, 0, 0, 0, 0);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (77, 77, 5, 10, 2020, 0, 0, 0, 0);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (78, 78, 5, 10, 2020, 0, 0, 0, 0);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (79, 79, 5, 10, 2020, 0, 0, 0, 0);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (80, 80, 5, 10, 2020, 0, 0, 0, 0);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (81, 81, 5, 10, 2020, 0, 0, 0, 0);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (82, 82, 5, 10, 2020, 0, 0, 0, 0);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (83, 83, 5, 10, 2020, 0, 0, 0, 0);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (84, 84, 5, 10, 2020, 0, 0, 0, 0);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (85, 85, 5, 10, 2020, 0, 0, 0, 0);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (86, 86, 5, 10, 2020, 0, 0, 0, 0);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (87, 87, 5, 10, 2020, 0, 0, 0, 0);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (88, 88, 5, 10, 2020, 0, 0, 0, 0);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (89, 89, 5, 10, 2020, 0, 0, 0, 0);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (90, 90, 5, 10, 2020, 0, 0, 0, 0);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (91, 91, 5, 10, 2020, 0, 0, 0, 0);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (92, 92, 5, 10, 2020, 0, 0, 0, 0);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (93, 93, 5, 10, 2020, 0, 0, 0, 0);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (94, 94, 5, 10, 2020, 0, 0, 0, 0);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (95, 95, 5, 10, 2020, 0, 0, 0, 0);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (96, 96, 5, 10, 2020, 0, 0, 0, 0);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (97, 97, 5, 10, 2020, 0, 0, 0, 0);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (98, 98, 5, 10, 2020, 0, 0, 0, 0);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (99, 99, 5, 10, 2020, 0, 0, 0, 0);
INSERT INTO Fato_Censo_Escolar (sk_fato, sk_escola, sk_localizacao, sk_infraestrutura, nu_ano_censo, qt_matriculas_bas, qt_matriculas_prof, qt_docentes_bas, qt_turmas_bas) VALUES (100, 100, 5, 10, 2020, 0, 0, 0, 0);
