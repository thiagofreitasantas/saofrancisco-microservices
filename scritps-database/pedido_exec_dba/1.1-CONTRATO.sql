
-- CONTRATO INICIO

CREATE TABLE CONTRATO.MODO
  (
    COD_MODO NUMBER (*,0) NOT NULL ,
    NM_MODO  VARCHAR2 (50 BYTE) ,
    DSC_MODO VARCHAR2 (200 BYTE) ,
    COD_TIPO NUMBER (*,0) NOT NULL
  )
  LOGGING ;
ALTER TABLE CONTRATO.MODO ADD CONSTRAINT MODO_PK PRIMARY KEY ( COD_MODO ) ;

CREATE TABLE CONTRATO.PRECO
  (
    COD_PRECO           NUMBER (*,0) NOT NULL ,
    COD_CONTRATO_PLANO  NUMBER (*,0) NOT NULL ,
    COD_PRECO_INSTANCIA NUMBER (*,0) NOT NULL ,
    DT_ATIVACAO         DATE
  )
  LOGGING ;
ALTER TABLE CONTRATO.PRECO ADD CONSTRAINT TABELA_PRECO2_PK PRIMARY KEY ( COD_PRECO ) ;
ALTER TABLE CONTRATO.PRECO ADD CONSTRAINT PRECO_PLANO_UN UNIQUE ( COD_PRECO , COD_CONTRATO_PLANO ) ;

CREATE TABLE CONTRATO.PRECO_HIST
  (
    COD_PRECO_HIST      NUMBER (*,0) NOT NULL ,
    COD_USUARIO_SF      NUMBER (*,0) NOT NULL ,
    DT_ALTERACAO        DATE ,
    COD_PRECO           NUMBER (*,0) NOT NULL ,
    COD_PRECO_INSTANCIA NUMBER (*,0) NOT NULL
  )
  LOGGING ;
ALTER TABLE CONTRATO.PRECO_HIST ADD CONSTRAINT TABELA_PRECO2_HIST_PK PRIMARY KEY ( COD_PRECO_HIST ) ;

CREATE TABLE CONTRATO.PRECO_INSTANCIA
  (
    COD_PRECO_INSTANCIA NUMBER (*,0) NOT NULL ,
    COD_TIPO            NUMBER (*,0) NOT NULL ,
    COD_MODO            NUMBER (*,0) NOT NULL ,
    FL_PADRAO_ANS       CHAR DEFAULT 'N',
    COD_PRECO           NUMBER (*,0) NOT NULL
  )
  LOGGING ;
ALTER TABLE CONTRATO.PRECO_INSTANCIA ADD CONSTRAINT PRECO_INSTANCIA_PK PRIMARY KEY ( COD_PRECO_INSTANCIA ) ;

CREATE TABLE CONTRATO.PRECO_ITEM
  (
    COD_PRECO_ITEM         NUMBER (*,0) NOT NULL ,
    COD_PRECO_ITEM_DETALHE NUMBER (*,0) NOT NULL ,
    VALOR                  NUMBER (14) ,
    COD_PRECO_INSTANCIA    NUMBER (*,0) NOT NULL
  )
  LOGGING ;
ALTER TABLE CONTRATO.PRECO_ITEM ADD CONSTRAINT PRECO_ITEM_PK PRIMARY KEY ( COD_PRECO_ITEM ) ;

CREATE TABLE CONTRATO.PRECO_ITEM_DETALHE
  (
    COD_PRECO_ITEM_DETALHE    NUMBER (*,0) NOT NULL ,
    NM_PRECO_ITEM_DETALHE     VARCHAR2 (100 BYTE) ,
    DSC_PRECO_ITEM_DETALHE    VARCHAR2 (200 BYTE) ,
    ORDEM                     NUMBER (38) ,
    COD_MODO                  NUMBER (*,0) NOT NULL ,
    FL_PADRAO_ANS             CHAR DEFAULT 'N',
    PRECO_ITEM_COD_PRECO_ITEM NUMBER (*,0) NOT NULL
  )
  LOGGING ;
ALTER TABLE CONTRATO.PRECO_ITEM_DETALHE ADD CONSTRAINT PRECO_ITEM_DETALHE_PK PRIMARY KEY ( COD_PRECO_ITEM_DETALHE ) ;



