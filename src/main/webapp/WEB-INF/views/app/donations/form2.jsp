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

            <p data-step="2"  class="active">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>

        </div>
    </div>

    <div class="form--steps-container">
        <div class="form--steps-counter">Krok <span>2</span>/5</div>

        <form method="post">

            <!-- STEP 2 -->
            <div data-step="2" class="active">
                <h3>Podaj liczbę 60l worków, w które spakowałeś/aś rzeczy:</h3>

                <div class="form-group form-group--inline">
                    <label>
                        Liczba 60l worków:
                        <input type="number" name="bagsQty" value="1" step="1" required min="1"/>
                    </label>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step" onclick="history.back()">Wstecz</button>
                    <button type="submit" class="btn next-step" >Dalej</button>
                </div>
            </div>


        </form>
    </div>
</section>

<%@ include file="../../footer.jsp" %>

</body>
</html>
