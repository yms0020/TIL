
# 1. TryParse()란?

=> 문자열을 특정 자료형으로 변환할 수 있는지 확인하고, 변환에 성공하면 그 값을 저장하는 메서드

### EX :

```csharp
string success = "false";
bool result = bool.TryParse(success, out bool isSuccess);
```

=> TryParse()는 변환 성공 여부를 반환하고, out으로 실제 변환된 값을 전달을 한다.

| 구분 | 설명 |
|---|---|
| `bool.TryParse()` | 문자열을 bool로 변환 시도 |
| `success` | 변환할 문자열 |
| `out` | 변환된 값을 메서드 밖의 변수에 저장하는 키워드 |
| `bool isSuccess` | 변환된 bool 값을 저장할 변수 |
| `result` | 변환 성공 여부를 저장하는 변수 |

### 실행 결과:

- `result = true` → 문자열을 bool로 변환하는 데 성공
- `isSuccess = false` → 실제 변환된 값은 false

| success 문자열 | result (변환 성공 여부) | isSuccess (변환된 값) |
|---|---|---|
| `"true"` | true | true |
| `"false"` | true | false |
| `"abc"` | false | false |
| `null` | false | false |

### Parse()와 TryParse() 차이

| 구분 | bool.Parse() | bool.TryParse() |
|---|---|---|
| 변환 성공 | bool 값 반환 | true 반환 + out에 값 저장 |
| 변환 실패 | 예외 발생 | false 반환 |
| null 입력 | 예외 발생 | false 반환 |
