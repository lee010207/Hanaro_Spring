<%--
  Created by IntelliJ IDEA.
  User: 졍
  Date: 2024-04-16
  Time: 오후 5:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<c:url value="/css/member/join.css"/>">
<script>

    let join = {
        init:function (){
            $("#joinbtn").click(()=>{
                let id = $('#id').val();
                let pw = $('#pw').val();
                let pwcheck = $("#pwCheck").val();
                let name = $("#name").val();
                let email = $("#email").val();
                let emailreceive = $("input[name='memberEmailReceive']:checked").val();
                let pwquestion = $("#pwquestion").val();
                let pwanswer = $("#pwanswer").val();
                let gender = $("input[name='memberGender']:checked").val();
                let birthdate = $("#birthdate").val();

                if(id == '' || id == null){
                    alert('ID를 입력 하세요');
                    $('#id').focus();
                    return;
                }
                if(pw == '' || pw == null) {
                    alert('PW를 입력 하세요');
                    $('#pw').focus();
                    return;
                }
                if(pwcheck == '' || pwcheck == null) {
                    alert('비밀번호를 확인하세요');
                    $('#pwcheck').focus();
                    return;
                }
                if(name == '' || name == null) {
                    alert('이름을 입력 하세요');
                    $('#name').focus();
                    return;
                }if(email == '' || email == null) {
                    alert('이메일을 입력 하세요');
                    $('#email').focus();
                    return;
                }if(emailreceive == '' || emailreceive == null) {
                    alert('이메일 수신여부를 체크하세요');
                    $('#emailreceive').focus();
                    return;
                }if(pwquestion == '' || pwquestion == null || pwquestion == 0) {
                    alert('비밀번호 찾기 질문을 입력 하세요');
                    $('#pwquestion').focus();
                    return;
                }if(pwanswer == '' || pwanswer == null) {
                    alert('비밀번호 찾기 답변을 입력 하세요');
                    $('#pwanswer').focus();
                    return;
                }if(gender == '' || gender == null) {
                    alert('성별을 입력 하세요');
                    $('#gender').focus();
                    return;
                }if(birthdate == '' || birthdate == null) {
                    alert('생년월일을 입력 하세요');
                    $('#birthdate').focus();
                    return;
                }
                join.send();
            });
        },
        send:function (){
            $("#joinbtn").attr("disabled", false);

            $('#joinForm').attr({
                method:"post",
                action:"/member/joinimpl"
            });
            $('#joinForm').submit();
        }
    };

    function idCheck(){
        let id = $('#id').val();
        $.ajax({
            url:'/member/idCheck',
            data:{"id":id},
            success:(msg)=>{
                $("#idCheckMsg").text(msg);
            },
            error:(e)=>{
                console.log(e);
            }
        });
    };

    function pwdCheck(){
        let pw = $('#pw').val();
        let pwcheck = $("#pwCheck").val();
        console.log(pw +" // " + pwcheck);
        if(pw.length < 4){
            alert("비밀번호는 4자리 이상만 가능합니다!");
            // $("#joinbtn").attr("disabled", true);
        }else if(pwcheck != pw){
            alert("비밀번호가 일치하지 않습니다.");
            // $("#joinbtn").attr("disabled", true);
        }else{
            // 4자리 이상, 비밀번호 일지 시 버튼 비활성화 해제
            alert("사용가능한 비밀번호입니다.");
            $("#joinbtn").attr("disabled", false);
        }

    };

    $(function (){
        join.init();
    });
</script>
<!-- 메인 -->
<!-- COMMON -->
<div class="commonSection1">
    <div class="commonContent1">
        <img src="../img/member/sub-visual02.jpg"
             style="width: 100%; height: 100%;">
        <div class="commonContent2 text-center">
            <div>
                <h3>MEMBER</h3>
            </div>
            <div>
                <p><img src="../img/icon-home.png"> > 회원가입</p>
            </div>
        </div>
    </div>
</div>

<!-- 메인 -->
<!-- 회원가입 -->
<div class="joinForm container">

    <div class="joinSection1">
        <div><h3>회원가입</h3></div>
        <div><p>The design and maintenance are excellent.</p></div>
    </div>
    <div class="wellcome">
        <h3>OOO사이트에 오신 것을 환영합니다.</h3>
        <h5>-이름과 이메일을 입력해 주시면 가입여부를 확인 후 회원가입 절차가 이루어집니다.</h5>
    </div>
    <br><br>
    <div class="contents">
        <h3>회원가입을 위해서 아래의 양식에 있는 내용을 입력해 주셔야 합니다.</h3>
        <h5>-회원님의 개인정보를 신중하게 보호하고 있으며 회원님의 동의 없이는 기재하신 회원정보가 누출되지 않습니다.
            자세한 내용은 개인정보보호정책에서 확인하세요.</h5>
    </div>
    <!-- 입력폼 -->
    <div class="information1">
        <div>기본정보</div>
        <form id="joinForm">
        <table>
            <tr>
                <td>아이디</td>
                <td>
                    <input type="text" id="id" name="memberId">
                    <img src="../img/member/btn_iddupl.gif" onclick="idCheck()">
                    <span id="idCheckMsg">(영문 소문자, 숫자로 4~16자)</span>
                </td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td>
                    <input type="password" id="pw" name="memberPw">
                    <p>영문/숫자/특수문자조합으로 8~16자리. 첫글자는 영문자로 사용</p>
                </td>

            </tr>
            <tr>
                <td>비밀번호 확인</td>
                <td><input type="password" id="pwCheck" name="pwCheck">
                <button type="button" onclick="pwdCheck()" class="btn btn-sm btn-outline-secondary">확인</button>
                </td>
            </tr>
            <tr>
                <td>이름</td>
                <td><input type="text" id="name" name="memberName"></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td><input type="email" id="email" name="memberEmail"></td>
            </tr>
            <tr>
                <td>이메일 수신여부</td>
                <td><input type="radio" name="memberEmailReceive" value="1">수신
                    <input type="radio" name="memberEmailReceive" value="0">수신안함</td>
            </tr>
            <tr>
                <td>비밀번호 확인시 질문</td>
                <td>
                    <select class="size" id="pwquestion" name="memberPwQuestion">
                        <option value="0">========선택========</option>
                        <option value="1">기억에 남는 추억의 장소는?</option>
                        <option value="2">자신의 인생 좌우명은?</option>
                        <option value="3">자신의 보물 제1호는?</option>
                        <option value="4">가장 기억에 남는 선생님 성함은?</option>
                        <option value="5">내가 좋아하는 캐릭터는?</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>비밀번호 확인시 답변</td>
                <td><input type="text" id="pwanswer" name="memberPwAnswer" value=""></td>
            </tr>
            <tr>
                <td>성별</td>
                <td><input type="radio" name="memberGender" value="male">남자<input type="radio" name="memberGender" value="female">여자</td>
            </tr>
            <tr>
                <td>생년월일</td>
                <td>
                    <input type="date" id="birthdate" name="memberBirthDate" class="birthdaySelect">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <button type="button" class="btn btn-basic" id="joinbtn" disabled>회원가입</button>
                </td>
            </tr>
        </table>
        </form>
    </div>


</div>

