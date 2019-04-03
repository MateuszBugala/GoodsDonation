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

<%@ include file="../../loggedHeader.jsp" %>

<section class="form--steps">
    <div class="form--steps-instructions">
        <div class="form--steps-container">
            <h3>Ważne!</h3>

            <p data-step="3" class="active">
            Możesz filtrować organizacje po ich lokalizacji
            </p>
        </div>
    </div>

    <div class="form--steps-container">
        <div class="form--steps-counter">Krok <span>3</span>/5</div>

        <form method="post">

            <!-- STEP 3 -->
            <div data-step="3" class="active">
                <h3>Wybierz lokalizację organizacji, której chcesz pomóc:</h3>

                <div class="form-group form-group--dropdown">
                    <select name="selCity">
                        <option value="0">Cała Polska</option>
                        <c:forEach items="${cities}" var="city">
                            <option value="${city.id}" <c:if test="${city.id==selCity}"> selected </c:if> >${city.name}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step" onclick="history.back()">Wstecz</button>
                    <button type="submit" class="btn next-step">Szukaj</button>
                </div>
            </div>

        </form>
    </div>
</section>

<%@ include file="../../footer.jsp" %>

</body>
</html>
