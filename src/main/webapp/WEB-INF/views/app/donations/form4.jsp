<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
            <p data-step="4" class="active">
                Na podstawie Twoich kryteriów oraz rzeczy, które masz do oddania
                wybraliśmy organizacje, którym możesz pomóc. Wybierz jedną, do
                której trafi Twoja przesyłka.
            </p>
        </div>
    </div>

    <div class="form--steps-container">
        <div class="form--steps-counter">Krok <span>4</span>/5</div>

        <form method="post">
            <!-- STEP 4 -->
            <div data-step="4" class="active">
                <h3>Wybierz organizacje, której chcesz pomóc:</h3>

                <div class="form-group form-group--checkbox">
                    <label>
                        <input type="radio" name="organization" value="old"/>
                        <span class="checkbox radio"></span>
                        <span class="description">
                  <div class="title">Fundacja “Bez domu”</div>
                  <div class="subtitle">
                    Cel i misja: Pomoc dla osób nie posiadających miejsca
                    zamieszkania
                  </div>
                </span>
                    </label>
                </div>

                <div class="form-group form-group--checkbox">
                    <label>
                        <input type="radio" name="organization" value="old"/>
                        <span class="checkbox radio"></span>
                        <span class="description">
                  <div class="title">Fundacja “Dla dzieci"</div>
                  <div class="subtitle">
                    Cel i misja: Pomoc osobom znajdującym się w trudnej sytuacji
                    życiowej.
                  </div>
                </span>
                    </label>
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

</body>
</html>
