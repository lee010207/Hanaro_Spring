<%--
  Created by IntelliJ IDEA.
  User: 졍
  Date: 2024-04-18
  Time: 오전 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value="/css/customer/customer01.css"/> ">
<script>
    function submit(){
        $("#otoForm").submit();
    }
</script>
<!-- 메인 -->
<!-- 1:1문의 -->
<!-- COMMON -->
<div class="commonSection1">
    <div class="commonContent1">
        <img src="../img/member/sub-visual02.jpg"
             style="width: 100%; height: 100%;">
        <div class="commonContent2 text-center">
            <div>
                <h3>COSTOMER</h3>
            </div>
            <div>
                <p><img src="<c:url value="/img/icon-home.png"/> "> > 고객지원 > 1:1문의</p>
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
                고객지원
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
                1:1문의
            </a>
            <ul class="dropdown-menu asd">
                <li><a class="dropdown-item" href="../customer/costomer01.html">1:1문의</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="../customer/costomer02.html">묻고답하기</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="../customer/costomer03.html">FAQ</a></li>
            </ul>
        </li>
    </ul>
    </div>
</nav>

<!-- 1:1문의 -->
<div class="communitySection2 container text-center">
    <div>
        <div>1:1문의</div>
        <div>The design and maintenance are excellent.</div>
    </div>
    <div class="question">
        <form action="<c:url value="/cust/otoimpl"/>" method="post" id="otoForm">
            <table>
                <tr>
                    <td>구분</td>
                    <td><select>
                        <option value="1">로그인</option>
                        <option value="2">회원가입</option>
                        <option value="3">이용안내</option>
                    </select>
                    </td>
                </tr>
                <tr>
                    <td>성명</td>
                    <td><input type="text" class="inputStyle1" name="one2oneName"></td>
                </tr>
                <tr>
                    <td>전화번호</td>
                    <td><input type="text" class="inputStyle1" name="one2onePhone"></td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td><input type="text" class="inputStyle2" name="one2oneEmail"></td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td><input type="text" class="inputStyle2" name="one2oneAddress"></td>
                </tr>
                <tr>
                    <td>제목</td>
                    <td><input type="text" class="inputStyle2" name="one2oneTitle"></td>
                </tr>
                <tr>
                    <td>설명</td>
                    <td><textarea name="one2oneContent" rows="10" style="width: 90%;"></textarea></td>
                </tr>
            </table>
        </form>
    </div>
    <div class="btn">
        <input type="image" src="<c:url value="/img/customer/btn_confirm.gif"/> " onclick="submit()">
        <input type="image" src="../img/customer/btn_cancel.gif">
    </div>
</div>
