<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Homepage</title>
 <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f2f2;
            text-align: center;
            padding-top: 60px;
        }
        h2 {
            color: #333;
        }

        .menu {
            margin-top: 30px;
        }

        /* Style for menu items (buttons + dropdown) */
        /* Style for menu items (buttons + dropdown) */
 .menu a, 
 .menu select {
     display: block;
     width: 250px;
     margin: 10px auto;
     padding: 15px;
     background: #4CAF50;
     color: white;
     text-align: center;
     text-decoration: none;
     border-radius: 8px;
     font-size: 16px;
     border: none;
     cursor: pointer;
     -webkit-appearance: none;
     -moz-appearance: none;
     appearance: none;
     text-align: center;
     box-sizing: border-box; /* ensures consistent width */
 }
        

        .menu a:hover, .menu select:hover {
            background: #45a049;
        }

        

        /* Logout button style */
        .logout-btn {
            position: absolute;
            top: 20px;
            right: 20px;
            padding: 10px 20px;
            background: #e74c3c;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 14px;
            cursor: pointer;
            text-decoration: none;
        }

        .logout-btn:hover {
            background: #c0392b;
        }
    </style>

    <script>
        function redirectPage(page) {
            if (page) {
                window.location.href = page;
            }
        }
    </script>
</head>
<body>
    <!-- Logout Button -->
    <a href="login.jsp" class="logout-btn">Logout</a>

    <h2>Welcome, <%= session.getAttribute("username") %>!</h2>
    <p>Select an option below:</p>

    <div class="menu">
        <a href="createTr.jsp">Create Transaction</a>
        <a href="updateTr.jsp">Update Transaction</a>
        <a href="deleteTr.jsp">Delete Transaction</a>

        <!-- Dropdown styled same as other buttons -->
        <select id="viewOption" onchange="redirectPage(this.value)">
            <option value="">-- View Transactions --</option>
            <option value="MiniStatement">Last 10 Transactions</option>
            <option value="sixMonthStatement.jsp">Past 6 Months</option>
        </select>
    </div>
</body>
</html>
