1.SQL 인젝션이란?
=>사용자가 입력한 값을 이용해서 개발자가 의도하지 않은 SQL을 실행하도록 만드는 공격

2.SQL 인젝션이 발생하는 원리
예를 들어 사용자가 제품 코드를 입력하면 Oracle DB에서 해당 제품을 조회한다고 가정을 한다.
정상적인 코드
String productCode = "P001";

String sql = "SELECT * FROM PRODUCTION_RESULT "
           + "WHERE PRODUCT_CODE = '" + productCode + "'";

실제로 실행되는 SQL은 다음과 같다.
SELECT *
FROM PRODUCTION_RESULT
WHERE PRODUCT_CODE = 'P001';

정상적으로 P001 제품만 조회돼.
악의적인 값을 입력한다면?
사용자가 제품 코드 대신 다음 문자열을 입력했다고 가정해 보자.
' OR '1'='1


Java에서 문자열을 연결하면 SQL이 이렇게 만들어져.
SELECT *
FROM PRODUCTION_RESULT
WHERE PRODUCT_CODE = '' OR '1'='1';


여기서 '1'='1'은 항상 참이다.

따라서 특정 제품만 조회하려던 SQL이 모든 제품을 조회하는 SQL로 바뀌어 버린다

이게 SQL 인젝션이다.

2.인젝션 방어하기
*PreparedStatement로 방어하기
String sql = "SELECT * FROM PRODUCTION_RESULT "
           + "WHERE PRODUCT_CODE = ?";

try (Connection conn = DBUtil.getConnection();
     PreparedStatement pstmt = conn.prepareStatement(sql)) {

    pstmt.setString(1, productCode);

    try (ResultSet rs = pstmt.executeQuery()) {
        // 조회 결과 처리
    }
}

여기서 핵심은 다음 부분이다.
pstmt.setString(1, productCode);
?에 전달한 값은 SQL 명령어가 아니라 데이터로 취급이 된다.

따라서 사용자가 ' OR '1'='1을 입력해도 SQL 조건으로 실행되지 않고, 그 문자열과 일치하는 제품 코드를 검색하게 된다.

Statement와 PreparedStatement 차이
구분	Statement	PreparedStatement
SQL 작성	문자열 연결 가능	? 바인딩 지원
사용자 입력	직접 연결하면 위험	바인딩하면 안전
SQL 인젝션	취약할 수 있음	값 바인딩으로 방어
실무 사용	고정 SQL 등에 사용	사용자 입력 SQL에 권장

주의할 점은 PreparedStatement를 사용하더라도 사용자 입력을 SQL 문자열에 직접 연결하면 여전히 위험하다.

실무에서는 PreparedStatement를 통한 바인딩뿐 아니라,파라미터 바인딩, 입력값 검증, DB 계정의 최소 권한 설정,ORM 사용, 저장 프로시저도 함께 사용한다.
