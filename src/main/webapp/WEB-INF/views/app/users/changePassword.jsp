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
    <h2>Zmień hasło</h2>
    <c:if test="${not empty param.incorrect}">
        <h3 style="color: indianred; font-size: 2.5rem">Dotychczasowe hasło jest nieprawidłowe</h3>
    </c:if>

    <form method="post">

        <div class="form-group">
            <input type="password" name="oldPassword" placeholder="Dotychczasowe hasło" required style="max-width: 300px"/>
        </div>

        <div class="form-group">
            <input type="password" name="newPassword" placeholder="Nowe hasło" required style="max-width: 300px"/>
        </div>


        <div class="form-group form-group--buttons" style="display: inline-block">
            <button type="button" class="btn btn--without-border" onclick="history.back()">Wróć</button>
            <button type="submit" class="btn">Zmień hasło
            </button>
        </div>

    </form>
</section>

</body>
</html>
