<%--
  Created by IntelliJ IDEA.
  User: 졍
  Date: 2024-04-18
  Time: 오전 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 확인</title>

    <!-- My CSS -->
    <link rel="stylesheet" href="<c:url value="/css/customer/checkPW.css"/> ">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <!-- Bootstarp JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>


<script>
    function checkPw(){
        console.log("비밀번호 확인 실행");

        let idx = '${qnaidx}';
        let pw = $("#pw").val();
        console.log(idx +"///"+ pw);

        $.ajax({
            url:'/cust/qnaCheckimpl',
            data:{"idx":idx, "pw":pw},
            success:(res)=>{
                if(res == 1){
                    // 비밀번호 일치하면 부모창에서 openQnaDetail() 함수 실행
                    // opener.openQnaDetail(idx);
                    // 비밀번호 확인 팝업 창을 닫습니다.
                    window.close();
                    // qna 상세페이지로 이동
                    opener.location.href="/cust/qnaDetail/"+idx;
                }else{
                    alert("비밀번호가 틀립니다.");
                }
            },
            error:(e)=>{
                console.log(e);
            }
        });
    }
</script>
</head>
<body>
<div class="main">
    <form id="qnaDetailForm" action="">
        <table>
            <tr>
                <td colspan="2">비밀번호입력</td>
            </tr>
            <tr>
                <td colspan="2">글 작성시 입력한 비밀번호를 입력하세요.</td>
            </tr>
            <tr>
                <td style="width: 20%;"><img src="<c:url value="/img/customer/txt_pass.gif"/>"></td>
                <td style="width: 80%;"><input type="password" id="pw"></td>
            </tr>

        </table>
    </form>
    <div><input type="image" onclick="checkPw()" src="<c:url value="/img/customer/btn_confirm.gif"/> "></div>
    <div><input class="closeBtn" type="image" onclick="window.close()" src="<c:url value="/img/member/btn_close.gif"/>"></div>
</div>

</body>
</html>
