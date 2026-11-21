# Oracle MERGE

## 1. MERGE란?

`MERGE`는 기존 데이터가 존재하는지 확인하여 **UPDATE 또는 INSERT를 수행하는 SQL 문법**이다.

- **데이터가 존재하면** → `UPDATE`
- **데이터가 존재하지 않으면** → `INSERT`

## 2. 기본 문법

```sql
MERGE INTO 대상테이블 T
USING 원본데이터 S
ON (T.ID = S.ID)

WHEN MATCHED THEN
    UPDATE SET T.NAME = S.NAME

WHEN NOT MATCHED THEN
    INSERT (ID, NAME)
    VALUES (S.ID, S.NAME);
```

| 문법 | 설명 |
|---|---|
| `MERGE INTO` | 데이터를 수정하거나 추가할 대상 테이블 |
| `USING` | 비교할 원본 데이터 |
| `ON` | 기존 데이터와 일치하는지 판단하는 조건 |
| `WHEN MATCHED THEN` | 조건이 일치하면 실행 |
| `UPDATE SET` | 기존 데이터 수정 |
| `WHEN NOT MATCHED THEN` | 조건이 일치하지 않으면 실행 |
| `INSERT` | 새로운 데이터 추가 |

## 3. 예시

### 기존 PRODUCT 테이블

| ID | NAME | QUANTITY |
|---|---|---|
| 1 | 키보드 | 10 |
| 2 | 마우스 | 20 |

### MERGE 실행

```sql
MERGE INTO PRODUCT T
USING (
    SELECT 1 AS ID,
           '키보드' AS NAME,
           50 AS QUANTITY
    FROM DUAL
) S
ON (T.ID = S.ID)

WHEN MATCHED THEN
    UPDATE SET T.QUANTITY = S.QUANTITY

WHEN NOT MATCHED THEN
    INSERT (ID, NAME, QUANTITY)
    VALUES (S.ID, S.NAME, S.QUANTITY);
```

### 실행 결과

| ID | NAME | QUANTITY |
|---|---|---|
| 1 | 키보드 | 50 |
| 2 | 마우스 | 20 |

`ID = 1`인 데이터가 이미 존재하기 때문에 `WHEN MATCHED THEN` 조건이 실행된다.

따라서 키보드의 `QUANTITY`가 `10`에서 `50`으로 변경된다.

## 4. 핵심 정리

`MERGE`는 `ON` 조건을 기준으로 대상 테이블과 원본 데이터를 비교하여 `UPDATE` 또는 `INSERT`를 수행하는 SQL 문법이다.

- `WHEN MATCHED THEN` → 기존 데이터 수정
- `WHEN NOT MATCHED THEN` → 새로운 데이터 추가

**즉, MERGE를 사용하면 기존 데이터의 존재 여부에 따라 INSERT와 UPDATE를 하나의 SQL 문으로 처리할 수 있다.**
