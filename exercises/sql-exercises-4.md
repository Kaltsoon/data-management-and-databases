# SQL Exercises 4: Set operations

> [!IMPORTANT]
> Write your SQL queries in SQL Server Management Studio and include the task numbers as comments to your query window as follows:
>
> ```sql
> -- 1
> SELECT ...
> -- 2
> SELECT ...
> ```
>
> In Moodle, submit a `sql_exercises_4_YOURFAMILYNAME.docx` document containing the **SQL query and a [screenshot](https://www.take-a-screenshot.org/) of the result table in each task**.

> [!NOTE]
> You'll need to use the set operations in these tasks: `EXCEPT`, `INTERSECT`, or `UNION`.

## 1.

List teachers' and students' surnames. Show the result as a single list.

<details>

<summary>Expected result table (click to open)</summary>

| surname |
|---------|
| Huhta |
| Hullerus |
| Kaarlo |
| Keto |
| Kiisseli |
| Kokki |
| Kuikka |
| Käki |
| Laine |
| Leino |
| Liimatta |
| Matikka |
| Ponteva |
| Rentukka |
| Saari |
| Tahko |
| Vainio |
| Veto |
| Virta |
| Vuori |

(20 row(s) affected)

</details>

## 2.

List such cities where there is a campus and at least one student is living in the city.

<details>

<summary>Expected result table (click to open)</summary>

| city |
|----------|
| Helsinki |

(1 row(s) affected)

</details>

## 3.

List such cities where there is a campus and no student is living in the city.

<details>

<summary>Expected result table (click to open)</summary>

| city |
|----------|
| Porvoo |
| Vierumäki |

(2 row(s) affected)

</details>

## 4.

List such years when at least one teacher was born OR at least one student was born. Display the result in descending order.

<details>

<summary>Expected result table (click to open)</summary>

| Year |
|------|
| 1986 |
| 1985 |
| 1984 |
| 1981 |
| 1980 |
| 1978 |
| 1977 |
| 1975 |
| 1970 |
| 1969 |
| 1967 |
| 1965 |
| 1960 |
| 1950 |
| 1948 |

(15 row(s) affected)

</details>

## 5.

List such years when at least one teacher was born AND at least one student was born.

<details>

<summary>Expected result table (click to open)</summary>

| Year |
|------|
| 1977 |
| 1985 |

(2 row(s) affected)

</details>

## 6.

List such years when at least one teacher was born AND no student was born.

<details>

<summary>Expected result table (click to open)</summary>

| Year |
|------|
| 1948 |
| 1950 |
| 1960 |
| 1965 |
| 1970 |
| 1975 |

(6 row(s) affected)

</details>

## 7.

List such years when at least one student was born AND no teacher was born. Display the result in descending order.

<details>

<summary>Expected result table (click to open)</summary>

| Year |
|------|
| 1986 |
| 1984 |
| 1981 |
| 1980 |
| 1978 |
| 1969 |
| 1967 |

(7 row(s) affected)

</details>
