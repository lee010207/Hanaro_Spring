<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let html3 = {
        init: function () {
        }
    };
    $(function () {
        html3.init();
    });
</script>
<div class="container">
    <h1>Cust Get</h1>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>PWD</th>
            <th>NAME</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="c" items="${addr}">
            <tr>
                <td><a href="<c:url value="/cust/detail"/>?id=${c.addrId}">${c.addrId}</a></td>
                <td>${c.addrName}</td>
                <td>${c.addrDetail}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>