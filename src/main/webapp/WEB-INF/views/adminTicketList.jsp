<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>All Tickets - Admin Panel</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 40px;
            background-color: #fdf6f9;
            text-align: center;
        }
        table {
            width: 90%;
            margin: auto;
            border-collapse: collapse;
            background: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.05);
        }
        th, td {
            border: 1px solid #f3d6e4;
            padding: 12px;
        }
        th {
            background-color: #f3d6e4;
            color: #4b0082;
        }
        form {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
        }
        select {
            padding: 6px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }
        input[type="submit"] {
            padding: 6px 12px;
            background-color: #ec4899;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #db2777;
        }
        .logout-link {
            display: inline-block;
            margin-top: 30px;
            background-color: #7c3aed;
            color: white;
            padding: 10px 20px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
        }
        .logout-link:hover {
            background-color: #6d28d9;
        }
    </style>
</head>
<body>
    <h2 style="color: #7c3aed;">All Submitted Tickets</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Subject</th>
            <th>Description</th>
            <th>User</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        <c:forEach var="ticket" items="${tickets}">
            <tr>
                <td>${ticket.id}</td>
                <td>${ticket.subject}</td>
                <td>${ticket.description}</td>
                <td>${ticket.user.name}</td>
                <td>${ticket.status}</td>
                <td>
                    <form action="/admin/tickets/update" method="post">
                        <input type="hidden" name="ticketId" value="${ticket.id}" />
                        <select name="status">
                            <option ${ticket.status == 'Open' ? 'selected' : ''}>Open</option>
                            <option ${ticket.status == 'In Progress' ? 'selected' : ''}>In Progress</option>
                            <option ${ticket.status == 'Resolved' ? 'selected' : ''}>Resolved</option>
                        </select>
                        <input type="submit" value="Update"/>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>

    <!-- Logout button at the bottom -->
    <a class="logout-link" href="/">Logout</a>
</body>
</html>
