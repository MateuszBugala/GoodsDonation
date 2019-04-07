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
            <h3>Ważne!</h3>
            <p data-step="5" class="active">Podaj adres oraz termin odbioru rzeczy.</p>
        </div>
    </div>

    <div class="form--steps-container">
        <div class="form--steps-counter">Krok <span>5</span>/5</div>

        <form method="post">
            <!-- STEP 5 -->
            <div data-step="5" class="active">
                <h3>Podaj adres oraz termin odbioru rzeczy przez kuriera:</h3>

                <div class="form-section form-section--columns">
                    <div class="form-section--column">
                        <h4>Adres odbioru</h4>
                        <div class="form-group form-group--inline">
                            <label> Ulica <input type="text" name="address" value="${donationTemp.pickUpstreet}" required/>
                            </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label> Miasto <input type="text" name="city" value="${donationTemp.pickUpcity}" required/>
                            </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                Kod pocztowy <input type="text" name="postcode" value="${donationTemp.pickUpzip}" required
                                                    pattern="\d{2}-\d{3}" placeholder="xx-xxx"/>
                            </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                Numer telefonu <input type="tel" name="phone" value="${donationTemp.pickUpphoneNumber}"
                                                      required pattern="\d{9}" placeholder="123456789"/>
                            </label>
                        </div>
                    </div>

                    <div class="form-section--column">
                        <h4>Termin odbioru</h4>
                        <div class="form-group form-group--inline">
                            <label> Data <input type="date" name="data" value="${donationTemp.pickUpDate}" required
                                                min="2019-01-01"/> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label> Godzina <input type="time" name="time" value="${donationTemp.pickUpTime}" min="09:00"
                                                   max="18:00" required/> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                Uwagi dla kuriera
                                <textarea name="remarks" rows="5">${donationTemp.pickUpRemarks}</textarea>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step" onclick="history.back()">Wstecz</button>
                    <button type="submit" class="btn next-step">Dalej</button>
                </div>
            </div>

        </form>
    </div>
</section>

<%@ include file="../../footer.jsp" %>

<script>
    <%--date must by later min 1 day in future--%>
    var today = new Date();
    today.setDate(today.getDate() + 1);
    var tomorrow = today.toISOString().split('T')[0]
    document.getElementsByName("data")[0].setAttribute('min', tomorrow);

</script>

</body>
</html>
