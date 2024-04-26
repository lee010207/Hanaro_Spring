<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<div class="container">
    <h2>OCR</h2>
    <form id="item_add_form" action="<c:url value="/ocrimpl"/>" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="image">Image:</label>
            <input type="file" class="form-control" id="image" placeholder="Enter name" name="image">

        </div>

        <button id="btn_add" type="submit" class="btn btn-primary">Add</button>
    </form>
    <img width="200px" src="/imgs/<c:url value="${imgname}"/> ">
    <%-- map 데이터타입에 데이터를 담았을 때 key값을 통해서 데이터를 꺼내올 수 있다--%>
    <h3>${result.bizname}</h3>
    <h3>${result.bizowner}</h3>
    <h3>${result.bizdate}</h3>
    <h3>${result.bizadd}</h3>
</div>
