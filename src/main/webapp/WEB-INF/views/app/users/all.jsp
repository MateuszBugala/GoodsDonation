<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Users - list</title>
    <%@ include file="../../dependecies.jsp" %>
</head>
<body>

<%@ include file="../../adminHeader.jsp" %>

<section class="form--steps">
    <div class="form--steps-instructions">
        <div class="form--steps-container">
            <h3>Lista użytkowników</h3>

            <p data-step="2"  class="active"> <br> </p>
        </div>
    </div>

    <div class="form--steps-container">

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

                    <td style="width: 50px; text-align: center;">
                        <a href="/users/edit/${user.id}" class="btn--small" style="color: blue; font-weight: bold">Edit</a>
                    </td>
                    <td style="width: 50px; text-align: center">
                        <a href="/users/delete/${user.id}" class="btn--small" style="color: blue; font-weight: bold"
                           onclick="return confirm('Are you sure you want to delete this item?');" >Delete</a>
                    </td>
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


    </div>
</section>




</body>
</html>
