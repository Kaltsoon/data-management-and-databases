# Takkula Database Diagram

```mermaid
erDiagram

    Campus {
        CHAR(4) campus_code PK
        VARCHAR(10) campus_name
        VARCHAR(20) street
        CHAR(5) postcode
        VARCHAR(10) city
    }

    Student {
        CHAR(4) student_number PK
        VARCHAR(8) first_name
        VARCHAR(8) surname
        DATE birth_date
        CHAR(1) gender
        VARCHAR(20) email
        VARCHAR(20) street
        CHAR(5) postcode
        VARCHAR(10) city
    }

    Teacher {
        CHAR(4) teacher_number PK
        VARCHAR(8) first_name
        VARCHAR(8) surname
        DATE birth_date
        CHAR(1) gender
        DECIMAL salary
        VARCHAR(50) email
        VARCHAR(10) phone
        CHAR(4) campus_code FK
    }

    AcademicAdvisor {
        CHAR(4) teacher_number PK, FK
        CHAR(4) campus_code PK, FK
        DATE start_date PK
        DATE end_date
    }

    Course {
        CHAR(4) course_code PK
        VARCHAR(20) course_name
        SMALLINT credits
        CHAR(4) person_in_charge FK
    }

    Prerequisite {
        CHAR(4) course_code PK, FK
        CHAR(4) prerequisite_code PK, FK
    }

    CourseInstance {
        CHAR(4) course_code PK, FK
        SMALLINT instance_number PK
        DATE start_date
        DATE end_date
        SMALLINT participants
        CHAR(4) teacher_number FK
    }

    CourseGrade {
        CHAR(4) student_number PK, FK
        CHAR(4) course_code PK, FK
        SMALLINT instance_number PK, FK
        SMALLINT grade
        DATE grade_date
        CHAR(4) examiner FK
    }

    MisconductType {
        CHAR(4) misconduct_code PK
        VARCHAR(120) description
    }

    SanctionType {
        CHAR(4) sanction_code PK
        VARCHAR(20) description
        VARCHAR(30) decision_maker
    }

    MisconductIncident {
        CHAR(4) student_number PK, FK
        CHAR(4) misconduct_code PK, FK
        CHAR(4) course_code PK, FK
        SMALLINT instance_number PK, FK
        CHAR(4) sanction_code FK
        DATE decision_date
    }

    Campus ||--o{ Teacher : employs
    Campus ||--o{ AcademicAdvisor : has

    Teacher ||--o{ AcademicAdvisor : advisor
    Teacher ||--o{ Course : "person in charge"
    Teacher ||--o{ CourseInstance : teaches
    Teacher ||--o{ CourseGrade : examines

    Course ||--o{ CourseInstance : has
    Course ||--o{ Prerequisite : requires
    Course ||--o{ Prerequisite : prerequisite_of

    CourseInstance ||--o{ CourseGrade : produces
    Student ||--o{ CourseGrade : receives

    CourseInstance ||--o{ MisconductIncident : occurs_in
    Student ||--o{ MisconductIncident : involved_in
    MisconductType ||--o{ MisconductIncident : type
    SanctionType ||--o{ MisconductIncident : sanction
```
