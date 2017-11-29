DROP TABLE "CONTRATO"."RN_SEGMENTACAO_PRODUTO";
DROP TABLE "CONTRATO"."SEGMENTACAO_PRODUTO";
DROP SEQUENCE  "CONTRATO"."SQ_RN_SEGMENTACAO_PRODUTO" ;
DROP SEQUENCE  "CONTRATO"."SQ_SEGMENTACAO_PRODUTO" ;

CREATE TABLE "CONTRATO"."RN_COBERTURA" 
(	"COD_RN_COBERTURA" NUMBER(*,0) NOT NULL, 
"COD_REGULACAO_NORMATIVA" NUMBER(*,0) NOT NULL, 
"COD_COBERTURA" NUMBER(*,0) NOT NULL
) ;
ALTER TABLE "CONTRATO"."RN_COBERTURA" ADD CONSTRAINT "PK_RN_COBERTURA" PRIMARY KEY ("COD_RN_COBERTURA") ENABLE;
ALTER TABLE "CONTRATO"."RN_COBERTURA" ADD CONSTRAINT "FK_COBERTURA_3" FOREIGN KEY ("COD_COBERTURA")
	  REFERENCES "CONTRATO"."COBERTURA" ("COD_COBERTURA") ENABLE;
ALTER TABLE "CONTRATO"."RN_COBERTURA" ADD CONSTRAINT "FK_REGULACAO_NORMATIVA_5" FOREIGN KEY ("COD_REGULACAO_NORMATIVA")
	  REFERENCES "CONTRATO"."REGULACAO_NORMATIVA" ("COD_REGULACAO_NORMATIVA") ENABLE;

grant all on RN_COBERTURA to USER_CONTRATO;
create synonym USER_CONTRATO.RN_COBERTURA for RN_COBERTURA;

CREATE SEQUENCE  "CONTRATO"."SQ_RN_COBERTURA"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  ORDER  NOCYCLE  NOPARTITION ;

grant all on SQ_RN_COBERTURA to USER_CONTRATO;
create synonym USER_CONTRATO.SQ_RN_COBERTURA for SQ_RN_COBERTURA;
