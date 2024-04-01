<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2024-03-27
  Time: 오전 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
    <h2>HTML3 Page</h2>

    <table class="table">
        <thead>
        <th>아이디</th>
        <th>비밀번호</th>
        <th>이름</th>
        </thead>
        <tbody>
        <c:forEach var="c" items="${cust}">
            <tr>
                <td><a href="<c:url value="/html/get"/>?id=${c.id}">${c.id}</a></td>
                <td>${c.pwd}</td>
                <td>${c.name}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
