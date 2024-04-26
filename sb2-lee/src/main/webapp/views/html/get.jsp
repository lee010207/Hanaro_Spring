<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2024-04-01
  Time: 오전 9:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<script>
    let get = {
        init: function () {
        }
    };
    $(function () {
        get.init();
    });
</script>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div class="container">
        <h1>get Page</h1>
        <h2>${cust.id}</h2>
        <h2>${cust.pwd}</h2>
        <h2>${cust.name}</h2>
    </div>
</body>
</html>