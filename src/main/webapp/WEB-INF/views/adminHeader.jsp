<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header style="margin-bottom: 10px">
    <nav class="container container--70">
        <ul class="nav--actions">
            <li class="logged-user">
                <sec:authentication property="principal" var="principal"/>
                Witaj ${principal.user.name}
                <ul class="dropdown">
                    <li><a href="${pageContext.request.contextPath}/users/profile/${principal.user.id}">Mój profil</a></li>
                    <li><a href="#">Moje darowizny</a></li>
                    <li><a href="http://localhost:8080/logout">Wyloguj</a></li>
                </ul>
            </li>
        </ul>

        <ul>
            <li><a href="${pageContext.request.contextPath}/#start" class="btn btn--without-border active">Start</a></li>
            <li><a href="${pageContext.request.contextPath}/admin"class="btn btn--without-border">Panel administratora</a></li>
            <li><a href="${pageContext.request.contextPath}/users/all" class="btn btn--without-border">Użytkownicy</a></li>
            <li><a href="${pageContext.request.contextPath}/" class="btn btn--without-border">Zaufane instytucje</a></li>
        </ul>
    </nav>
</header>