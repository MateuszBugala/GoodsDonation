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

            <p data-step="2"  class="active"> <br>
            <c:if test ="${not empty param.error}">
                <span style="color: darkred">Nie można usunąć - istnieją powiązane wpisy w bazie danych!</>
            </c:if>
            <c:if test ="${not empty param.deleted}">
                <span style="color: darkgreen">Pozycja usunięta pomyślnie</>
            </c:if>
            </p>
        </div>
    </div>

    <div class="form--steps-container">

        <table border="1">

            <thead>
            <th>LP</th>
            <th>ID</th>
            <th>Email</th>
            <th>Imię</th>
            <th>Aktywny</th>
            <th>Role</th>
            <th colspan="3">Actions</th>
            </thead>

            <tbody>
            <c:forEach items="${users}" var="user" varStatus="stat">
                <tr>
                    <td>${stat.index+1}</td>
                    <td>${user.id}</td>
                    <td>${user.email}</td>
                    <td>${user.name}</td>
                    <td>${user.enabled}</td>

                    <td style="max-width: 400px">
                        <c:forEach items="${user.roles}" var="roles">
                            ${roles.name}<br>
                        </c:forEach>
                    </td>

                    <td style=" text-align: center">
                        <a href="#" class="btn--small" style="color: blue; font-weight: bold">Zmień status</a>
                    </td>
                    <td style="width: 50px; text-align: center;">
                        <a href="/users/edit/${user.id}" class="btn--small" style="color: blue; font-weight: bold">Edytuj</a>
                    </td>
                    <td style="width: 50px; text-align: center">
                        <a href="/users/delete/${user.id}" class="btn--small" style="color: blue; font-weight: bold"
                           onclick="return confirm('Are you sure you want to delete this item?');" >Usuń</a>
                    </td>

                </tr>
            </c:forEach>
            </tbody>

        </table>




    </div>
</section>




</body>
</html>
