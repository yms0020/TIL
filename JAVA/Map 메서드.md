
# Java Map 메서드 정리

Java 백엔드 실무에서 자주 사용하는 `Map` 메서드를 우선순위별로 정리한다.

## 1. 필수 Map 메서드

| 메서드 | 기능 | 실무 활용 |
|---|---|---|
| `put()` | 키와 값 저장 | 데이터 추가 및 수정 |
| `get()` | 키에 해당하는 값 조회 | 데이터 조회 |
| `getOrDefault()` | 키가 없으면 기본값 반환 | 기본값 처리 |
| `remove()` | 특정 키의 데이터 삭제 | 데이터 삭제 |
| `containsKey()` | 특정 키 존재 여부 확인 | 데이터 존재 여부 검사 |
| `containsValue()` | 특정 값 존재 여부 확인 | 값 검색 |
| `size()` | 저장된 항목 개수 반환 | 데이터 개수 확인 |
| `isEmpty()` | Map이 비어 있는지 확인 | 데이터 검증 |
| `clear()` | 모든 데이터 삭제 | 데이터 초기화 |
| `keySet()` | 모든 키 반환 | 키 순회 |
| `values()` | 모든 값 반환 | 값 순회 |
| `entrySet()` | 모든 키와 값 쌍 반환 | 전체 데이터 순회 |
| `putAll()` | 다른 Map의 데이터 전체 추가 | 데이터 병합 |

---

## 2. 알아두면 좋은 Map 메서드

| 메서드 | 기능 | 실무 활용 |
|---|---|---|
| `putIfAbsent()` | 키에 값이 없거나 null이면 값 저장 | 기본 데이터 등록 |
| `replace()` | 기존 키가 있을 때 값 변경 | 데이터 수정 |
| `replaceAll()` | 모든 값을 규칙에 따라 변경 | 데이터 일괄 수정 |
| `computeIfAbsent()` | 키에 값이 없거나 null이면 계산 후 저장 | 데이터 그룹화 |
| `computeIfPresent()` | 키에 null이 아닌 값이 있을 때 계산 | 기존 데이터 갱신 |
| `compute()` | 키의 값을 계산하여 갱신 | 데이터 가공 |
| `merge()` | 기존 값과 새로운 값을 병합 | 개수 합산 및 집계 |
| `forEach()` | 모든 키와 값 순회 | 데이터 처리 |
| `Map.of()` | 변경할 수 없는 Map 생성 | 고정 설정값 관리 |
| `Map.copyOf()` | 변경할 수 없는 Map 복사본 생성 | 데이터 보호 |

---

## 3. 실무 사용 예시

### 3.1 데이터 추가 및 수정 - put()

```java
Map<String, Integer> scores = new HashMap<>();

scores.put("Java", 90);
scores.put("SQL", 80);

System.out.println(scores.get("Java")); // 90

scores.put("Java", 100);

System.out.println(scores.get("Java")); // 100
```

- 키가 없으면 새로운 데이터 추가
- 키가 이미 존재하면 기존 값 변경
- Map은 중복 키를 허용하지 않음
- 값은 중복될 수 있음

### 3.2 데이터 조회 - get()

```java
Map<String, String> users = new HashMap<>();

users.put("user01", "Kim");
users.put("user02", "Lee");

String name = users.get("user01");

System.out.println(name); // Kim
```

- 키를 이용하여 값 조회
- 키가 존재하지 않으면 `null` 반환
- 값 자체가 `null`인 경우도 있으므로 구분이 필요할 수 있음

### 3.3 기본값 반환 - getOrDefault()

```java
Map<String, Integer> scores = new HashMap<>();

scores.put("Java", 90);

int score = scores.getOrDefault("Python", 0);

System.out.println(score); // 0
```

- 키가 존재하면 해당 값 반환
- 키가 없으면 지정한 기본값 반환
- 키가 존재하고 값이 null이면 null 반환

### 3.4 키 존재 여부 확인 - containsKey()

```java
Map<String, String> users = new HashMap<>();

users.put("user01", "Kim");

if (users.containsKey("user01")) {
    System.out.println("사용자가 존재합니다.");
}
```

- 키가 존재하면 `true`
- 존재하지 않으면 `false`
- 값이 null이어도 키가 존재하면 true

### 3.5 데이터 삭제 - remove()

```java
Map<String, Integer> scores = new HashMap<>();

scores.put("Java", 90);
scores.put("SQL", 80);

scores.remove("Java");

System.out.println(scores.containsKey("Java")); // false
```

- `remove(key)` : 해당 키의 데이터 삭제
- `remove(key, value)` : 키와 값이 모두 일치하면 삭제

### 3.6 모든 키 조회 - keySet()

```java
Map<String, Integer> scores = new HashMap<>();

scores.put("Java", 90);
scores.put("SQL", 80);

for (String key : scores.keySet()) {
    System.out.println(key);
}
```

- 모든 키를 `Set` 형태로 반환
- 키만 필요한 경우 사용

### 3.7 모든 값 조회 - values()

