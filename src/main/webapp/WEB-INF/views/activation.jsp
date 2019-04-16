<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Aktywacja konta</title>
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
                <c:when test="${not empty param.active}">

                    <h3>Twoje konto zostało aktywowane pomyślnie</h3>
                    <p data-step="1"  class="active">Trwa przekierowanie do strony logowania...</p>

                    <script>
                        var timer = setTimeout(function() {
                            window.location = '${pageContext.request.contextPath}/login'
                        }, 5000);
                    </script>
                </c:when>

                <c:when test="${not empty param.sent}">

                    <h3>Przed zalogowaniem musisz aktywować konto</h3>
                    <p data-step="1"  class="active">Na podany adres wysłaliśmy link aktywacyjny</p>

                    <script>
                        var timer = setTimeout(function() {
                            window.location = '${pageContext.request.contextPath}/'
                        }, 8000);
                    </script>
                </c:when>
            </c:choose>
        </div>
    </div>

    <div class="form--steps-container">
    </div>
</section>

</body>
</html>
