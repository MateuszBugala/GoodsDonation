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


<section class="login-page">
    <h2>Edytuj dane</h2>
    <c:if test="${not empty param.duplicatedemail}">
        <h3 style="color: indianred">Użytkownik z podanym adresem email już istnieje - użyj innego adresu</h3>
    </c:if>

    <form:form method="post" modelAttribute="user" action="/users/edit">
        <form:hidden path="id"/>

        <div class="form-group">
            <form:input type="email" path="email" placeholder="Email" readonly="true" style="max-width: 300px; background-color: #ebebeb"/>
            <form:errors path="email" cssClass="" element="div"/>
        </div>

        <div class="form-group">
            <form:input path="name" placeholder="Imię"  style="max-width: 300px"/>
            <form:errors path="name" cssClass="" element="div"/>
        </div>


        <div class="form-group form-group--buttons">
            <button type="button" class="btn btn--without-border" onclick="history.back()">Wróć</button>
            <button class="btn" type="submit">Zmień dane</button>
        </div>
    </form:form>

</section>

<%--<%@ include file="../../footer.jsp" %>--%>

</body>
</html>
