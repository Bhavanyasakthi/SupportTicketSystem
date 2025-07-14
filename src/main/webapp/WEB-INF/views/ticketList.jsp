<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>My Tickets</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fdf6f9;
            text-align: center;
            padding: 40px;
        }
        table {
            margin: auto;
            width: 90%;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 12px 20px;
            border: 1px solid #f3d6e4;
        }
        th {
            background-color: #f3d6e4;
            color: #333;
        }
        h2 {
            color: #7c3aed;
        }
        a {
            color: #ec4899;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        .back-link {
            margin-top: 20px;
            display: block;
        }
        .delete-link {
            color: #dc2626;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h2>Your Submitted Tickets</h2>

    <c:if test="${empty tickets}">
        <p>No tickets found.</p>
    </c:if>

    <c:if test="${not empty tickets}">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Subject</th>
                    <th>Description</th>
                    <th>Status</th>
                    <th>Action</th> <!-- New column -->
                </tr>
            </thead>
            <tbody>
                <c:forEach var="ticket" items="${tickets}">
                    <tr>
                        <td>${ticket.id}</td>
                        <td>${ticket.subject}</td>
                        <td>${ticket.description}</td>
                        <td>${ticket.status}</td>
                        <td>
                            <a class="delete-link" href="/ticket/delete/${ticket.id}" 
                               onclick="return confirm('Are you sure you want to delete this ticket?');">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

    <a class="back-link" href="/home">← Back to Home</a>
</body>
</html>

    