※ PaaS-TA Core 자동화 스크립트 사전 주의사항


1. 스크립트를 실행 전 variables.sh을 작성한다.

2. Sample_Path는 반드시 절대경로로 작성한다.

3. 작동은 01.bosh_login.sh 부터 순서대로 source 명령어를 이용해 작동한다.

4. PaaS-TA VARIABLES는 중복된 변수를 피해서 작성한다.

5. test-reset.sh은 테스트시 만들어진 앱과 메타데이터를 초기화 하는 파일이다. 
test-reset.sh 실행전 생성된 메타데이터중에 삭제하면 안되는 값이 있는지 반드시 확인한다.

6. 테스트와 관련된 기타 파일들은 etc 폴더에 있다.
