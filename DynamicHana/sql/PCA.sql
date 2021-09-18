DROP TABLE PCA_MEMBER;
CREATE TABLE PCA_MEMBER(
    PCA_DATE DATE DEFAULT SYSDATE,
    MEMBER_NO NUMBER(10),
    CLUSTER_NO NUMBER(10)
);

SELECT * FROM PCA_MEMBER;

DROP TABLE PCA_COMPONENt;
CREATE TABLE PCA_COMPONENT(
    PCA_DATE DATE DEFAULT SYSDATE,
    CLUSTER_NO NUMBER(10),
    CATEGORY VARCHAR2(100)
);

SELECT * FROM PCA_COMPONENT;

commit;
UPDATE PCA_COMPONENT SET PCA_DATE='21/09/01' WHERE PCA_DATE>TO_DATE('21-01-01');
UPDATE PCA_COMPONENT SET PCA_DATE='21/09/01' WHERE PCA_DATE>TO_DATE('21-01-01');
DROP TABLE PCA_COMPONENT;

SELECT * FROM TRANSACTION_HISTORY ORDER BY HISTORY_NO DESC;
commit;
UPDATE TRANSACTION_HISTORY SET HISTORY_DATE= HISTORY_DATE - (365*3) WHERE HISTORY_DATE > TO_DATE('23/01/01');