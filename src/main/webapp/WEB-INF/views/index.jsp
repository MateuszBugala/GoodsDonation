<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <title>Document</title>
    <%@ include file="dependecies.jsp" %>
</head>
<body>
<header class="header--main-page" id="start">


    <sec:authorize access="hasRole('ADMIN')">
        <%@ include file="adminHeader.jsp" %>
    </sec:authorize>

    <sec:authorize access="hasRole('USER')">
        <%@ include file="loggedHeader.jsp" %>
    </sec:authorize>

    <sec:authentication property="principal" var="principal"/>
    <c:if test="${principal == 'anonymousUser'}">
        <nav class="container container--70">
            <ul class="nav--actions">
                <li><a href="${pageContext.request.contextPath}/login" class="btn btn--small btn--without-border">Zaloguj</a>
                </li>
                <li><a href="${pageContext.request.contextPath}/users/add" class="btn btn--small btn--highlighted">Załóż
                    konto</a></li>
            </ul>

            <ul>
                <li><a href="${pageContext.request.contextPath}/#start" class="btn btn--without-border">Start</a>
                </li>
                <li><a href="${pageContext.request.contextPath}/#steps" class="btn btn--without-border">O co chodzi?</a>
                </li>
                <li><a href="${pageContext.request.contextPath}/#about-us" class="btn btn--without-border">O nas</a>
                </li>
                <li><a href="${pageContext.request.contextPath}/#help" class="btn btn--without-border">Fundacje i
                    organizacje</a></li>
                <li><a href="${pageContext.request.contextPath}/#contact" class="btn btn--without-border">Kontakt</a>
                </li>
            </ul>
        </nav>
    </c:if>

    <div class="slogan container container--90">
        <div class="slogan--item">
            <h1>
                Zacznij pomagać!<br/>
                Oddaj niechciane rzeczy w zaufane ręce
            </h1>

            <ul class="slogan--buttons">
                <li style="justify-content: center"><a href="${pageContext.request.contextPath}/login"
                                                       class="btn btn--large">Oddaj rzeczy</a></li>
                <%--<li><a href="#" class="btn btn--large">Zorganizuj zbiórkę</a></li>--%>
            </ul>
        </div>
    </div>
</header>


<section class="stats">
    <div class="container container--85">
        <div class="stats--item">
            <em>
                <c:if test="${empty qty}">Jeszcze 0</c:if>
                <c:if test="${not empty qty}">${qty}</c:if>
            </em>
            <h3>Oddanych worków</h3>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eius est beatae, quod accusamus illum
                tempora!</p>
        </div>

        <div class="stats--item">
            <em>
                <c:if test="${institutionsQty == 0}">Jeszcze 0</c:if>
                <c:if test="${institutionsQty > 0}">${institutionsQty}</c:if>
            </em>
            <h3>Wspartych organizacji</h3>
            <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Laboriosam magnam, sint nihil cupiditate quas
                quam.</p>
        </div>

        <div class="stats--item">
            <em>7</em>
            <h3>Zorganizowanych zbiórek</h3>
            <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Quos dolores commodi error. Natus, officiis
                vitae?</p>
        </div>
    </div>
</section>

<section class="steps" id="steps">
    <h2>Wystarczą 4 proste kroki</h2>

    <div class="steps--container">
        <div class="steps--item">
            <span class="icon icon--hands"></span>
            <h3>Wybierz rzeczy</h3>
            <p>ubrania, zabawki, sprzęt i inne</p>
        </div>
        <div class="steps--item">
            <span class="icon icon--arrow"></span>
            <h3>Spakuj je</h3>
            <p>skorzystaj z worków na śmieci</p>
        </div>
        <div class="steps--item">
            <span class="icon icon--glasses"></span>
            <h3>Zdecyduj komu chcesz pomóc</h3>
            <p>wybierz zaufane miejsce</p>
        </div>
        <div class="steps--item">
            <span class="icon icon--courier"></span>
            <h3>Zamów kuriera</h3>
            <p>kurier przyjedzie w dogodnym terminie</p>
        </div>
    </div>

    <a href="${pageContext.request.contextPath}/users/add" class="btn btn--large">Załóż konto</a>
</section>

