Hotel (hotelNumber, hotelName, city)
Room (roomNumber, hotelNumber, roomType, price)
Booking (hotelNumber, roomNumber, customerNumber, startDate)
Customer (customerNumber, customerName, homeAddress, phone, email)

---

| hotelNumber | hotelName           | city     |
| ----------- | ------------------- | -------- |
| 1           | Grand Central Hotel | Helsinki |
| 2           | Riverside Hotel     | Tampere  |
| 3           | Seaside Inn         | Turku    |


| roomNumber | hotelNumber | roomType | price  |
| ---------- | ----------- | -------- | ------ |
| 1          | 1           | Single   | 89.00  |
| 2          | 1           | Double   | 129.00 |
| 1          | 2           | Suite    | 199.00 |


| hotelNumber | roomNumber | customerNumber | startDate  |
| ----------- | ---------- | -------------- | ---------- |
| 1           | 1          | 1              | 2026-09-05 |
| 1           | 2          | 2              | 2026-09-10 |
| 2           | 1          | 3              | 2026-09-15 |


| customerNumber | customerName  | homeAddress                         | phone            | email                                             |
| -------------- | ------------- | ----------------------------------- | ---------------- | ------------------------------------------------- |
| 1              | Alice Johnson | Mannerheimintie 25, 00100, Helsinki | +358 40 123 4567 | [alice@example.com](mailto:alice@example.com)     |
| 2              | Bob Smith     | Hämeenkatu 18, 33100, Tampere      | +358 50 234 5678 | [bob@example.com](mailto:bob@example.com)         |
| 3              | Charlie Brown | Aurakatu 12, 20100, Turku           | +358 44 345 6789 | [charlie@example.com](mailto:charlie@example.com) |
