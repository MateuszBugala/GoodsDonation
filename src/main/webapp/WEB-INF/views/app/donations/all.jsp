<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Donations - list</title>
</head>
<body>

<button onclick="location.href='http://localhost:8080/'" type="button">HOME</button>

<h3>Donations list:</h3>

<table border="1">

    <thead>
        <th>LP</th>
        <th>user</th>
        <th>donatedItems</th>
        <th>qty</th>
        <th>institution</th>
        <th>pickUpstreet</th>
        <th>pickUpcity</th>
        <th>pickUpzip</th>
        <th>pickUpphoneNumber</th>
        <th>pickUpDate</th>
        <th>pickUpTime</th>
        <th>pickUpRemarks</th>
        <th>realized</th>
        <th colspan="2">Actions</th>
    </thead>

    <tbody>
    <c:forEach items="${donations}" var="donation" varStatus="stat">
        <tr>
            <td>${stat.index+1}</td>
            <td>${donation.user.name}</td>
            <td>${donation.donatedItems}</td>
            <td>${donation.qty}</td>
            <td>${donation.institution.name}</td>
            <td>${donation.pickUpstreet}</td>
            <td>${donation.pickUpcity}</td>
            <td>${donation.pickUpzip}</td>
            <td>${donation.pickUpphoneNumber}</td>
            <td>${donation.pickUpDate}</td>
            <td>${donation.pickUpTime}</td>
            <td>${donation.pickUpRemarks}</td>
            <td>${donation.realized}</td>

            <td style="width: 50px; text-align: center"><a href="/books/edit/${donation.id}" >Edit</a></td>
            <td style="width: 50px; text-align: center"><a href="/books/delete/${donation.id}" onclick="return confirm('Are you sure you want to delete this item?');" >Delete</a></td>
        </tr>
    </c:forEach>
    </tbody>

</table>


</body>
</html>
