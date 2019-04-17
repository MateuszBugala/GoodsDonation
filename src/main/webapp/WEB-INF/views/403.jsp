<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Problem z dostępem</title>
    <%@ include file="dependecies.jsp" %>
</head>
<body>

<header >

        <nav class="container container--70">
            <ul class="nav--actions">
                <li><a href="${pageContext.request.contextPath}/login" class="btn btn--small btn--without-border">Zaloguj</a>
                </li>
                <li><a href="${pageContext.request.contextPath}/users/add" class="btn btn--small btn--highlighted">Załóż
                    konto</a></li>
            </ul>

            <ul>
                <li><a href="${pageContext.request.contextPath}/#start" class="btn btn--without-border">Start</a>
                </li>
                <li><a href="${pageContext.request.contextPath}/#steps" class="btn btn--without-border">O co chodzi?</a>
                </li>
                <li><a href="${pageContext.request.contextPath}/#about-us" class="btn btn--without-border">O nas</a>
                </li>
                <li><a href="${pageContext.request.contextPath}/#help" class="btn btn--without-border">Fundacje i
                    organizacje</a></li>
                <li><a href="${pageContext.request.contextPath}/#contact" class="btn btn--without-border">Kontakt</a>
                </li>
            </ul>
        </nav>

</header>

<section class="form--steps">
    <div class="form--steps-instructions">
        <div class="form--steps-container">

<c:choose>
    <c:when test="${not empty param.activated}">
        <h3>Twoje konto nie zostało jeszcze aktywowane</h3>
        <p data-step="1"  class="active">Sprawdź adres email podany przy logowaniu i kliknij w link aktywacyjny</p>
    </c:when>

    <c:when test="${not empty param.expired}">
        <h3>Link aktywacyjny już wygasł</h3>
        <p data-step="1"  class="active">Wygeneruj nowy link aktywacyjny i spróbuj jeszcze raz</p>
    </c:when>

    <c:otherwise>
        <h3>Niestety nie masz dostępu do tej strony</h3>
        <p data-step="1"  class="active">Jeśli uważasz, że to błąd, napisz: admin@admin.pl</p>
    </c:otherwise>

</c:choose>
        </div>
    </div>

    <div class="form--steps-container">
    </div>
</section>

</body>
</html>
