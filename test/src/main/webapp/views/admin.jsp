<%--
  Created by IntelliJ IDEA.
  User: 졍
  Date: 2024-04-18
  Time: 오전 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value="/css/member/login.css"/>" />
<script>
    function submit(){
        $("#adminForm").submit();
    }
</script>
<!-- 메인 -->
<!-- COMMON -->
<div class="commonSection1">
    <div class="commonContent1">
        <img
                src="<c:url value="/img/member/sub-visual01.jpg"/>"
                style="width: 100%; height: 100%"
        />
        <div class="commonContent2 text-center">
            <div>
                <h3>ADMIN</h3>
            </div>
            <div>
                <p><img src="<c:url value="/img/icon-home.png"/>" /> > 관리자 로그인</p>
            </div>
        </div>
    </div>
</div>

<!-- 로그인 -->
<div class="loginForm container text-center">
    <div class="loginSection1">
        <div><h3>관리자 로그인</h3></div>
        <div><p>The design and maintenance are excellent.</p></div>
    </div>
    <div class="loginMain">
        <form id="adminForm" action="<c:url value="/admin/login"/>" method="post">
            <table class="main1">
                <tr>
                    <td>
                        아이디 <br />
                        비밀번호
                    </td>
                    <td>
                        <input type="text" name="memberId" /> <br />
                        <input type="text" name="memberPw" />
                    </td>
                    <td>
                        <input
                                type="image"
                                class="loginImg"
                                onclick="submit()"
                                value="submit"
                                src="<c:url value="/img/member/btn_login.gif"/>"
                        />
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
