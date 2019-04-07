<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Darowizy</title>
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
            <h3 style="display: inline">Darowizna nr ${donation.id}</h3>

            <button type="button" class="btn active"
                    style="display: inline; margin-left: 10%"
                    onclick="history.back()">Wstecz
            </button>

            <p data-step="2" class="active">

                <c:if test="${not empty param.error}">
                    <span style="color: darkred">Nie można usunąć - istnieją powiązane wpisy w bazie danych!</span>
                </c:if>
                <c:if test="${not empty param.deleted}">
                    <span style="color: darkgreen">Pozycja usunięta pomyślnie</span>
                </c:if>
            </p>
        </div>
    </div>


    <div class="form--steps-container">


        <table border="1" class="vertical">
            <tbody>
            <tr>
                <th style="text-align: left">Numer</th>
                <td>${donation.id}</td>
            </tr>
            <tr>
                <th>Użytkownik</th>
                <td>${donation.user.name}</td>
            </tr>
            <tr>
                <th>Darowizna</th>
                <td>
                    <c:forEach items="${donation.donatedItems}" var="items">
                        ${items.name}<br>
                    </c:forEach>
                </td>
            </tr>
            <tr>
                <th>Ilość</th>
                <td>${donation.qty}</td>
            </tr>
            <tr>
                <th>Dla instytucji</th>
                <td>${donation.institution.name}</td>
            </tr>
            <tr>
                <th colspan="2" style="text-align: center"> Dane do odbioru:</th>
            </tr>
            <tr>
                <th>Ulica</th>
                <td>${donation.pickUpstreet}</td>
            </tr>
            <tr>
                <th>Miasto</th>
                <td>${donation.pickUpcity}</td>
            </tr>
            <tr>
                <th>Kod pocztowy</th>
                <td>${donation.pickUpzip}</td>
            </tr>
            <tr>
                <th>Nr telefonu</th>
                <td>${donation.pickUpphoneNumber}</td>
            </tr>
            <tr>
                <th>Planowana data odbioru</th>
                <td>${donation.pickUpDate}</td>
            </tr>
            <tr>
                <th>Planowana godzina odbioru</th>
                <td>${donation.pickUpTime}</td>
            </tr>
            <tr>
                <th>Uwagi</th>
                <td>${donation.pickUpRemarks}</td>
            </tr>
            <tr>
                <th colspan="2" style="text-align: center"> Status:</th>
            </tr>
            <tr>
                <th>Odebrane</th>
                <td>
                    <c:if test="${donation.pickedUp == false}">nie
                        <security:authorize access="hasRole('ADMIN')">
                        <span style="margin-left: 5%">
                            <form method="post" action="/donations/picked-up" style="display: inline">
                                <input type="hidden" name="donationId" value="${donation.id}"/>
                                <input type="date" name="data" required min="2019-01-01" style="display: inline"/>

                                <button type="submit" style="display: inline">Zmień na odebrane</button>
                            </form>
                        </span>
                        </security:authorize>
                    </c:if>
                    <c:if test="${donation.pickedUp == true}">tak</c:if>
                </td>
            </tr>
            <tr>
                <th>Data odebrania</th>
                <td>
                    <c:choose>
                        <c:when test="${empty donation.actualPickUpDate}">
                            ---
                        </c:when>
                        <c:otherwise>
                            ${donation.actualPickUpDate}
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
            <tr>
                <th>Przekazane instytucji</th>
                <td><c:if test="${donation.donated == false}">nie
                    <c:if test="${donation.pickedUp == true}">
                    <security:authorize access="hasRole('ADMIN')">
                    <span style="margin-left: 5%">
                        <form method="post" action="/donations/received" style="display: inline">
                            <input type="hidden" name="donationId" value="${donation.id}"/>
                            <input type="date" name="data" required min="2019-01-01" style="display: inline"/>

                            <button type="submit" style="display: inline">Zmień na przekazane</button>
                        </form>
                    </span>
                    </security:authorize>
                    </c:if>
                </c:if>
                    <c:if test="${donation.donated == true}">tak</c:if>
                </td>
            </tr>
            <tr>
                <th>Data przekazania</th>
                <td>
                    <c:choose>
                        <c:when test="${empty donation.donationDate}">
                            ---
                        </c:when>
                        <c:otherwise>
                            ${donation.donationDate}
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
            <tr>
                <th>Data utworzenia darowizny</th>
                <td>${donation.creationTime}</td>
            </tr>

            </tbody>

        </table>

        <security:authorize access="hasRole('ADMIN')">
            <div style="display: block">
                <button class="btn" style="display: inline; margin-left: 10%">
                    <a href="/donations/delete/${donation.id}"
                       onclick="return confirm('Czy na pewno usunąć pozycję?')">Usuń
                    </a>
                </button>
            </div>
        </security:authorize>

        <%--<security:authorize access="hasRole('USER')">--%>
        <%--<div style="display: block">--%>
        <%--<button type="button" class="btn "--%>
        <%--style="display: inline; margin-left: 10%"--%>
        <%--onclick="location.href='${pageContext.request.contextPath}/donations/edit/${donation.id}'">--%>
        <%--Edytuj--%>
        <%--</button>--%>
        <%--</div>--%>
        <%--</security:authorize>--%>

    </div>
</section>


</body>
</html>
