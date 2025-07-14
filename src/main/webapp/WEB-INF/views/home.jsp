<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>

<html>
<head>
    <title>Home - Support Ticket</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fdf6f9; /* same as login page */
            margin: 0;
            padding: 0;
            text-align: center;
        }

        .container {
            margin-top: 100px;
        }

        .box {
            display: inline-block;
            background-color: #ffffff;
            padding: 30px 50px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #7c3aed; /* violet */
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            margin: 15px;
            background-color: #ec4899; /* rose pink */
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #db2777;
        }

        .welcome {
            color: #374151;
            font-size: 18px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="box">
            <h2>Welcome to Support Ticket System</h2>
            <p class="welcome">Hello, <strong>${loggedUser.name}</strong>!</p>

            <a class="btn" href="/create-ticket">Create Ticket</a>
            <a class="btn" href="/tickets">My Tickets</a>
            <a class="btn" href="/">Logout</a>
        </div>
    </div>
</body>
</html>
