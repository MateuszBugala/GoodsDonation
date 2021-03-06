<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lista instytucji</title>
    <%@ include file="../../dependecies.jsp" %>
</head>
<body>

<%@ include file="../../adminHeader.jsp" %>

<section class="form--steps">
    <div class="form--steps-instructions">
        <div class="form--steps-container">
            <h3 style="display: inline">Lista miast</h3>

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
            <th>Nazwa</th>
            <th colspan="2">Akcje</th>
            </thead>

            <tbody>
            <c:forEach items="${cities}" var="city" varStatus="stat">
                <tr>
                    <td>${stat.index+1}</td>
                    <td>${city.id}</td>
                    <td>${city.name}</td>

                    <td style="width: 50px; text-align: center;">
                        <a href="/cities/edit/${city.id}" class="btn--small" style="color: blue; font-weight: bold">Edytuj</a>
                    </td>
                    <td style="width: 50px; text-align: center">
                        <a href="/cities/delete/${city.id}" class="btn--small" style="color: blue; font-weight: bold"
                           onclick="return confirm('Czy na pewno usunąć pozycję?');">Usuń</a>
                    </td>

                </tr>
            </c:forEach>
            </tbody>

        </table>

        <div style="display: block">

            <button type="button" class="btn "
                    style="display: inline; margin-left: 10%"
                    onclick="location.href='${pageContext.request.contextPath}/cities/add'" type="button">
                Dodaj nowe miasto
            </button>
        </div>

    </div>
</section>


</body>
</html>
