CREATE TABLE PROFESSOR(
	prof_id TINYINT(3),
    nome VARCHAR(60),
    PRIMARY KEY (prof_id)
);

CREATE TABLE ENDERECO(
	cidade VARCHAR(40),
	rua VARCHAR(50)
);

CREATE TABLE ALUNO(
	aluno_id SMALLINT(6),
    nome VARCHAR(60),
    PRIMARY KEY (aluno_id)
);

CREATE TABLE MATRICULA(
	aluno_id SMALLINT(6),
    disc_id TINYINT(3),
    ano DATETIME
);

CREATE TABLE DISCIPLINA(
	disc_id TINYINT(3),
    nome VARCHAR(40),
    qtd_aulas TINYINT(3),
    PRIMARY KEY (disc_id),
);

CREATE TABLE PROFESSOR_DISCIPLINA(
	disc_id TINYINT(3),
    prof_id TINYINT(3),
    ano DATETIME
);