<%--
  Created by IntelliJ IDEA.
  User: 졍
  Date: 2024-04-17
  Time: 오후 5:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="../css/community/community.css">
<script>
    function search(){
        /*let op = $("#opSearch").val();
        let txt = $("#txtSearch").val();*/

        $("#searchForm").attr({"action":"<c:url value="/commu/search"/>", "method":"get"});
        $("#searchForm").submit();

    }
</script>
<!-- 메인 -->
<!-- 공지사항 -->
<!-- COMMON -->
<div class="commonSection1">
    <div class="commonContent1">
        <img src="../img/member/sub-visual02.jpg"
             style="width: 100%; height: 100%;">
        <div class="commonContent2 text-center">
            <div>
                <h3>COMMUNITY</h3>
            </div>
            <div>
                <p><img src="../img/icon-home.png"> > 커뮤니티 > 공지사항</p>
            </div>
        </div>
    </div>
</div>
<!-- COMMON - 드랍다운 -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="../index.html"><button class="homeBtn">H</button></a>
    <ul class="navbar-nav mr-auto navbar-nav-scroll"
        style="max-height: 100px;">

        <li class="nav-item dropdown dropdownHide">
            <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button"
               data-toggle="dropdown" aria-expanded="false">
                커뮤니티
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
                <li><a class="dropdown-item" href="#">회사소개</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">사업분야</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">제품안내</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">커뮤니티</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">고객지원</a></li>
            </ul>
        </li>

        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#"
               role="button" data-toggle="dropdown" aria-expanded="false">
                공지사항
            </a>
            <ul class="dropdown-menu asd">
                <li><a class="dropdown-item" href="../community/community01.html">공지사항</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">홍보자료</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">채용안내</a></li>
            </ul>
        </li>
    </ul>
    </div>
</nav>

<!-- 공지사항 -->
<div class="communitySection2 container text-center">
    <div>
        <div>공지사항</div>
        <div>The design and maintenance are excellent.</div>
    </div>
    <div class="Notice">
        <table>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성일</th>
            </tr>
            <c:forEach items="${commuinfo}" var="c">
                <tr>
                    <td>${c.noticeIdx}</td>
                    <td><a href="<c:url value="/commu/detail"/>?idx=${c.noticeIdx}">${c.noticeTitle}</a></td>
                    <td>${c.noticeDate}</td>
                </tr>
            </c:forEach>

        </table>
    </div>
</div>

<!-- search bar 검색창 -->
<div class="search container">
    <form id="searchForm">
    <table>
        <tr>
            <td>
                <select name="opSearch" id="opSearch">
                    <option value="1">제목</option>
                    <option value="2">내용</option>
                </select>
            </td>
            <td>
                <input id="txtSearch" name="txtSearch" type="text">
            </td>
            <td>
                <input type="image" onclick="search()" src="../img/community/search.gif">
            </td>
        </tr>
    </table>
    </form>
</div>
