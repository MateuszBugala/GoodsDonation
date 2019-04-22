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
            <h3 style="display: inline">Lista użytkowników</h3>
            <%--<button type="button" class="btn btn--without-border active"--%>
                    <%--style="display: inline; margin-left: 10%"--%>
                    <%--onclick="location.href='${pageContext.request.contextPath}/users/add'" type="button">Dodaj--%>
                <%--użytkownika--%>
            <%--</button>--%>

            <p data-step="2" class="active"> <br>
                <c:if test="${not empty param.error}">
                    <span style="color: darkred">Nie można usunąć - istnieją powiązane wpisy w bazie danych!</span>
                </c:if>
                <c:if test="${not empty param.deleted}">
                    <span style="color: darkgreen">Pozycja usunięta pomyślnie</span>
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
            <th>Konto aktywowane</th>
            <th>Zablokowany</th>
            <th>Rola</th>
            <th colspan="3">Akcje</th>
            </thead>

            <tbody>
            <c:forEach items="${users}" var="user" varStatus="stat">
                <tr>
                    <td>${stat.index+1}</td>
                    <td>${user.id}</td>
                    <td>${user.email}</td>
                    <td>${user.name}</td>
                    <td><c:if test="${user.activated == false}">nie</c:if>
                        <c:if test="${user.activated == true}">tak</c:if>
                    </td>
                    <td><c:if test="${user.enabled == 0}">tak</c:if>
                        <c:if test="${user.enabled == 1}">nie</c:if>
                    </td>

                    <td style="max-width: 400px">
                        <c:forEach items="${user.roles}" var="roles">
                            ${roles.name}<br>
                        </c:forEach>
                    </td>

                    <td style=" text-align: center">
                        <a href="/users/status/${user.id}" class="btn--small" style="color: blue; font-weight: bold">Zmień
                            blokadę</a>
                    </td>
                    <td style="width: 50px; text-align: center;">
                        <a href="/users/edit?id=${user.id}" class="btn--small" style="color: blue; font-weight: bold">Edytuj</a>
                    </td>
                    <td style="width: 50px; text-align: center">
                        <a href="/users/delete/${user.id}" class="btn--small" style="color: blue; font-weight: bold"
                           onclick="return confirm('Are you sure you want to delete this item?');">Usuń</a>
                    </td>

                </tr>
            </c:forEach>
            </tbody>

        </table>

        <div style="display: block">

            <button type="button" class="btn "
                    style="display: inline; margin-left: 10%"
                    onclick="location.href='${pageContext.request.contextPath}/users/add'" type="button">
                Dodaj nowego użytkownika
            </button>
        </div>

        <div style="display: block">

            <button type="button" class="btn "
                    style="display: inline; margin-left: 10%"
                    onclick="location.href='${pageContext.request.contextPath}/users/add-admin'" type="button">
                Dodaj nowego administratora
            </button>
        </div>

    </div>
</section>


</body>
</html>
