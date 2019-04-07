<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
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
            <h3 style="display: inline">Lista darowizn</h3>

            <p data-step="2" class="active"><br>

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


        <table border="1">

            <thead>
            <th>LP</th>
            <th>Numer</th>
            <security:authorize access="hasRole('ADMIN')">
                <th>Użytkownik</th>
            </security:authorize>
            <th>Dla instytucji</th>
            <th>Odebrane</th>
            <th>Data odebrania</th>
            <th>Przekazane</th>
            <th>Data przekazania</th>
            <th>Data utworzenia darowizny</th>
            <th colspan="2">Akcje</th>
            </thead>

            <tbody>
            <c:forEach items="${donations}" var="donation" varStatus="stat">
                <tr>
                    <td>${stat.index+1}</td>
                    <td>${donation.id}</td>

                    <security:authorize access="hasRole('ADMIN')">
                        <td>${donation.user.name}</td>
                    </security:authorize>

                    <td>${donation.institution.name}</td>

                    <td><c:if test="${donation.pickedUp == false}">nie</c:if>
                        <c:if test="${donation.pickedUp == true}">tak</c:if>
                    </td>

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

                    <td><c:if test="${donation.donated == false}">nie</c:if>
                        <c:if test="${donation.donated == true}">tak</c:if>
                    </td>

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

                    <td>${donation.creationTime}</td>

                    <td style="width: 50px; text-align: center;">
                        <a href="/donations/details/${donation.id}" class="btn--small"
                           style="color: blue; font-weight: bold">Szczegóły</a>
                    </td>

                </tr>
            </c:forEach>
            </tbody>

        </table>

        <div style="display: block">

            <button type="button" class="btn"
                    style="display: inline; margin-left: 10%"
                    onclick="location.href='${pageContext.request.contextPath}/dashboard'" type="button">
                Dodaj nową darowiznę
            </button>
        </div>

    </div>
</section>


</body>
</html>
