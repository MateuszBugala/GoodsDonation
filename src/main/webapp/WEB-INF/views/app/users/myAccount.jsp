<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="pl">
<head>
    <title>Document</title>
    <%@ include file="../../dependecies.jsp" %>
</head>
<body>

<security:authorize access="hasRole('ADMIN')">
    <%@ include file="../../adminHeader.jsp" %>
</security:authorize>

<security:authorize access="hasRole('USER')">
    <%@ include file="../../loggedHeader.jsp" %>
</security:authorize>


<section class="login-page" style="text-align: center">
    <h2>Moje konto</h2>
    <c:if test="${not empty param.changed}">
        <h3 style="color: forestgreen; font-size: 2.5rem">Hasło zmieniono pomyślnie</h3>
    </c:if>
    <c:if test="${not empty param.duplicatedemail}">
        <h3 style="color: indianred; font-size: 2.5rem">Użytkownik z podanym adresem email już istnieje - użyj innego adresu</h3>
    </c:if>

    <form:form modelAttribute="user">
        <div class="form-group">
            <form:input type="email" path="email" placeholder="Email" readonly="true" style="max-width: 300px; background-color: #ebebeb"/>
        </div>

        <div class="form-group">
            <form:input path="name" placeholder="Imię" readonly="true"
                   style="max-width: 300px; background-color: #ebebeb"/>
        </div>

        <div class="form-group form-group--buttons" style="display: inline-block">
            <button type="button" class="btn btn--without-border" onclick="history.back()">Wróć</button>
            <button type="button" class="btn"
                    onclick="location.href='${pageContext.request.contextPath}/users/edit'">Edytuj dane
            </button>
        </div>

        <div class="form-group">
            <a href="${pageContext.request.contextPath}/users/change-password"
               class="btn btn--small btn--without-border">Zmień hasło</a>
        </div>
    </form:form>
</section>

</body>
</html>
