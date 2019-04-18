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

<section class="login-page" style="text-align: center">

    <c:choose>
        <c:when test="${not empty param.sent}">
            <h2 style="font-size: 2.5rem">Jeśli podany adres email był w naszej bazie, wysłaliśmy tam link do zmiany hasła</h2>
        </c:when>

        <c:otherwise>
            <h2>Podaj email podany przy rejestracji konta</h2>
            <form method="post">
                <div class="form-group">
                    <input type="email" name="email" placeholder="Email"  style="max-width: 300px"/>
                </div>

                <div class="form-group form-group--buttons" style="display: inline-block">
                    <button class="btn" type="submit">Resetuj hasło</button>
                </div>
            </form>
        </c:otherwise>

    </c:choose>

</section>


</body>
</html>

