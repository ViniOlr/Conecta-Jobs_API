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

-- Insere curso
INSERT INTO cj_cursos (id_curso, instituicao, titulo, descricao, duracao_horas, nivel, area, link, gratuito)
VALUES (seq_cj_id_curso.NEXTVAL, 'Fundação Bradesco', 'Administrando Banco de Dados', 'Neste curso, você verá uma introdução de como administrar um banco de dados e, desta forma, conseguir realizar um bom gerenciamento das atividades inerentes a essa função. Além disso, você conhecerá os conceitos que fazem parte do dia a dia de um administrador de banco de dados, os modelos de dados, SQL, esquemas, instâncias, tabelas e todo esse fascinante universo que envolve os bancos de dados! Você entenderá as diferenças entre os diversos profissionais que atuam em atividades ligadas à gerência de banco de dados, bem como quais são os tipos mais utilizados e adequados a empresas de qualquer porte. Os conhecimentos adquiridos neste curso poderão ajudá-lo(a) a ingressar na carreira de administração de banco de dados.', 15, 'Avançado', 'Tecnologia da Informação', 'https://ev.org.br/cursos/administrando-banco-de-dados', 1);

-- Insere vaga
SET DEFINE OFF;
INSERT INTO cj_vagas (id_vaga, titulo, descricao, empresa, pcd, link)
VALUES (seq_cj_id_vaga.NEXTVAL, 'Jovem Aprendiz Administrativo', 'Detalhes da vaga\nSua energia será muito importante para:\nAprender e apoiar sobre atuação na área administrativa na empresa, viabilizando o cumprimento dos objetivos estabelecidos pela sua área de atuação.\nAtividades:\n\n Realizar atividades administrativas, operando e mantendo as ações que otimizem o fluxo das rotinas administrativas internas e externas, conforme as normas e instruções, práticas e procedimentos gerais;\nControlar a recepção e expedição de correspondências internas e externas, bem como manter atualizados os arquivos setoriais;\n Solicitar, controlar e distribuir materiais administrativos.\n\nPara fazer parte do nosso time, você precisa ter:\n\n Ensino médio concluído ou em andamento;\n Disponibilidade para atuar 4h diárias (manhã ou tarde);\n Possuir carteira de trabalho e não ter nenhuma experiência prévia (registrada em carteira) na área administrativa;\n Pacote Office básico;\n Possuir Ensino Superior em andamento. (Desejável).\n\nPara você ficar com a energia lá em cima, confira nossos benefícios:\n\n Jornada de trabalho: 20h semanais;\n Vale transporte;\n Vale-refeição;\n Seguro de vida;\n Auxílio para atividade física (Gympass).\n\n#VemSerNeoenergia \n#OrgulhodeSerNeoenergia\nBenefícios\n\nAuxílio-academia\n\nSeguro de vida\n\nVale-refeição\n\nVale-transporte','Neoenergia', 0, 'https://www.linkedin.com/jobs/view/3715451401/?alternateChannel=search&refId=zraCovsOnk44zIvPgT9l1w%3D%3D&trackingId=IveiUZ4uRJt1RjcaQusSJw%3D%3D');
SET DEFINE ON;

-- Insere requisito
INSERT INTO cj_requisitos (id_requisito, id_vaga, descricao, nivel)
VALUES (seq_cj_id_requisito.NEXTVAL, seq_id_vaga.CURRVAL, 'Python', 'Iniciante');

INSERT INTO cj_requisitos (id_requisito, id_vaga, descricao, nivel)
VALUES (seq_cj_id_requisito.NEXTVAL, seq_id_vaga.CURRVAL, 'HTML', 'Iniciante');

-- Insere Usuario
INSERT INTO cj_usuarios (id_usuario, nome, email, senha, dt_nascimento, tp_usuario)
VALUES (seq_cj_id_usuario.NEXTVAL, 'Sophia Aparecida da Costa', 'sophia-dacosta82@gmail.com', 'XCB6Rz1ZrY', TO_DATE('1996-05-10', 'YYYY-MM-DD'), 1);

-- Insere vocacional
INSERT INTO cj_teste_vocacional (id_teste, id_usuario, pergunta, resposta)
VALUES (seq_cj_id_teste.NEXTVAL, seq_cj_id_usuario.CURRVAL, 'Olá, sou uma criança de uma ong chamada Passos Mágicos, me chamdo Vinicius e gostaria que você me ajudasse a pensar em que área posso me com base nas minhas informações. Eu gosto bastante de informática, tenho aptidão por isto. Gosto de matemática e gostaria de trabalhar na prefeitura.', 'Olá, Vinicius!\n\nParabéns pela sua iniciativa de pensar no seu futuro profissional. É muito importante começar a se preparar desde cedo para escolher uma carreira que você goste e que seja bem-sucedida.\n\nCom base nas informações que você me passou, acredito que você tenha uma aptidão para a área de tecnologia da informação. Você gosta de informática e tem facilidade para aprender conceitos e modelos abstratos, que são habilidades fundamentais para esta área.\n\nAlém disso, você também gosta de mbém pode conversar com profissionatemática, o que é um pré-requisito para muitos cursos de tecnologia.\n\nCom base nessas informações, acredito que você poderia seguir uma carreira na área de tecnologia da informação, com foco em áreas como:\n\n* **Ciência da computação:** um curso de graduação que ensina os fundamentos da computação, como programação, algoritmos e estrutura de dados.\n* **Engenharia de software:** um curso de graduação que ensina a desenvolver, testar e implantar software.\n* **Análise de dados:** um campo da ciência da computação que usa técnicas matemáticas e estatísticas para analisar dados.\n\nEssas são apenas algumas possibilidades, e é importante que você pesquise mais sobre cada uma delas para encontrar a que melhor se encaixa no seu perfil.\n\nQuanto ao seu interesse em trabalhar na prefeitura, existem muitas oportunidades na área de tecnologia na administração pública. Por exemplo, você poderia temática ou de robótica, por exemprabalhar no desenvolvimento de sistemas para o governo, na análise de dados para a tomada de decisões ou na segurança da informação.\n\nAqui estão algumas dicas para você começar a se preparar para o seu futuro profissional:\n\n* **Continue estudando:** é imnet.* **Volunteie-se para projetoportante manter um bom desempenho na escola para se preparar para os vestibulares e para o mercado de trabalho.\n* **Participe de atividades extracurriculares:** participar de atividades extracurriculares é uma ótima maneira de desenvolver suas habilidades e conhecer novas pessoas.\n* **Faça estágios:** os estágios são uma ótima maneira de ganhar experiência profissional e se conectar com o mercado de trabalho.\n\nEspero que essas informações tenham sido úteis. Desejo a você muito sucesso na sua jornada!');