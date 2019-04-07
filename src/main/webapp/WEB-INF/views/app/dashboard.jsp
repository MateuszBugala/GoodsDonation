<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html lang="pl">
<head>
    <title>Document</title>
    <%@ include file="../dependecies.jsp" %>
</head>
<body>


<header class="header--form-page">
    <security:authorize access="hasRole('ADMIN')">
        <%@ include file="../adminHeader.jsp" %>
    </security:authorize>

    <security:authorize access="hasRole('USER')">
        <%@ include file="../loggedHeader.jsp" %>
    </security:authorize>

    <div class="slogan container container--90">
        <div class="slogan--item">
            <h1>
                Oddaj rzeczy, których już nie chcesz<br/>
                <span class="uppercase">potrzebującym</span>
            </h1>

            <div class="slogan--steps">
                <div class="slogan--steps-title">Wystarczą 4 proste kroki:</div>
                <ul class="slogan--steps-boxes">
                    <li>
                        <div><em>1</em><span>Wybierz rzeczy</span></div>
                    </li>
                    <li>
                        <div><em>2</em><span>Spakuj je w worki</span></div>
                    </li>
                    <li>
                        <div><em>3</em><span>Wybierz fundację</span></div>
                    </li>
                    <li>
                        <div><em>4</em><span>Zamów kuriera</span></div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</header>

<section class="form--steps">
    <div class="form--steps-instructions">
        <div class="form--steps-container">
            <h3>Ważne!</h3>
            <p data-step="1" class="active">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
        </div>
    </div>

    <div class="form--steps-container">
        <div class="form--steps-counter">Krok <span>1</span>/5</div>

        <form method="post" action="donations/step-1">
            <!-- STEP 1: class .active is switching steps -->
            <div data-step="1" class="active">
                <h3>Zaznacz co chcesz oddać:</h3>
                <p>(minimum jedno pole)</p>

                <c:forEach items="${donatedItems}" var="item" varStatus="status">
                    <div class="form-group form-group--checkbox">
                        <label>
                            <input type="checkbox" name="donatedItems[]" value="${item.id}" required class='acb'
                                    <c:forEach items="${donationTemp.donatedItems}" var="sessionItem">
                                        <c:if test="${item.id==sessionItem.id}"> checked </c:if>
                                    </c:forEach>
                            />
                            <span class="checkbox"></span>
                            <span class="description">${item.name}</span>
                        </label>
                    </div>
                </c:forEach>

                <div class="form-group form-group--buttons">
                    <button type="submit" class="btn next-step">Dalej</button>
                </div>
            </div>
        </form>
    </div>
</section>


<%@ include file="../footer.jsp" %>

<script type="text/javascript">

    function deRequireChbx(elClass) {
        el=document.getElementsByClassName(elClass);

        var atLeastOneChecked=false;
        for (i=0; i<el.length; i++) {
            if (el[i].checked === true) {
                atLeastOneChecked=true;
            }
        }

        if (atLeastOneChecked === true) {
            for (i=0; i<el.length; i++) {
                el[i].required = false;
            }
        } /*else {
            for (i=0; i<el.length; i++) {
                el[i].required = true;
            }
        }*/
    }

    var button = document.querySelector('button[type="submit"]');
    button.addEventListener('click', function () {
        deRequireChbx("acb");
    });

</script>

</body>
</html>
