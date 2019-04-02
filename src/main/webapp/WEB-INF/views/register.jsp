<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Users - add</title>
</head>

<body>
<button onclick="location.href='http://localhost:8080/'" type="button">HOME</button>

<h1>Add a user:</h1>

<form:form method="post" modelAttribute="user">
    <table>
        <tr>
            <td>Email:</td>
            <td><form:input type="email" path="email" cssStyle="width: 230px"/><br></td>
            <td><form:errors path="email" cssClass="error-message" element="div"/></td>
        </tr>

        <tr>
            <td>Imię:</td>
            <td><form:input path="name" cssStyle="width: 230px"/><br></td>
            <td><form:errors path="name" cssClass="error-message" element="div"/></td>
        </tr>

        <tr>
            <td>Hasło:</td>
            <td><form:input type="password" path="password" cssStyle="width: 230px"/><br></td>
            <td><form:errors path="password" cssClass="error-message" element="div"/></td>
        </tr>
    </table>

    <input type="submit" value="Send" style="margin-top: 30px">

</form:form>


</body>
</html>
