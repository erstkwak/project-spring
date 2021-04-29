# 프로젝트 실행 전 설정

1. DB 계정 생성 및 테이블 생성
```
cmd
sqlplus / as sysdba
CREATE USER gocamping IDENTIFIED BY 1234
GRANT CONNECT, RESOURCE, DBA TO gocamping
```
2. 톰캣 서버 포트번호 8080으로 설정