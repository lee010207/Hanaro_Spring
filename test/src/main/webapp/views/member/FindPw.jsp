<%--
  Created by IntelliJ IDEA.
  User: 졍
  Date: 2024-04-17
  Time: 오후 1:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
                <p><img src="../img/icon-home.png"> > 로그인  >  비밀번호찾기</p>
            </div>
        </div>
    </div>
</div>

<!-- 로그인 -->
<div class="loginForm container text-center">
    <div class="loginSection1">
        <div><h3>비밀번호 찾기</h3></div>
        <div><p>The design and maintenance are excellent.</p></div>
    </div>
    <div class="loginMain">
            <table class="main1">
                <tr>
                    <td style="text-align: center">
                        비밀번호
                    </td>
                    <td style="text-align: center">
                       ${findPw}
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center">
                        <button type="button" class="btn btn-light" onclick="location.href='/member/login'">로그인 하러 가기</button>
                    </td>
                </tr>
            </table>
    </div>
</div>