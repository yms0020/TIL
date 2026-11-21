
# List 메서드 정리

Java 백엔드 실무에서 자주 사용하는 `List` 메서드를 우선순위별로 정리한다.

## 1. 필수 List 메서드

| 메서드 | 기능 | 실무 활용 |
|---|---|---|
| `add()` | 요소 추가 | 조회 결과 및 데이터 추가 |
| `addAll()` | 다른 컬렉션의 요소 전체 추가 | 데이터 병합 |
| `get()` | 특정 인덱스의 요소 조회 | 데이터 조회 |
| `set()` | 특정 인덱스의 요소 변경 | 데이터 수정 |
| `remove()` | 특정 요소 또는 인덱스의 요소 삭제 | 데이터 삭제 |
| `size()` | 요소 개수 반환 | 데이터 개수 확인 |
| `isEmpty()` | 리스트가 비어 있는지 확인 | 조회 결과 검증 |
| `contains()` | 특정 요소 포함 여부 확인 | 데이터 존재 여부 검사 |
| `clear()` | 모든 요소 삭제 | 데이터 초기화 |
| `indexOf()` | 특정 요소의 첫 번째 인덱스 반환 | 데이터 위치 검색 |
| `forEach()` | 각 요소에 대해 작업 수행 | 데이터 순회 |

---

## 2. 알아두면 좋은 List 메서드

| 메서드 | 기능 | 실무 활용 |
|---|---|---|
| `lastIndexOf()` | 특정 요소의 마지막 인덱스 반환 | 중복 데이터 위치 검색 |
| `subList()` | 리스트의 일부 구간 반환 | 데이터 일부 추출 |
| `sort()` | 리스트 정렬 | 조회 결과 정렬 |
| `removeIf()` | 조건에 맞는 요소 삭제 | 데이터 필터링 |
| `replaceAll()` | 모든 요소를 규칙에 따라 변경 | 데이터 일괄 수정 |
| `containsAll()` | 지정한 컬렉션의 모든 요소가 포함되어 있는지 확인 | 데이터 포함 여부 검사 |
| `retainAll()` | 지정한 컬렉션에도 포함된 요소만 유지 | 공통 데이터 추출 |
| `toArray()` | 리스트를 배열로 변환 | 배열 데이터 처리 |
| `stream()` | Stream 생성 | 필터링, 변환, 집계 |
| `List.of()` | 변경할 수 없는 리스트 생성 | 고정 데이터 관리 |
| `List.copyOf()` | 변경할 수 없는 리스트 복사본 생성 | 데이터 보호 |

---

## 3. 실무 사용 예시

### 3.1 요소 추가 - add()

```java
List<String> names = new ArrayList<>();

names.add("Java");
names.add("Spring");
names.add("Oracle");

System.out.println(names);
// [Java, Spring, Oracle]
```

- 리스트 마지막에 요소 추가
- `add(index, element)`로 특정 위치에도 추가 가능

### 3.2 요소 조회 - get()

```java
List<String> names = new ArrayList<>();

names.add("Java");
names.add("Spring");

String name = names.get(0);

System.out.println(name); // Java
```

- 인덱스는 0부터 시작
- 존재하지 않는 인덱스 접근 시 `IndexOutOfBoundsException` 발생

### 3.3 요소 변경 - set()

```java
List<String> names = new ArrayList<>();

names.add("Java");
names.add("Spring");

names.set(0, "Python");

System.out.println(names);
// [Python, Spring]
```

- `set(index, element)`
- 기존 요소를 새로운 요소로 변경
- 요소 개수는 변하지 않음

### 3.4 요소 삭제 - remove()

```java
List<String> names = new ArrayList<>();

names.add("Java");
names.add("Spring");
names.add("Oracle");

names.remove(1);

System.out.println(names);
// [Java, Oracle]
```

- `remove(index)` : 해당 인덱스의 요소 삭제
- `remove(object)` : 일치하는 첫 번째 요소 삭제
- `List<Integer>`에서는 `remove(1)`이 인덱스 삭제로 처리되므로 주의

### 3.5 리스트 크기 - size()

```java
List<String> names = new ArrayList<>();

names.add("Java");
names.add("Spring");

System.out.println(names.size()); // 2
```

