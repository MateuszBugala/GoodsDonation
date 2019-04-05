<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <title>Document</title>
    <%@ include file="dependecies.jsp" %>
</head>
<body>
<header>
    <nav class="container container--70">
        <ul class="nav--actions">
            <li><a href="${pageContext.request.contextPath}/login" class="btn btn--small btn--highlighted">Zaloguj</a></li>
            <li><a href="${pageContext.request.contextPath}/users/add" class="btn btn--small btn--without-border">Załóż konto</a></li>
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
    <h2>Zaloguj się</h2>
    <c:if test="${not empty param.error}">
        <span style="color: darkred">Błędny email lub hasło</>
    </c:if>

    <form:form method="post" modelAttribute="user" action="/login">
        <div class="form-group">
            <form:input type="email" path="email" placeholder="Email"  style="max-width: 300px"/>
            <form:errors path="email" cssClass="" element="div"/>
        </div>

        <div class="form-group">
            <form:input type="password" path="password" placeholder="Hasło"  style="max-width: 300px"/>
            <form:errors path="password" cssClass="" element="div"/>

            <a href="#" class="btn btn--small btn--without-border reset-password">Przypomnij hasło</a>
        </div>

        <div class="form-group form-group--buttons">
            <a href="#" class="btn btn--without-border">Załóż konto</a>
            <button class="btn" type="submit">Zaloguj się</button>
        </div>
    </form:form>


</section>

<%@ include file="footer.jsp" %>

</body>
</html>

