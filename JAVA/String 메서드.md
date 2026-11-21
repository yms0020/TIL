
# String 메서드 정리

Java 백엔드 실무에서 자주 사용하는 `String` 메서드를 우선순위별로 정리한다.

## 1. 필수 String 메서드

| 메서드 | 기능 | 실무 활용 |
|---|---|---|
| `length()` | 문자열 길이 반환 | 입력값 길이 검증 |
| `isEmpty()` | 빈 문자열인지 확인 | 빈 값 검사 |
| `isBlank()` | 빈 문자열 또는 공백 문자만 있는지 확인 | 사용자 입력 검증 |
| `equals()` | 문자열 내용 비교 | 상태값, 코드 비교 |
| `equalsIgnoreCase()` | 대소문자 무시하고 비교 | 영문 입력값 비교 |
| `contains()` | 특정 문자열 포함 여부 | 키워드 검색 |
| `startsWith()` | 특정 문자열로 시작하는지 확인 | 접두어 검사 |
| `endsWith()` | 특정 문자열로 끝나는지 확인 | 파일 확장자 검사 |
| `substring()` | 문자열 일부 추출 | 코드, 날짜 추출 |
| `charAt()` | 특정 위치의 문자 반환 | 문자 단위 검사 |
| `indexOf()` | 특정 문자나 문자열 위치 검색 | 구분자 위치 찾기 |
| `split()` | 문자열 분리 | 구분자 데이터 처리 |
| `replace()` | 문자열 치환 | 데이터 가공 |
| `trim()` | 문자열 앞뒤 공백 제거 | 입력값 정리 |
| `strip()` | 유니코드 기준 앞뒤 공백 제거 | 입력값 정리 |
| `toUpperCase()` | 대문자로 변환 | 코드값 정규화 |
| `toLowerCase()` | 소문자로 변환 | 검색값 정규화 |

---

## 2. 알아두면 좋은 String 메서드

| 메서드 | 기능 | 실무 활용 |
|---|---|---|
| `replaceAll()` | 정규식에 일치하는 문자열 치환 | 숫자 외 문자 제거 |
| `replaceFirst()` | 첫 번째 정규식 일치 부분 치환 | 문자열 일부 수정 |
| `matches()` | 정규식 패턴 검사 | 입력 형식 검증 |
| `lastIndexOf()` | 마지막으로 등장하는 위치 검색 | 파일 확장자 분리 |
| `repeat()` | 문자열 반복 | 테스트 데이터 생성 |
| `String.valueOf()` | 값을 문자열로 변환 | 숫자 → 문자열 |
| `String.join()` | 구분자로 문자열 연결 | 데이터 목록 결합 |
| `String.format()` | 형식에 맞춰 문자열 생성 | 로그, 메시지 생성 |
| `toCharArray()` | 문자열을 char 배열로 변환 | 문자 단위 처리 |

---

## 3. 실무 사용 예시

### 3.1 사용자 입력값 검증 - isBlank()

```java
String name = "   ";

if (name.isBlank()) {
    System.out.println("이름을 입력하세요.");
}
```

- `isEmpty()` : 문자열 길이가 0인지 검사
- `isBlank()` : 빈 문자열이거나 공백 문자만 있는지 검사
- 두 메서드 모두 `null`에 직접 호출하면 `NullPointerException` 발생

### 3.2 문자열 비교 - equals()

```java
String status = "COMPLETE";

if (status.equals("COMPLETE")) {
    System.out.println("작업 완료");
}
```

- `==` : 객체의 참조 비교
- `equals()` : 문자열 내용 비교

### 3.3 문자열 분리 - split()

```java
String data = "P001|Keyboard|100|COMPLETE";

String[] values = data.split("\\|");

System.out.println(values[0]); // P001
System.out.println(values[1]); // Keyboard
```

- 구분자를 기준으로 문자열을 분리
- 반환 타입은 `String[]`
- `split()`의 인자는 정규식이므로 `|`는 이스케이프 필요

### 3.4 문자열 추출 - substring()

```java
String code = "PROD-2026-001";

String result = code.substring(0, 4);

System.out.println(result); // PROD
```

- `substring(beginIndex, endIndex)`
- 시작 인덱스 포함
- 종료 인덱스 미포함
- 문자열 인덱스는 0부터 시작

### 3.5 문자열 치환 - replace()

```java
String text = "Java Backend";

String result = text.replace("Java", "Spring");

System.out.println(result); // Spring Backend
```

- `replace()` : 일반 문자열 치환
- `replaceAll()` : 정규식을 이용한 치환

---

## 4. 학습 우선순위

### 1순위 - 반드시 익숙해지기

- `equals()`
- `isBlank()`
- `length()`
- `contains()`
- `substring()`
- `split()`
- `replace()`
- `strip()`

### 2순위 - 실무 활용 능력 높이기

- `indexOf()`
- `startsWith()`
- `endsWith()`
- `toUpperCase()`
- `toLowerCase()`
- `String.valueOf()`
- `String.join()`

### 3순위 - 필요할 때 학습

- `matches()`
- `replaceAll()`
- `replaceFirst()`
- `String.format()`
- `toCharArray()`
- `repeat()`

---

## 5. String의 중요한 특징

### String은 불변(Immutable) 객체

Java의 `String` 객체는 생성된 후 문자열 내용을 변경할 수 없다.

```java
String name = "hello";

name.toUpperCase();

System.out.println(name); // hello
```

변환 결과를 사용하려면 반환값을 다시 대입해야 한다.

```java
String name = "hello";

name = name.toUpperCase();

System.out.println(name); // HELLO
```

### 핵심 정리

1. 문자열 비교는 `equals()` 사용
2. 입력값 검증에는 `isBlank()` 활용
3. 문자열 분리는 `split()` 사용
4. 문자열 일부 추출은 `substring()` 사용
5. 문자열 치환은 `replace()` 또는 `replaceAll()` 사용
6. `String`은 불변 객체이므로 메서드 실행 결과를 반환받아야 함

