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
<script>
    let login = {
        init:function (){
            $("#loginbtn").click(()=>{

                let id = $('#id').val();
                let pw = $('#pw').val();
                if(id == '' || id == null){
                    alert('ID를 입력 하세요');
                    $('#id').focus();
                    return;
                }
                if(pw == '' || pw == null) {
                    alert('PWD를 입력 하세요');
                    $('#pwd').focus();
                    return;
                }
                login.send(id,pw);
            });
        },
        send:function (id, pw){
            $.ajax({
                url:'/member/loginimpl',
                method:"post",
                data:{"id":id, "pw":pw},
                success:(msg)=>{
                    alert(msg);
                    if(msg === "로그인 성공"){
                        location.href="/";
                    }
                },
                error:(e)=>{
                    console.log(e);
                }
            });
            // $('#loginForm').attr({
            //     method:"post",
            //     action:"/member/loginimpl"
            // });
            // $('#loginForm').submit();
        }
    };

    $(function(){
        login.init();
    })

</script>
<div class="commonSection1">
    <div class="commonContent1">
        <img src="../img/member/sub-visual01.jpg"
             style="width: 100%; height: 100%;">
        <div class="commonContent2 text-center">
            <div>
                <h3>MEMBER</h3>
            </div>
            <div>
                <p><img src="../img/icon-home.png"> > 로그인</p>
            </div>
        </div>
    </div>
</div>

<!-- 로그인 -->
<div class="loginForm container text-center">
    <div class="loginSection1">
        <div><h3>로그인</h3></div>
        <div><p>The design and maintenance are excellent.</p></div>
    </div>
    <div class="loginMain">
        <form id="loginForm">
            <table class="main1">
                <tr>
                    <td>
                        아이디 <br>
                        비밀번호
                    </td>
                    <td>
                        <input type="text" id="id" name="memberId"> <br>
                        <input type="password" id="pw" name="memberPw">
                    </td>
                    <td>
                        <button type="button" id="loginbtn" class="btn btn-light">로그인</button>
                    </td>
                </tr>
            </table>
        </form>
<%--        <c:choose>
            <c:when test="${not empty loginmsg}">
                <div><span>${loginmsg}</span></div>
            </c:when>
        </c:choose>--%>

        <div class="loginSection2">
            <table class="main2">
                <tr>
                    <td>-아이디를 잊으셨나요?</td>
                    <td>
                        <input type="image"
                               onclick="window.location.href='<c:url value="/member/idFind"/>'"
                               src="../img/member/btn_id_find.gif" >
                    </td>
                </tr>
                <tr>
                    <td>-비밀번호를 잊으셨나요?</td>
                    <td>
                        <input type="image"
                               onclick="window.location.href='<c:url value="/member/pwFind"/>'"
                               src="../img/member/btn_pw_find.gif" >
                    </td>
                </tr>
            </table>
        </div>

    </div>
</div>