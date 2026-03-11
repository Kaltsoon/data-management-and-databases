# Logical database design exercises

> [!IMPORTANT]
> Write your answers to a Word document named `ld_exercises_YOURFAMILYNAME.docx` and submit the document to Moodle.

The objective of this exercise is to familiarize yourself with the basics of logical design, have hands-on practising in primary key and foreign key considerations, and learn to derive relations for simple ER diagrams. Refer to this week's lesson slides as materials.

In this exercise set, we work with natural primary keys only. In all tasks, show your answers as relation schemas as below:

<pre>
Department (<ins>deptno</ins>, deptname)

Employee (<ins>empno</ins>, familyname, givenname, deptno)
    FK (deptno) REFERENCES Department (deptno)
</pre>

Remember to **underline primary keys** and write a **foreign key definition for each foreign key (below the relation schema)**.

## Task 1: Warm-up

![ER diagram](./assets/ld-task-1.png)

Which one of the below reflects correctly the ER diagram above?

### a.

<pre>
Machine (<ins>serialnumber</ins>, model, factoryname)
    FK (factoryname) REFERENCES Factory (factoryname)
Factory (<ins>factoryname</ins>, email)
</pre>

### b.

<pre>
Machine (<ins>serialnumber</ins>, model)
Factory (<ins>factoryname</ins>, email)
</pre>

### c.

<pre>
Machine (<ins>serialnumber</ins>, model, factoryname)
Factory (<ins>factoryname</ins>, email, serialnumber)
    FK (serialnumber) REFERENCES Machine (serialnumber)
</pre>

### d.

<pre>
Machine (<ins>serialnumber</ins>, model)
Factory (<ins>factoryname</ins>, email, serialnumber)
    FK (serialnumber) REFERENCES Machine (serialnumber)
</pre>

## Task 2: Warm-up drills with simple diagrams

Translate the ER diagrams below to relation schemas. **Underline primary keys** and write a **foreign key definition for each foreign key (below the relation schema)**.

### a.

![ER diagram](./assets/ld-task-2-a.png)

### b.

![ER diagram](./assets/ld-task-2-b.png)

### c.

![ER diagram](./assets/ld-task-2-c.png)

### d.

![ER diagram](./assets/ld-task-2-d.png)

### e.

![ER diagram](./assets/ld-task-2-d.png)

## Task 3: Translating ER diagrams to relation schemas

Translate the ER diagrams below to relation schemas. **Underline primary keys** and write a **foreign key definition for each foreign key (below the relation schema)**.

### a.

![ER diagram](./assets/ld-task-3-a.png)

### b.

![ER diagram](./assets/ld-task-3-b.png)

### c.

![ER diagram](./assets/ld-task-3-c.png)

## 4. Boat Crews

Derive relations from the ER diagram below.

![ER diagram](./assets/ld-task-4.png)

> [!NOTE]
> We do this as a simple practice. That is, derive the relations straightforwardly without thinking any further practical business issues. You do not have to worry about the 'XOR' thing.

> [!TIP]
> The name of the primary key in the parent table and the name of the foreign key in the child table can be different. The foreign key definition "binds" a foreign key to a primary key.

## 5. University

Derive relations from the ER diagram below.

![ER diagram](./assets/ld-task-5.png)

> [!NOTE] 
> We do this as a simple practice. That is, derive the relations straightforwardly without thinking any further practical issues.