CREATE TABLE CONTRATO.PRECO_PROGRAMADA
  (
    COD_PRECO_PROGRAMADA NUMBER (*,0) NOT NULL ,
    COD_PRECO            NUMBER (*,0) NOT NULL ,
    DT_AGENDAMENTO       DATE ,
    FL_ATIVO             CHAR DEFAULT 'N',
    COD_PRECO_INSTANCIA  NUMBER (*,0) NOT NULL
  )
  LOGGING ;
ALTER TABLE CONTRATO.PRECO_PROGRAMADA ADD CONSTRAINT PRECO_PROGRAMADA_PK PRIMARY KEY ( COD_PRECO_PROGRAMADA ) ;

CREATE TABLE CONTRATO.TIPO
  (
    COD_TIPO NUMBER (*,0) NOT NULL ,
    DSC_TIPO VARCHAR2 (200 BYTE) ,
    NM_TIPO  VARCHAR2 (50 BYTE)
  )
  LOGGING ;
  
ALTER TABLE CONTRATO.TIPO ADD CONSTRAINT TIPO_PK PRIMARY KEY ( COD_TIPO ) ;

ALTER TABLE CONTRATO.MODO ADD CONSTRAINT MODO_TIPO_FK FOREIGN KEY ( COD_TIPO ) REFERENCES CONTRATO.TIPO ( COD_TIPO ) NOT DEFERRABLE ;

ALTER TABLE CONTRATO.PRECO ADD CONSTRAINT PRECO_CONTRATO_PLANO_FK FOREIGN KEY ( COD_CONTRATO_PLANO ) REFERENCES CONTRATO.CONTRATO_PLANO ( COD_CONTRATO_PLANO ) NOT DEFERRABLE ;

ALTER TABLE CONTRATO.PRECO ADD CONSTRAINT PRECO_PRECO_INSTANCIA_FK FOREIGN KEY ( COD_PRECO_INSTANCIA ) REFERENCES CONTRATO.PRECO_INSTANCIA ( COD_PRECO_INSTANCIA ) NOT DEFERRABLE ;

ALTER TABLE CONTRATO.PRECO_HIST ADD CONSTRAINT PRECO2_HIST_PRECO2_FK FOREIGN KEY ( COD_PRECO ) REFERENCES CONTRATO.PRECO ( COD_PRECO ) NOT DEFERRABLE ;

ALTER TABLE CONTRATO.PRECO_HIST ADD CONSTRAINT PRECO_HIST_PRECO_INSTANCIA_FK FOREIGN KEY ( COD_PRECO_INSTANCIA ) REFERENCES CONTRATO.PRECO_INSTANCIA ( COD_PRECO_INSTANCIA ) NOT DEFERRABLE ;

ALTER TABLE CONTRATO.PRECO_INSTANCIA ADD CONSTRAINT PRECO_INSTANCIA_TIPO_FK FOREIGN KEY ( COD_TIPO ) REFERENCES CONTRATO.TIPO ( COD_TIPO ) NOT DEFERRABLE ;

ALTER TABLE CONTRATO.PRECO_INSTANCIA ADD CONSTRAINT PRECO_INSTANCIA_MODO_FK FOREIGN KEY ( COD_MODO ) REFERENCES CONTRATO.MODO ( COD_MODO ) NOT DEFERRABLE ;

ALTER TABLE CONTRATO.PRECO_INSTANCIA ADD CONSTRAINT PRECO_INSTANCIA_PRECO_FK FOREIGN KEY ( COD_PRECO ) REFERENCES CONTRATO.PRECO ( COD_PRECO ) NOT DEFERRABLE ;

ALTER TABLE CONTRATO.PRECO_ITEM ADD CONSTRAINT PRECO_ITEM_PRECO_INSTANCIA_FK FOREIGN KEY ( COD_PRECO_INSTANCIA ) REFERENCES CONTRATO.PRECO_INSTANCIA ( COD_PRECO_INSTANCIA ) NOT DEFERRABLE ;

ALTER TABLE CONTRATO.PRECO_ITEM ADD CONSTRAINT PRECO_ITEM_PRECO_ITEM_DETALHE_FK FOREIGN KEY ( COD_PRECO_ITEM_DETALHE ) REFERENCES CONTRATO.PRECO_ITEM_DETALHE ( COD_PRECO_ITEM_DETALHE ) NOT DEFERRABLE ;

