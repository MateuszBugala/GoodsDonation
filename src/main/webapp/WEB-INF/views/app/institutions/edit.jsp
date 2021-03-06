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
            <h3>Edytuj instytucję</h3>

            <p class="active">
                Wypełnij pola lub wybierz z listy:
            </p>

        </div>
    </div>

    <div class="form--steps-container">

        <form:form method="post" modelAttribute="institution" action="/institutions/edit">
            <form:hidden path="id"/>

            <div class="active">

                <div class="form-section form-section--columns">
                    <div class="form-section--column">

                        <c:forEach items="${institutionTypes}" var="institutionType">
                            <div class="form-group form-group--checkbox">
                                <label style="justify-content: unset;">
                                    <c:choose>
                                        <c:when test="${institutionType.id==institution.institutionType.id}">
                                            <form:radiobutton path="institutionType" value="${institutionType.id}" required="required"
                                                              checked="checked"/>
                                        </c:when>
                                        <c:otherwise>
                                            <form:radiobutton path="institutionType" value="${institutionType.id}" required="required"
                                            />
                                        </c:otherwise>

                                    </c:choose>

                                    <span class="checkbox radio"></span>
                                    <span class="description">
                            <div>${institutionType.name}</div>
                            </span>
                                </label>
                            </div>
                        </c:forEach>

                        <div class="form-group form-group--inline" style="margin-top: 15%">
                            <label> Nazwa
                                <form:input type="text" path="name"/>
                                <form:errors path="name" cssClass="" element="div"/>
                            </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                Misja
                                <form:textarea path="mission" rows="5"/>
                                <form:errors path="mission" element="div"/>

                            </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                Potrzeby
                                <form:textarea path="needs" rows="5" id="mission"/>
                                <form:errors path="needs" element="div"/>

                            </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label> Miasto
                                <form:select path="city">
                                    <form:option value="0" label="Wybierz"/><br>
                                    <form:options items="${cities}" itemLabel="name" itemValue="id"/><br>
                                </form:select><br>
                                <form:errors path="city" element="div"/>

                            </label>
                        </div>

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
