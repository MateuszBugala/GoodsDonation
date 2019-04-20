<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lista wiadomości</title>
    <%@ include file="../../dependecies.jsp" %>
</head>
<body>

<%@ include file="../../adminHeader.jsp" %>

<section class="form--steps">
    <div class="form--steps-instructions">
        <div class="form--steps-container">
            <h3 style="display: inline">Lista wiadomości z formularza kontaktowego</h3>

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


        <table border="1" style="background-color: #fff">

            <thead>
            <th>LP</th>
            <th>ID</th>
            <th>Imię użytkownika</th>
            <th>Email użytkownika</th>
            <th style="width: 80%">Treść wiadomości</th>
            <th colspan="1">Akcje</th>
            </thead>

            <tbody>
            <c:forEach items="${messages}" var="message" varStatus="stat">
                <tr>
                    <td>${stat.index+1}</td>
                    <td>${message.id}</td>
                    <td>${message.name}</td>
                    <td>${message.email}</td>
                    <td>${message.messageText}</td>

                    <td style="width: 50px; text-align: center">
                        <a href="/messages/delete/${message.id}" class="btn--small" style="color: blue; font-weight: bold"
                           onclick="return confirm('Czy na pewno usunąć pozycję?');">Usuń</a>
                    </td>

                </tr>
            </c:forEach>
            </tbody>

        </table>

    </div>
</section>


</body>
</html>
