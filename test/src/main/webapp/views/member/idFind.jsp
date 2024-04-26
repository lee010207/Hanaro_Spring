<%--
  Created by IntelliJ IDEA.
  User: 졍
  Date: 2024-04-18
  Time: 오전 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="../css/member/idFind.css">
<link rel="stylesheet" href="<c:url value="/css/member/login.css"/>">

<div class="commonSection1">
    <div class="commonContent1">
        <img src="../img/member/sub-visual01.jpg"
             style="width: 100%; height: 100%;">
        <div class="commonContent2 text-center">
            <div>
                <h3>MEMBER</h3>
            </div>
            <div>
                <p><img src="../img/icon-home.png"> >  로그인  >  아이디찾기</p>
            </div>
        </div>
    </div>
</div>

<!-- 아이디찾기 -->
<div class="loginForm container text-center">
    <div class="loginSection1">
        <div><h3>아이디 찾기</h3></div>
    </div>
    <div class="loginMain idfindmain">
        <form id="idFindForm" action="/member/idFindimpl" method="post">
            <table>
                <tr>
                    <td colspan="2">아이디 찾기</td>
                </tr>
                <tr>
                    <td colspan="2">아이디를 잊어버리셨나요?<br>회원님의 성명과 이메일을 입력하여 주세요.</td>
                </tr>
                <tr>
                    <td style="width: 20%;">
                        <img src="../img/member/txt_join1.gif">
                        <img src="../img/member/txt_email.gif">
                    </td>
                    <td style="width: 80%;">
                        <input type="text" name="memberName">
                        <input type="text" class="emailText" name="memberEmail">
                    </td>
                </tr>
            </table>
            <div><button type="submit" id="idfindbtn" class="btn btn-sm btn-light">확인</button>
            <button type="button" class="btn btn-sm btn-light" onclick="location.href='/member/login'">뒤로</button></div>
        </form>
    </div>
</div>