```java
Map<String, Integer> scores = new HashMap<>();

scores.put("Java", 90);
scores.put("SQL", 80);

for (Integer value : scores.values()) {
    System.out.println(value);
}
```

- 모든 값을 `Collection` 형태로 반환
- 값만 필요한 경우 사용

### 3.8 키와 값 함께 조회 - entrySet()

```java
Map<String, Integer> scores = new HashMap<>();

scores.put("Java", 90);
scores.put("SQL", 80);

for (Map.Entry<String, Integer> entry : scores.entrySet()) {
    System.out.println(entry.getKey());
    System.out.println(entry.getValue());
}
```

- `entrySet()`은 키와 값의 쌍을 반환
- `getKey()`로 키 조회
- `getValue()`로 값 조회
- 키와 값을 모두 사용할 때 유용

### 3.9 키가 없을 때만 추가 - putIfAbsent()

```java
Map<String, Integer> scores = new HashMap<>();

scores.put("Java", 90);

scores.putIfAbsent("Java", 100);
scores.putIfAbsent("SQL", 80);

System.out.println(scores.get("Java")); // 90
System.out.println(scores.get("SQL"));  // 80
```

- 키가 없거나 기존 값이 null일 때 저장
- 기존 값이 null이 아니면 변경하지 않음

### 3.10 데이터 개수 합산 - merge()

```java
Map<String, Integer> counts = new HashMap<>();

counts.merge("Java", 1, Integer::sum);
counts.merge("Java", 1, Integer::sum);
counts.merge("SQL", 1, Integer::sum);

System.out.println(counts.get("Java")); // 2
System.out.println(counts.get("SQL"));  // 1
```

- 키가 없거나 값이 null이면 지정한 값 저장
- 기존 값이 있으면 병합 함수 실행
- 데이터 개수 집계에 활용

---

## 4. Map과 HashMap 차이

| 구분 | Map | HashMap |
|---|---|---|
| 종류 | 인터페이스 | 클래스 |
| 객체 생성 | 직접 생성 불가 | 생성 가능 |
| 역할 | 키와 값의 동작 정의 | 해시 테이블 기반 구현 |
| 순서 | 구현체에 따라 다름 | 순서 보장 안 함 |
| 중복 키 | 허용하지 않음 | 허용하지 않음 |

### 일반적인 선언 방식

```java
Map<String, Integer> scores = new HashMap<>();
```

- `Map` : 변수의 타입
- `HashMap` : 실제 생성되는 객체
- `String` : 키의 타입
- `Integer` : 값의 타입

### 주요 Map 구현체

| 구현체 | 특징 |
|---|---|
| `HashMap` | 순서를 보장하지 않으며 일반적인 키 조회에 사용 |
| `LinkedHashMap` | 삽입 순서를 유지 |
| `TreeMap` | 키를 정렬된 순서로 관리 |
| `ConcurrentHashMap` | 여러 스레드의 동시 접근을 지원 |

---

## 5. Map 순회 방법

### keySet() 사용

```java
for (String key : scores.keySet()) {
    System.out.println(key);
}
```

- 키만 필요한 경우 적합

### entrySet() 사용

```java
for (Map.Entry<String, Integer> entry : scores.entrySet()) {
    System.out.println(entry.getKey() + " : " + entry.getValue());
}
```

- 키와 값을 모두 사용할 때 적합

### forEach() 사용

```java
scores.forEach((key, value) -> {
    System.out.println(key + " : " + value);
});
```

- 람다식을 이용하여 키와 값을 간결하게 처리

---

## 6. 학습 우선순위

### 1순위 - 반드시 익숙해지기

- `put()`
- `get()`
- `getOrDefault()`
- `remove()`
- `containsKey()`
- `size()`
- `isEmpty()`
- `keySet()`
- `values()`
- `entrySet()`

### 2순위 - 실무 활용 능력 높이기

- `putAll()`
- `putIfAbsent()`
- `replace()`
- `forEach()`
- `merge()`
- `computeIfAbsent()`

### 3순위 - 필요할 때 학습

- `containsValue()`
- `clear()`
- `replaceAll()`
- `computeIfPresent()`
- `compute()`
- `Map.of()`
- `Map.copyOf()`

---

## 7. 핵심 정리

1. `Map`은 Key-Value 형태로 데이터를 저장한다.
2. 키는 중복될 수 없지만 값은 중복될 수 있다.
3. 데이터 추가 및 수정은 `put()`을 사용한다.
4. 데이터 조회는 `get()`을 사용한다.
5. 키 존재 여부는 `containsKey()`로 확인한다.
6. 키만 조회할 때는 `keySet()`을 사용한다.
7. 값만 조회할 때는 `values()`를 사용한다.
8. 키와 값을 함께 조회할 때는 `entrySet()`을 사용한다.
9. 일반적인 Map 구현체로 `HashMap`을 많이 사용한다.
10. `HashMap`은 요소의 순서를 보장하지 않는다.
11. `Map.of()`로 생성한 Map은 수정할 수 없다.
12. 일반적으로 `Map<K, V> 변수 = new HashMap<>();` 형태로 선언한다.
