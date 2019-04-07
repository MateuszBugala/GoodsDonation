<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <form method="post">
            <!-- STEP 6 -->
            <div data-step="6" class="active">
                <h3>Podsumowanie Twojej darowizny</h3>

                <div class="summary">
                    <div class="form-section">
                        <h4>Oddajesz:</h4>
                        <ul>
                            <li>
                                <span class="icon icon-bag"></span>
                                <span class="summary--text">Co:
                                <c:forEach items="${donationTemp.donatedItems}" var="items">
                                    ${items.name};
                                </c:forEach>
                                    <br>Worków: ${donationTemp.qty}</span>
                            </li>

                            <li>
                                <span class="icon icon-hand"></span>
                                <span class="summary--text"
                                >Dla fundacji "${donationTemp.institution.name}" z miasta ${donationTemp.institution.city.name}</span
                                >
                            </li>
                        </ul>
                    </div>

                    <div class="form-section form-section--columns">
                        <div class="form-section--column">
                            <h4>Adres odbioru:</h4>
                            <ul>
                                <li>${donationTemp.pickUpstreet}</li>
                                <li>${donationTemp.pickUpcity}</li>
                                <li>${donationTemp.pickUpzip}</li>
                                <li>${donationTemp.pickUpphoneNumber}</li>
                            </ul>
                        </div>

                        <div class="form-section--column">
                            <h4>Termin odbioru:</h4>
                            <ul>
                                <li>${donationTemp.pickUpDate}</li>
                                <li>${donationTemp.pickUpTime}</li>
                                <li>Uwagi: ${donationTemp.pickUpRemarks}</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step" onclick="history.back()">Wstecz</button>
                    <button type="submit" class="btn">Potwierdzam</button>
                </div>
            </div>

        </form>
    </div>
</section>

<%@ include file="../../footer.jsp" %>

</body>
</html>
