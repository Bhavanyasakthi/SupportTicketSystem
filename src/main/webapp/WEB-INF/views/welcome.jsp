<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Welcome - Support Ticket System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fdf6f9; /* same as login */
            text-align: center;
            margin-top: 100px;
        }

        .box {
            background-color: #fff;
            padding: 40px;
            margin: auto;
            width: 350px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #7c3aed; /* violet */
        }

        .btn {
            display: block;
            margin: 15px auto;
            padding: 10px 25px;
            width: 80%;
            font-size: 16px;
            background-color: #ec4899; /* rose pink */
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #db2777;
        }
    </style>
</head>
<body>
    <div class="box">
        <h2>Welcome to Support Ticket System</h2>
        <form action="/admin" method="get">
            <button class="btn" type="submit">Admin Login</button>
        </form>
        <form action="/login" method="get">
            <button class="btn" type="submit">User Login</button>
        </form>
    </div>
</body>
</html>
