
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


# 2. null 조건부 연산자 (Null-Conditional Operator)

=> 객체가 null인지 확인하고, null이 아닐 경우에만 멤버나 요소에 접근하는 연산자

### 기본 문법

```csharp
객체?.속성
객체?.메서드()
객체?[인덱스]
```

### EX :

```csharp
string name = null;

int? length = name?.Length;

Console.WriteLine(length);
```

### 실행 결과:

```text
(빈 줄 출력)
```

=> name이 null이므로 Length 속성에 접근하지 않고 null을 반환한다.

| 구분 | 설명 |
|---|---|
| `name` | 접근할 객체 |
| `?.` | 객체가 null이 아닐 때만 멤버에 접근 |
| `Length` | 문자열의 길이를 반환하는 속성 |
| `int?` | null을 저장할 수 있는 int 자료형 |
| `length` | 결과를 저장하는 변수 |

### null인 경우와 null이 아닌 경우

| name 값 | name?.Length 결과 |
|---|---|
| `"Hello"` | 5 |
| `""` | 0 |
| `null` | null |

### 일반 접근과 null 조건부 연산자 비교

```csharp
string name = null;

// 일반 접근
int length1 = name.Length; // 예외 발생

// null 조건부 연산자
int? length2 = name?.Length; // null 반환
```

### null 병합 연산자(??)와 함께 사용

```csharp
string name = null;

int length = name?.Length ?? 0;

Console.WriteLine(length);
```

### 실행 결과:

```text
0
```

| 구분 | 설명 |
|---|---|
| `name?.Length` | name이 null이면 null 반환 |
| `??` | 왼쪽 값이 null이면 오른쪽 값 사용 |
| `0` | null일 경우 사용할 기본값 |
| `length` | 최종 결과를 저장하는 변수 |

### 배열에서 사용하는 null 조건부 연산자 (?[])

```csharp
int[] numbers = null;

int? result = numbers?[0];

Console.WriteLine(result);
```

=> numbers가 null이므로 배열의 0번 인덱스에 접근하지 않고 null을 반환한다.

### 참고

- `?.` : 객체가 null이 아닐 때만 속성이나 메서드에 접근
- `?[]` : 객체가 null이 아닐 때만 인덱스로 요소에 접근
- `??` : 왼쪽 값이 null이면 오른쪽 값을 반환
- null 조건부 연산자는 null로 인한 예외를 방지할 때 사용한다.


# 3. null 허용 경고 무시 연산자 (Null-Forgiving Operator)

=> 컴파일러에게 해당 값이 null이 아니라고 알려주어 null 관련 경고를 무시하는 연산자

### 기본 문법

```csharp
객체!.속성
객체!.메서드()
```

### EX :

```csharp
string? name = "Hello";

int length = name!.Length;

Console.WriteLine(length);
```

### 실행 결과:

```text
5
```

=> name!은 컴파일러에게 name이 null이 아니라고 알려주고, Length 속성에 접근한다.

| 구분 | 설명 |
|---|---|
| `string?` | null을 허용하는 문자열 자료형 |
| `name` | 접근할 객체 |
| `!` | null 관련 컴파일러 경고를 무시하는 연산자 |
| `.` | 객체의 속성이나 메서드에 접근하는 연산자 |
| `Length` | 문자열의 길이를 반환하는 속성 |
| `length` | 결과를 저장하는 변수 |

### null인 경우

```csharp
string? name = null;

int length = name!.Length;

Console.WriteLine(length);
```

### 실행 결과:

```text
NullReferenceException 발생
```

=> `!`는 실제 null 검사를 수행하지 않으므로 name이 null이면 예외가 발생한다.

### null 조건부 연산자(?.)와 비교

```csharp
string? name = null;

// null 조건부 연산자
int? length1 = name?.Length; // null 반환

// null 허용 경고 무시 연산자
int length2 = name!.Length; // 예외 발생
```

| 구분 | `?.` | `!.` |
|---|---|---|
| 이름 | null 조건부 연산자 | null 허용 경고 무시 연산자 + 멤버 접근 |
| null 검사 | 수행 | 수행하지 않음 |
| null인 경우 | null 반환 | 멤버 접근 시 예외 발생 가능 |
| 주요 목적 | null 안전하게 처리 | 컴파일러의 null 관련 경고 무시 |

### 참고

- `!` : 컴파일러의 null 관련 경고를 무시하는 연산자
- `?.` : 객체가 null이 아닐 때만 멤버에 접근
- `!`는 실제 값을 변경하지 않는다.
- `!`는 런타임에서 null 검사를 수행하지 않는다.
- 객체가 null이 아니라는 것이 확실할 때 사용하는 것이 좋다.



# 4. null 허용 경고 무시 연산자 (Null-Forgiving Operator)

=> 컴파일러에게 해당 값이 null이 아니라고 알려주어 null 관련 경고를 무시하는 연산자

### 기본 문법

```csharp
객체!.속성
객체!.메서드()
```

### EX :

```csharp
string? name = "Hello";

int length = name!.Length;

Console.WriteLine(length);
```

### 실행 결과:

```text
5
```

=> name!은 컴파일러에게 name이 null이 아니라고 알려주고, Length 속성에 접근한다.

| 구분 | 설명 |
|---|---|
| `string?` | null을 허용하는 문자열 자료형 |
| `name` | 접근할 객체 |
| `!` | null 관련 컴파일러 경고를 무시하는 연산자 |
| `.` | 객체의 속성이나 메서드에 접근하는 연산자 |
| `Length` | 문자열의 길이를 반환하는 속성 |
| `length` | 결과를 저장하는 변수 |

### null인 경우

```csharp
string? name = null;

int length = name!.Length;

Console.WriteLine(length);
```

### 실행 결과:

```text
NullReferenceException 발생
```

=> `!`는 실제 null 검사를 수행하지 않으므로 name이 null이면 예외가 발생한다.

### null 조건부 연산자(?.)와 비교

```csharp
string? name = null;

// null 조건부 연산자
int? length1 = name?.Length; // null 반환

// null 허용 경고 무시 연산자
int length2 = name!.Length; // 예외 발생
```

| 구분 | `?.` | `!.` |
|---|---|---|
| 이름 | null 조건부 연산자 | null 허용 경고 무시 연산자 + 멤버 접근 |
| null 검사 | 수행 | 수행하지 않음 |
| null인 경우 | null 반환 | 멤버 접근 시 예외 발생 가능 |
| 주요 목적 | null 안전하게 처리 | 컴파일러의 null 관련 경고 무시 |

### 참고

- `!` : 컴파일러의 null 관련 경고를 무시하는 연산자
- `?.` : 객체가 null이 아닐 때만 멤버에 접근
- `!`는 실제 값을 변경하지 않는다.
- `!`는 런타임에서 null 검사를 수행하지 않는다.
- 객체가 null이 아니라는 것이 확실할 때 사용하는 것이 좋다.
