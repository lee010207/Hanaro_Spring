
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<ul class="nav nav-pills flex-column">
  <p>Cust</p>
  <li class="nav-item">
    <a class="nav-link" href="<c:url value="/cust/add"/>">주소록 추가</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="<c:url value="/cust/get"/>">주소록 조회</a>
  </li>

</ul>