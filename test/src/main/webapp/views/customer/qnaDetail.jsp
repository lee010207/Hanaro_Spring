<%--
  Created by IntelliJ IDEA.
  User: 졍
  Date: 2024-04-18
  Time: 오전 10:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value="/css/community/community.css"/> ">
<!-- 메인 -->
<!-- QNA 상세페이지 -->
<!-- COMMON -->
<div class="commonSection1">
    <div class="commonContent1">
        <img src="<c:url value="/img/member/sub-visual02.jpg"/> "
             style="width: 100%; height: 100%;">
        <div class="commonContent2 text-center">
            <div>
                <h3>CUSTOMER</h3>
            </div>
            <div>
                <p><img src="<c:url value="/img/icon-home.png"/> "> > 고객지원 > 묻고 답하기</p>
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
                묻고 답하기
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

<!-- 공지사항 상세 -->
<div class="communitySection2 container text-center">
    <div>
        <div>묻고 답하기</div>
        <div>The design and maintenance are excellent.</div>
    </div>
    <div class="NoticeContent">
        <table>
            <tr>
                <th>제목</th>
                <td>${qnadto.qnaTitle}</td>
            </tr>
            <tr>
                <th>작성자</th>
                <td>${qnadto.qnaName}</td>
            </tr>
            </tr>
            <tr>
                <th>작성일</th>
                <td>${qnadto.qnaDate}</td>
            <tr>
                <td colspan="2">${qnadto.qnaContent}</td>
            </tr>
        </table>
        <div>
            <input type="image" onclick="window.location.href = '<c:url value="/cust/qna"/>'"
                   src="<c:url value="/img/community/list.gif"/> ">
        </div>
    </div>

</div>

