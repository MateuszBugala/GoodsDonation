<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Users - list</title>
</head>
<body>

<button onclick="location.href='http://localhost:8080/'" type="button">HOME</button>

<h3>Users list:</h3>

<table border="1">

    <thead>
    <th>LP</th>
    <th>Email</th>
    <th>Enabled</th>
    <th>Role</th>
    <th colspan="2">Actions</th>
    </thead>

    <tbody>
    <c:forEach items="${users}" var="user" varStatus="stat">
        <tr>
            <td>${stat.index+1}</td>
            <td>${user.email}</td>
            <td>${user.enabled}</td>

            <td style="max-width: 400px">
                <c:forEach items="${user.roles}" var="roles">
                    ${roles.name}<br>
                </c:forEach>
            </td>

            <td style="width: 50px; text-align: center"><a href="/users/edit/${user.id}" >Edit</a></td>
            <td style="width: 50px; text-align: center"><a href="/users/delete/${user.id}" onclick="return confirm('Are you sure you want to delete this item?');" >Delete</a></td>
        </tr>
    </c:forEach>
    </tbody>

</table>

<c:if test ="${not empty param.error}">
    <h4 style="color: red"><span>Item cannot be deleted - it has some records in database</span></h4>
</c:if>
<c:if test ="${not empty param.deleted}">
    <h4 style="color: red"><span>Item has been deleted</span></h4>
</c:if>

</body>
</html>