<section class="about-us" id="about-us">
    <div class="about-us--text">
        <h2>O nas</h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptas vitae animi rem pariatur incidunt libero
            optio esse quisquam illo omnis.</p>
        <img src="images/signature.svg" class="about-us--text-signature" alt="Signature"/>
    </div>
    <div class="about-us--image"><img src="images/about-us.jpg" alt="People in circle"/></div>
</section>

<section class="help" id="help">
    <h2>Komu pomagamy?</h2>

    <ul class="help--buttons">
        <li data-id="1"><a href="#" class="btn btn--without-border active">Fundacjom</a></li>
        <li data-id="2"><a href="#" class="btn btn--without-border">Organizacjom pozarządowym</a></li>
        <li data-id="3"><a href="#" class="btn btn--without-border">Lokalnym zbiórkom</a></li>
    </ul>

    <!-- SLIDE 1 -->
    <div class="help--slides active" data-id="1">
        <p>W naszej bazie znajdziesz listę zweryfikowanych Fundacji, z którymi współpracujemy. Możesz sprawdzić czym się
            zajmują, komu pomagają i czego potrzebują.</p>

        <ul class="help--slides-items">
            <c:forEach items="${foundations}" var="foundation">
            <li>
                <div class="col">
                    <div class="title">${foundation.name}</div>
                    <div class="subtitle">Cel i misja: ${foundation.mission}</div>
                </div>

                <div class="col">
                    <div class="text">${foundation.needs}</div>
                </div>
            </li>
            </c:forEach>
        </ul>

        <ul class="help--slides-pagination">
            <li><a href="#" class="btn btn--small btn--without-border active" data-page="1">1</a></li>
            <li><a href="#" class="btn btn--small btn--without-border" data-page="2">2</a></li>
            <li><a href="#" class="btn btn--small btn--without-border" data-page="3">3</a></li>
        </ul>
    </div>

    <!-- SLIDE 2 -->
    <div class="help--slides" data-id="2">
        <p>
            Poniżej znajdzisz zweryfikowane organizacje pozarządowe, z którymi współpracujemy:
        </p>
        <ul class="help--slides-items">
            <c:forEach items="${ngos}" var="ngo">
                <li>
                    <div class="col">
                        <div class="title">${ngo.name}</div>
                        <div class="subtitle">Cel i misja: ${ngo.mission}</div>
                    </div>

                    <div class="col">
                        <div class="text">${ngo.needs}</div>
                    </div>
                </li>
            </c:forEach>


        </ul>

        <ul class="help--slides-pagination">
            <li><a href="#" class="btn btn--small btn--without-border active" data-page="1">1</a></li>
            <li><a href="#" class="btn btn--small btn--without-border" data-page="2">2</a></li>
            <li><a href="#" class="btn btn--small btn--without-border" data-page="3">3</a></li>
            <li><a href="#" class="btn btn--small btn--without-border" data-page="4">4</a></li>
            <li><a href="#" class="btn btn--small btn--without-border" data-page="5">5</a></li>
        </ul>
    </div>

    <!-- SLIDE 3 -->
    <div class="help--slides" data-id="3">
        <p>Lorem ipsum dolor sit amet, his ocurreret persequeris ea, ad utinam laudem duo. Verterem adipisci partiendo
            eos ne, ea his reque quaeque recteque, ne quo lobortis intellegam.</p>
        <ul class="help--slides-items">
            <li>
                <div class="col">
                    <div class="title">Lokalna zbiórka 1</div>
                    <div class="subtitle">Lorem ipsum dolor sit amet consectetur.</div>
                </div>

                <div class="col">
                    <div class="text">Lorem ipsum dolor sit amet consectetur adipisicing elit.</div>
                </div>
            </li>

            <li>
                <div class="col">
                    <div class="title">Lokalna zbiórka 2</div>
                    <div class="subtitle">Lorem ipsum dolor sit amet consectetur.</div>
                </div>

                <div class="col">
                    <div class="text">Lorem ipsum dolor sit amet consectetur adipisicing elit.</div>
                </div>
            </li>
        </ul>

        <ul class="help--slides-pagination">
            <li><a href="#" class="btn btn--small btn--without-border active" data-page="1">1</a></li>
            <li><a href="#" class="btn btn--small btn--without-border" data-page="2">2</a></li>
        </ul>
    </div>
</section>

<div id="contact">
    <%@ include file="footer.jsp" %>
</div>

<script src="js/app.js"></script>
</body>
</html>
