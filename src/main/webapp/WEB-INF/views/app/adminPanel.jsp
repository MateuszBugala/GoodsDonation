<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="pl">
<head>
    <title>Document</title>
    <%@ include file="../dependecies.jsp" %>
</head>
<body>

<%@ include file="../adminHeader.jsp" %>

<section class="form--steps">
    <div class="form--steps-instructions">
        <div class="form--steps-container">
            <h3>Panel administratora</h3>

            <p data-step="2"  class="active"> Wybierz akcję z górnego menu</p>
        </div>
    </div>

    <div class="form--steps-container">
    </div>
</section>


</body>
</html>
