DROP TABLE PCA_MEMBER;
CREATE TABLE PCA_MEMBER(
    PCA_DATE DATE DEFAULT SYSDATE,
    MEMBER_NO NUMBER(10),
    CLUSTER_NO NUMBER(10)
);

SELECT * FROM PCA_COMPONENT;

DROP TABLE PCA_COMPONENt;
CREATE TABLE PCA_COMPONENT(
    PCA_DATE DATE DEFAULT SYSDATE,
    CLUSTER_NO NUMBER(10),
    CATEGORY VARCHAR2(100)
);