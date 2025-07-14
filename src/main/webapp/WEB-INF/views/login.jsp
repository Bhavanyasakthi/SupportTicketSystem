<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fdf6f9;
            text-align: center;
            margin-top: 100px;
        }
        .login-box {
            background: white;
            width: 300px;
            margin: auto;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        input[type="email"], input[type="password"] {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #f3d6e4;
            border-radius: 6px;
        }
        input[type="submit"] {
            padding: 10px 20px;
            background-color: #ec4899;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            width: 95%;
            font-weight: bold;
        }
        input[type="submit"]:hover {
            background-color: #db2777;
        }
        .error {
            color: #dc2626;
            font-size: 13px;
            margin: 10px 0;
        }
        a {
            color: #7c3aed;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-box">
        <h2 style="color: #7c3aed;">Login</h2>
        <form action="/login" method="post">
            <input type="email" name="email" placeholder="Email" required /><br/>
            <input type="password" name="password" placeholder="Password" required /><br/>
            <input type="submit" value="Login"/>
        </form>

        <c:if test="${not empty error}">
            <p class="error">${error}</p>
        </c:if>

        <p>Don't have an account? <a href="/register">Register</a></p>
    </div>
</body>
</html>
