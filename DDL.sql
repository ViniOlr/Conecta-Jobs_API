DROP TABLE cj_cursos CASCADE CONSTRAINTS;
DROP TABLE cj_requisitos CASCADE CONSTRAINTS;
DROP TABLE cj_usuarios CASCADE CONSTRAINTS;
DROP TABLE cj_vagas CASCADE CONSTRAINTS;
DROP TABLE cj_teste_vocacional CASCADE CONSTRAINTS;

DROP SEQUENCE seq_cj_id_curso;
DROP SEQUENCE seq_cj_id_vaga;
DROP SEQUENCE seq_cj_id_usuario;
DROP SEQUENCE seq_cj_id_requisito;
DROP SEQUENCE seq_cj_id_teste;

CREATE TABLE cj_cursos (
    id_curso      NUMBER NOT NULL,
    instituicao   VARCHAR2(50),
    titulo        VARCHAR2(50) NOT NULL,
    descricao     clob NOT NULL,
    duracao_horas NUMBER(3) NOT NULL,
    nivel         VARCHAR2(30) NOT NULL,
    area          VARCHAR2(75) NOT NULL,
    link          VARCHAR2(250) NOT NULL,
    gratuito      NUMBER(1) NOT NULL
);

ALTER TABLE cj_cursos ADD CONSTRAINT cj_cursos_pk PRIMARY KEY ( id_curso );

CREATE TABLE cj_requisitos (
    id_requisito NUMBER NOT NULL,
    id_vaga      NUMBER NOT NULL,
    descricao    VARCHAR2(200) NOT NULL,
    nivel         VARCHAR2(50) NOT NULL
);

ALTER TABLE cj_requisitos ADD CONSTRAINT cj_requisitos_pk PRIMARY KEY ( id_requisito );

CREATE TABLE cj_usuarios (
    id_usuario    NUMBER(5) NOT NULL,
    nome          VARCHAR2(100) NOT NULL,
    email         VARCHAR2(50) NOT NULL,
    senha         VARCHAR2(50) NOT NULL,
    dt_nascimento DATE NOT NULL,
    tp_usuario    NUMBER(2) NOT NULL
);

ALTER TABLE cj_usuarios ADD CONSTRAINT cj_usuarios_pk PRIMARY KEY ( id_usuario );

CREATE TABLE cj_vagas (
    id_vaga   NUMBER(5) NOT NULL,
    titulo    VARCHAR2(50) NOT NULL,
    descricao clob NOT NULL,
    empresa   VARCHAR2(50) NOT NULL,
    pcd       NUMBER(1),
    link      VARCHAR2(250)
);

ALTER TABLE cj_vagas ADD CONSTRAINT cj_vagas_pk PRIMARY KEY ( id_vaga );


CREATE TABLE cj_teste_vocacional (
    id_teste NUMBER(5) NOT NULL,
    id_usuario NUMBER(5) NOT NULL,
    pergunta clob NOT NULL,
    resposta clob
);

ALTER TABLE cj_teste_vocacional ADD CONSTRAINT cj_teste_vocacional_pk PRIMARY KEY (id_teste);

    
CREATE SEQUENCE seq_cj_id_curso
  START WITH 1
  INCREMENT BY 1;

CREATE SEQUENCE seq_cj_id_vaga
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

CREATE SEQUENCE seq_cj_id_usuario
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

CREATE SEQUENCE seq_cj_id_requisito
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

CREATE SEQUENCE seq_cj_id_teste
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

    