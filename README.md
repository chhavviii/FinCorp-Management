# FinCorp-Management
A full-stack Java web application designed to manage hospital financial operations efficiently. The system offers features such as generating mini bank statements, viewing six-month financial summaries with date filters, and maintaining secure account management for hospital transactions — all built on the MVC architecture.

---

## ✨ Features

- **User Authentication:** Secure login and session management for users and admins.  
- **Account Management:** Add, update, and view hospital account details.  
- **Mini Statement Generation:** Generate short-term transaction statements for quick insights.  
- **Six-Month Statement Filtering:** View and filter six-month bank statements by custom date range.  
- **CRUD Operations:** Create, read, update, and delete transaction or account data.  
- **MVC Pattern:** Structured project using Servlets (Controller), JSP (View), and JDBC (Model/Database Layer).  

---

## 🛠️ Technologies Used

- **Java 8+**  
- **JSP & Servlets**  
- **JDBC**  
- **MySQL**  
- **HTML5 / CSS3**  
- **Apache Tomcat 8+**  
- **MVC Architecture**

---

## 🚦 Requirements

- Java JDK 8 or newer  
- Apache Tomcat 8.x or newer  
- MySQL Database Server  
- MySQL Connector/J (JDBC driver)  
- IDE (Eclipse, IntelliJ IDEA, or NetBeans)

---

## 🚀 Setup & Installation

1. **Clone this repository**
    ```bash
    git clone https://github.com/chhavviii/FinCorp-Management.git
    ```

2. **Database Setup**
    - Create a MySQL database (e.g., `BFSI`).
    - Create necessary tables using your SQL schema file.

3. **Configure Database Connection**
    - Update your MySQL credentials in `FincorpServlet.java`:
      ```java
      private static final String DB_URL = "jdbc:mysql://localhost:3306/BFSI";
      private static final String DB_USER = "root";
      private static final String DB_PASS = "password";
      ```

4. **Import Project into IDE**
    - Open your IDE and import this as a **Dynamic Web Project**.
    - Verify folder structure (`src/` and `WebContent/` or `src/main/webapp`).

5. **Deploy to Tomcat**
    - Build the project and deploy it to your Apache Tomcat server.

6. **Run the Application**
    - **Login Page:**  
      [http://localhost:8585/FINCORP-MANAGEMENT-H/login.jsp](http://localhost:8585/FINCORP-MANAGMENT-H/login.jsp)
    - **Dashboard / Statements:**  
      [http://localhost:8585/FINCORP-MANAGEMENT-H/dashboard.jsp?](http://localhost:8585/FINCORP-MANAGMENT-H/dashboard.jsp?)

---

## 🗂️ Included Files & Folders

## Project Structure Overview

- **src/main/java/com/STM/FincorpServlet.java** – Handles Fincorp-specific servlet actions.
- **src/main/java/com/STM/LoginServlet.java** – Manages the user login process.
- **src/main/java/com/STM/MiniStatementServlet.java** – Serves mini statement transaction data.
- **src/main/java/com/STM/SixMonthStatementServlet.java** – Provides six-month transaction statements.

- **src/main/java/com/example/utils/Bank.java** – Data model for bank branch and transaction info.
- **src/main/java/com/example/utils/DBConnection.java** – Utility for creating MySQL database connections.
- **src/main/java/com/example/utils/UserDAOlogin.java** – Contains logic for validating user credentials.
- **src/main/webapp/META-INF/** – Application metadata and deployment configuration folder.
- **src/main/webapp/WEB-INF/TableStyle.css** – CSS for table and UI styling.
- **src/main/webapp/WEB-INF/miniStatement2.jsp** – Shows a mini account statement.
- **src/main/webapp/WEB-INF/sixMonthStatement.jsp** – Displays six-month statement results.
- **/db/**
    - `schema.sql` — SQL script to create and initialize database tables  

---

## 🧩 MVC Architecture Overview

- **Model:** JavaBeans and DAO classes that handle data logic and database operations.  
- **View:** JSP pages used for displaying dynamic content to users.  
- **Controller:** Servlets that manage user requests and control application flow.  

---

## 📈 Future Enhancements

- Add patient billing and invoice generation module.  
- Integrate chart-based financial analytics.  
- Add role-based access control for admins and accountants.  