- 리스트에 저장된 요소 개수 반환
- 배열의 `length`, 문자열의 `length()`와 구분

### 3.6 빈 리스트 검사 - isEmpty()

```java
List<String> names = new ArrayList<>();

if (names.isEmpty()) {
    System.out.println("데이터가 없습니다.");
}
```

- 요소가 없으면 `true`
- 요소가 하나 이상 있으면 `false`
- DB 조회 결과가 비어 있는지 확인할 때 활용

### 3.7 특정 요소 확인 - contains()

```java
List<String> names = new ArrayList<>();

names.add("Java");
names.add("Spring");

System.out.println(names.contains("Java")); // true
```

- 특정 요소가 포함되어 있는지 검사
- 객체의 동등성 비교에는 일반적으로 `equals()` 사용

### 3.8 조건에 맞는 요소 삭제 - removeIf()

```java
List<Integer> numbers = new ArrayList<>();

numbers.add(10);
numbers.add(20);
numbers.add(30);

numbers.removeIf(n -> n >= 20);

System.out.println(numbers);
// [10]
```

- 람다식을 이용하여 조건에 맞는 요소 삭제
- 원본 리스트가 변경됨

### 3.9 리스트 정렬 - sort()

```java
List<Integer> numbers = new ArrayList<>();

numbers.add(30);
numbers.add(10);
numbers.add(20);

numbers.sort(Comparator.naturalOrder());

System.out.println(numbers);
// [10, 20, 30]
```

- `Comparator.naturalOrder()` : 오름차순
- `Comparator.reverseOrder()` : 내림차순
- 원본 리스트가 정렬됨

---

## 4. List와 ArrayList 차이

| 구분 | List | ArrayList |
|---|---|---|
| 종류 | 인터페이스 | 클래스 |
| 객체 생성 | 직접 생성 불가 | 생성 가능 |
| 역할 | 리스트의 동작 정의 | 리스트 기능 구현 |
| 특징 | 구현체를 교체하기 쉬움 | 배열 기반으로 데이터 관리 |

### 일반적인 선언 방식

```java
List<String> names = new ArrayList<>();
```

- `List` : 변수의 타입
- `ArrayList` : 실제 생성되는 객체
- 인터페이스 타입으로 선언하면 구현체 변경이 유연해짐

---

## 5. List 순회 방법

### 일반 for문

```java
for (int i = 0; i < names.size(); i++) {
    System.out.println(names.get(i));
}
```

- 인덱스가 필요한 경우 사용

### 향상된 for문

```java
for (String name : names) {
    System.out.println(name);
}
```

- 요소를 순서대로 조회할 때 사용
- 인덱스가 필요하지 않을 때 간결함

### forEach()

```java
names.forEach(name -> System.out.println(name));
```

- 람다식을 이용한 순회
- 간단한 출력이나 작업 수행에 활용

---

## 6. 학습 우선순위

### 1순위 - 반드시 익숙해지기

- `add()`
- `get()`
- `set()`
- `remove()`
- `size()`
- `isEmpty()`
- `contains()`
- `clear()`

### 2순위 - 실무 활용 능력 높이기

- `addAll()`
- `forEach()`
- `sort()`
- `removeIf()`
- `indexOf()`
- `subList()`

### 3순위 - 필요할 때 학습

- `lastIndexOf()`
- `replaceAll()`
- `retainAll()`
- `containsAll()`
- `toArray()`
- `stream()`
- `List.of()`
- `List.copyOf()`

---

## 7. 핵심 정리

1. `List`는 순서가 있으며 중복 요소를 허용한다.
2. 요소 추가는 `add()`를 사용한다.
3. 요소 조회는 `get()`을 사용한다.
4. 요소 변경은 `set()`을 사용한다.
5. 요소 삭제는 `remove()`를 사용한다.
6. 요소 개수는 `size()`로 확인한다.
7. 빈 리스트 검사는 `isEmpty()`를 사용한다.
8. `ArrayList`는 `List` 인터페이스의 구현 클래스이다.
9. `List.of()`로 만든 리스트는 요소 추가, 수정, 삭제가 불가능하다.
10. 일반적으로 `List<타입> 변수 = new ArrayList<>();` 형태로 선언한다.
