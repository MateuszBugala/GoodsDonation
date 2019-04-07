<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
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

<section class="form--steps">
    <div class="form--steps-instructions">
        <div class="form--steps-container">
        </div>
    </div>

    <div class="form--steps-container">

        <form>
            <!-- STEP 7 -->
            <div data-step="7" class="active">
                <h2>
                    Dziękujemy za przesłanie formularza <br> Na adres email prześlemy wszelkie
                    informacje o odbiorze.
                </h2>
            </div>
        </form>
    </div>
</section>

<%@ include file="../../footer.jsp" %>

</body>
</html>
