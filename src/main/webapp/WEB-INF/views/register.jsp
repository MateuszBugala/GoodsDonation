<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="pl">
<head>
    <title>Document</title>
    <%@ include file="dependecies.jsp" %>
</head>
<body>
<header>
    <nav class="container container--70">
        <ul class="nav--actions">
            <li><a href="${pageContext.request.contextPath}/login" class="btn btn--small btn--without-border">Zaloguj</a></li>
            <li><a href="${pageContext.request.contextPath}/users/add" class="btn btn--small btn--highlighted">Załóż konto</a></li>
        </ul>

        <ul>
            <li><a href="${pageContext.request.contextPath}/#start" class="btn btn--without-border">Start</a></li>
            <li><a href="${pageContext.request.contextPath}/#steps" class="btn btn--without-border">O co chodzi?</a></li>
            <li><a href="${pageContext.request.contextPath}/#about-us" class="btn btn--without-border">O nas</a></li>
            <li><a href="${pageContext.request.contextPath}/#help" class="btn btn--without-border">Fundacje i organizacje</a></li>
            <li><a href="${pageContext.request.contextPath}/#contact" class="btn btn--without-border">Kontakt</a></li>
        </ul>
    </nav>
</header>

<section class="login-page">
    <h2>Załóż konto</h2>
    <c:if test="${not empty param.duplicatedemail}">
        <h3 style="color: indianred">Użytkownik z podanym adresem email już istnieje - użyj innego adresu</h3>
    </c:if>

    <form:form method="post" modelAttribute="user">
        <div class="form-group">
            <form:input type="email" path="email" placeholder="Email"/>
            <form:errors path="email" cssClass="" element="div"/>
        </div>

        <div class="form-group">
            <form:input path="name" placeholder="Imię"/>
            <form:errors path="name" cssClass="" element="div"/>
        </div>

        <div class="form-group">
            <form:input type="password" path="password" placeholder="Hasło"/>
            <form:errors path="password" cssClass="" element="div"/>
        </div>


        <%--<div class="form-group">--%>
        <%--<input type="password" name="password2" placeholder="Powtórz hasło"/>--%>
        <%--</div>--%>

        <div class="form-group form-group--buttons">
            <a href="login.html" class="btn btn--without-border">Zaloguj się</a>
            <button class="btn" type="submit">Załóż konto</button>
        </div>
    </form:form>

</section>

<%@ include file="footer.jsp" %>

</body>
</html>