ALTER TABLE CONTRATO.PRECO_ITEM_DETALHE ADD CONSTRAINT PRECO_ITEM_DETALHE_PRECO_ITEM_FK FOREIGN KEY ( PRECO_ITEM_COD_PRECO_ITEM ) REFERENCES CONTRATO.PRECO_ITEM ( COD_PRECO_ITEM ) NOT DEFERRABLE ;

ALTER TABLE CONTRATO.PRECO_ITEM_DETALHE ADD CONSTRAINT PRECO_ITEM_DETALHE_MODO_FK FOREIGN KEY ( COD_MODO ) REFERENCES CONTRATO.MODO ( COD_MODO ) NOT DEFERRABLE ;

ALTER TABLE CONTRATO.PRECO_PROGRAMADA ADD CONSTRAINT PRECO_PROGRAMADA_PRECO_INSTANCIA_FK FOREIGN KEY ( COD_PRECO_INSTANCIA ) REFERENCES CONTRATO.PRECO_INSTANCIA ( COD_PRECO_INSTANCIA ) NOT DEFERRABLE ;

ALTER TABLE CONTRATO.PRECO_PROGRAMADA ADD CONSTRAINT PRECO_PROGRAMADA_PRECO_FK FOREIGN KEY ( COD_PRECO ) REFERENCES CONTRATO.PRECO ( COD_PRECO ) NOT DEFERRABLE ;

ALTER TABLE CONTRATO.PRECO_PROGRAMADA ADD CONSTRAINT PRECO_PROGRAMADA_PRECO_INSTANCIA_FKv1 FOREIGN KEY ( COD_PRECO_INSTANCIA ) REFERENCES CONTRATO.PRECO_INSTANCIA ( COD_PRECO_INSTANCIA ) NOT DEFERRABLE ;


-- CONTRATO FIM


CREATE SEQUENCE SQ_TIPO START WITH 0 MINVALUE 0 MAXVALUE 9223372036854775807 NOCYCLE;
CREATE SEQUENCE SQ_MODO START WITH 0 MINVALUE 0 MAXVALUE 9223372036854775807 NOCYCLE;
CREATE SEQUENCE SQ_PRECO START WITH 0 MINVALUE 0 MAXVALUE 9223372036854775807 NOCYCLE;
CREATE SEQUENCE SQ_PRECO_HIST START WITH 0 MINVALUE 0 MAXVALUE 9223372036854775807 NOCYCLE;
CREATE SEQUENCE SQ_PRECO_INSTANCIA START WITH 0 MINVALUE 0 MAXVALUE 9223372036854775807 NOCYCLE;
CREATE SEQUENCE SQ_PRECO_ITEM START WITH 0 MINVALUE 0 MAXVALUE 9223372036854775807 NOCYCLE;
CREATE SEQUENCE SQ_PRECO_ITEM_DETALHE START WITH 0 MINVALUE 0 MAXVALUE 9223372036854775807 NOCYCLE;
CREATE SEQUENCE SQ_PRECO_PROGRAMADA START WITH 0 MINVALUE 0 MAXVALUE 9223372036854775807 NOCYCLE;


ALTER TABLE CONTRATO.PRECO_INSTANCIA 
DROP CONSTRAINT PRECO_INSTANCIA_PRECO_FK;

ALTER TABLE CONTRATO.PRECO_INSTANCIA 
DROP COLUMN COD_PRECO;

ALTER TABLE CONTRATO.PRECO_ITEM  
MODIFY (COD_PRECO_ITEM_DETALHE NULL);

ALTER TABLE CONTRATO.PRECO_ITEM_DETALHE RENAME COLUMN PRECO_ITEM_COD_PRECO_ITEM TO COD_PRECO_ITEM;

ALTER TABLE CONTRATO.PRECO_ITEM_DETALHE  
MODIFY (COD_PRECO_ITEM NULL);

ALTER TABLE CONTRATO.PRECO_ITEM_DETALHE 
DROP CONSTRAINT P_ITEM_DETALHE_ITEM_FK;

ALTER TABLE CONTRATO.PRECO_ITEM_DETALHE 
DROP COLUMN COD_PRECO_ITEM;

ALTER TABLE CONTRATO.PRECO 
ADD (NM_PRECO VARCHAR2(50) ); 

ALTER TABLE CONTRATO.PRECO_ITEM_DETALHE  
MODIFY (COD_MODO NULL);

ALTER TABLE CONTRATO.PRECO_INSTANCIA  
MODIFY (COD_MODO NULL);
