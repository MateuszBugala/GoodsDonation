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
                Jeśli wiesz komu chcesz pomóc, możesz wpisać nazwę tej organizacji w
                wyszukiwarce. Możesz też filtrować organizacje po ich lokalizacji
                bądź celu ich pomocy.
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
                        <option value="0"> - Miasto... - </option>
                        <c:forEach items="${cities}" var="city">
                            <option value="${city.id}">${city.name}</option>
                        </c:forEach>

                    <%--<option value="0">- wybierz -</option>--%>
                        <%--<option value="warsaw">Warszawa</option>--%>
                        <%--<option value="wroclaw">Wrocław</option>--%>
                        <%--<option value="poznan">Poznań</option>--%>
                        <%--<option value="gdansk">Gdańsk</option>--%>
                    </select>
                </div>

                <%--<div class="form-section">--%>
                    <%--<h4>Komu chcesz pomóc?</h4>--%>
                    <%--<div class="form-section--checkboxes">--%>
                        <%--<div class="form-group form-group--checkbox">--%>
                            <%--<label>--%>
                                <%--<input type="checkbox" name="help[]" value="children"/>--%>
                                <%--<span class="checkbox">dzieciom</span>--%>
                            <%--</label>--%>
                        <%--</div>--%>

                        <%--<div class="form-group form-group--checkbox">--%>
                            <%--<label>--%>
                                <%--<input type="checkbox" name="help[]" value="mothers"/>--%>
                                <%--<span class="checkbox">samotnym matkom</span>--%>
                            <%--</label>--%>
                        <%--</div>--%>

                        <%--<div class="form-group form-group--checkbox">--%>
                            <%--<label>--%>
                                <%--<input type="checkbox" name="help[]" value="homeless"/>--%>
                                <%--<span class="checkbox">bezdomnym</span>--%>
                            <%--</label>--%>
                        <%--</div>--%>

                        <%--<div class="form-group form-group--checkbox">--%>
                            <%--<label>--%>
                                <%--<input type="checkbox" name="help[]" value="disabled"/>--%>
                                <%--<span class="checkbox">niepełnosprawnym</span>--%>
                            <%--</label>--%>
                        <%--</div>--%>

                        <%--<div class="form-group form-group--checkbox">--%>
                            <%--<label>--%>
                                <%--<input type="checkbox" name="help[]" value="old"/>--%>
                                <%--<span class="checkbox">osobom starszym</span>--%>
                            <%--</label>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>

                <%--<div class="form-section">--%>
                    <%--<h4>Wpisz nazwę konkretnej organizacji (opcjonalnie)</h4>--%>
                    <%--<div class="form-group">--%>
                        <%--<textarea rows="4" name="organization_search"></textarea>--%>
                    <%--</div>--%>
                <%--</div>--%>

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
