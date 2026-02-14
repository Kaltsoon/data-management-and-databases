# SQL Exercises 4: Set operations

> [!IMPORTANT]
> Create a Word document named `sql-exercises-4-YOURFAMILYNAME.docx`. For all the SQL queries, please copy and paste both **the SQL statement and the result (e.g., as a [screenshot](https://www.take-a-screenshot.org/))** into your Word document. Do not worry about formatting. Finally, submit the Word document to Moodle.

> [!NOTE]
> You'll need to use the set operations in these tasks: `EXCEPT`, `INTERSECT`, or `UNION`.

## 1.

List teachers' and students' surnames. Show the result as a single list.

<details>

<summary>Expected result table</summary>

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

<summary>Expected result table</summary>

| city |
|----------|
| Helsinki |

(1 row(s) affected)

</details>

## 3.

List such cities where there is a campus and no student is living in the city.

<details>

<summary>Expected result table</summary>

| city |
|----------|
| Porvoo |
| Vierumäki |

(2 row(s) affected)

</details>

## 4.

List such years when at least one teacher was born OR at least one student was born. Display the result in descending order.

<details>

<summary>Expected result table</summary>

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

<summary>Expected result table</summary>

| Year |
|------|
| 1977 |
| 1985 |

(2 row(s) affected)

</details>

## 6.

List such years when at least one teacher was born AND no student was born.

<details>

<summary>Expected result table</summary>

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

<summary>Expected result table</summary>

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
