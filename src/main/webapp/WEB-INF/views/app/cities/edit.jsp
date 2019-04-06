<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="pl">
<head>
    <title>Document</title>
    <%@ include file="../../dependecies.jsp" %>
</head>
<body>

<%@ include file="../../adminHeader.jsp" %>

<section class="form--steps">
    <div class="form--steps-instructions">
        <div class="form--steps-container">
            <h3>Edytuj nazwę miasta</h3>

            <p class="active">
                <br>
            </p>

        </div>
    </div>

    <div class="form--steps-container">

        <form:form method="post" modelAttribute="city" action="/cities/edit">
            <form:hidden path="id"/>

            <div class="active">

                <div class="form-section form-section--columns">
                    <div class="form-section--column">

                        <div class="form-group form-group--inline">
                            <label> Nazwa miasta
                                <form:input type="text" path="name"/>
                                <form:errors path="name" cssClass="" element="div"/>
                            </label>
                        </div>

                    </div>

                    <div class="form-section--column">

                    </div>

                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step" onclick="history.back()">Wstecz</button>
                    <button type="submit" class="btn next-step">Zapisz zmiany</button>
                </div>
            </div>


        </form:form>
    </div>
</section>


</body>
</html>
