<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header style="margin-bottom: 10px">
    <nav class="container container--70">
        <ul class="nav--actions">
            <li class="logged-user">
                <sec:authentication property="principal" var="principal"/>
                Witaj ${principal.user.name}
                <%--za pomocą kontrolera--%>
                <%--Witaj ${currentUser.name}--%>
                <ul class="dropdown">
                    <li><a href="${pageContext.request.contextPath}/users/profile">Mój profil</a></li>
                    <li><a href="${pageContext.request.contextPath}/donations/my-donations">Moje darowizny</a></li>
                    <li><a href="${pageContext.request.contextPath}/logout">Wyloguj</a></li>
                </ul>
            </li>
        </ul>

        <ul>
            <li><a href="${pageContext.request.contextPath}/#start" class="btn btn--without-border active">Start</a></li>
            <li><a href="${pageContext.request.contextPath}/#steps" class="btn btn--without-border">O co chodzi?</a></li>
            <li><a href="${pageContext.request.contextPath}/#about-us" class="btn btn--without-border">O nas</a></li>
            <li><a href="${pageContext.request.contextPath}/#help" class="btn btn--without-border">Fundacje i organizacje</a></li>
            <li><a href="${pageContext.request.contextPath}/#contact" class="btn btn--without-border">Kontakt</a></li>
        </ul>
    </nav>
</header>