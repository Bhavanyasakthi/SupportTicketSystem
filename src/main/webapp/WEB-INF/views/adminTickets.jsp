
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Admin - Ticket Management</title>
    <style>
        table {
            margin: auto;
            border-collapse: collapse;
            width: 80%;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
        }
        select, input[type="submit"] {
            padding: 5px;
        }
    </style>
</head>
<body>
    <h2 align="center">All Submitted Tickets</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th><th>Subject</th><th>Description</th><th>User</th><th>Status</th><th>Action</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="ticket" items="${tickets}">
            <tr>
                <td>${ticket.id}</td>
                <td>${ticket.subject}</td>
                <td>${ticket.description}</td>
                <td>${ticket.user.name}</td>
                <td>
                    <form method="post" action="/admin/update-status">
                        <input type="hidden" name="ticketId" value="${ticket.id}" />
                        <select name="status">
                            <option ${ticket.status == 'Open' ? 'selected' : ''}>Open</option>
                            <option ${ticket.status == 'In Progress' ? 'selected' : ''}>In Progress</option>
                            <option ${ticket.status == 'Closed' ? 'selected' : ''}>Closed</option>
                        </select>
                        <input type="submit" value="Update" />
                    </form>
                </td>
                <td>${ticket.status}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</body>
</html>
    