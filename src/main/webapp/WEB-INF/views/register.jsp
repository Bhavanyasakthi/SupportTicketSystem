
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Register</title>
    <style>
        body {
            background-color: #fdf6f9;
            font-family: Arial;
            text-align: center;
            margin-top: 100px;
        }
        .register-box {
            background: white;
            width: 300px;
            margin: auto;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        input[type="text"], input[type="email"], input[type="password"] {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 6px;
            border: 1px solid #ccc;
        }
        input[type="submit"] {
            width: 95%;
            padding: 10px;
            background-color: #7c3aed;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
        }
        .success { color: green; }
        .error { color: red; }
    </style>
</head>
<body>
<div class="register-box">
    <h2>Register</h2>
    <form action="/register" method="post">
        <input type="text" name="name" placeholder="Full Name" required /><br/>
        <input type="email" name="email" placeholder="Email" required /><br/>
        <input type="password" name="password" placeholder="Password" required /><br/>
        <input type="submit" value="Register" />
    </form>

    <c:if test="${not empty message}">
        <p class="${status}">${message}</p>
    </c:if>

    <p>Already have an account? <a href="/login">Login</a></p>
</div>
</body>
</html>
    