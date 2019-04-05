<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="pl">
<head>
    <title>Document</title>
    <%@ include file="../../dependecies.jsp" %>
</head>
<body>
<%@ include file="../../loggedHeader.jsp" %>

<section class="login-page">
    <h2>Moje konto</h2>
    <c:if test="${not empty param.duplicatedemail}">
        <h3 style="color: indianred">Użytkownik z podanym adresem email już istnieje - użyj innego adresu</h3>
    </c:if>

    <form:form modelAttribute="user">
        <div class="form-group">
            <form:input type="email" path="email" placeholder="Email" readonly="true" style="max-width: 300px; background-color: #ebebeb"/>
        </div>

        <div class="form-group">
            <form:input path="name" placeholder="Imię" readonly="true"
                   style="max-width: 300px; background-color: #ebebeb"/>
        </div>

        <div class="form-group form-group--buttons">
            <button type="button" class="btn btn--without-border" onclick="history.back()">Wróć</button>
            <button type="button" class="btn"
                    onclick="location.href='${pageContext.request.contextPath}/users/edit/${user.id}'">Edytuj dane
            </button>
        </div>
    </form:form>
</section>

<%--<%@ include file="../../footer.jsp" %>--%>

</body>
</html>
