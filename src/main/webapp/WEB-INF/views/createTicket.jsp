
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Create Ticket</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fdf6f9; /* soft pink */
            margin: 0;
            padding: 0;
            text-align: center;
        }

        .ticket-box {
            background-color: white;
            width: 400px;
            margin: 100px auto;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #7c3aed; /* violet */
            margin-bottom: 20px;
        }

        input[type="text"],
        textarea {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #f3d6e4;
            border-radius: 6px;
            font-size: 14px;
        }

        textarea {
            height: 100px;
            resize: vertical;
        }

        input[type="submit"] {
            width: 95%;
            padding: 12px;
            background-color: #ec4899; /* rose pink */
            color: white;
            border: none;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #db2777;
        }

        a {
            display: inline-block;
            margin-top: 15px;
            color: #7c3aed; /* violet */
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="ticket-box">
        <h2>Create a Support Ticket</h2>
        <form action="/create-ticket" method="post">
            <input type="text" name="subject" placeholder="Subject" required /><br/>
            <textarea name="description" placeholder="Description" required></textarea><br/>
            <input type="submit" value="Submit Ticket" />
        </form>
        <a href="/tickets">View My Tickets</a>
    </div>
</body>
</html>
