<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2024-03-27
  Time: 오전 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    let ajax1={
        init:function(){
            // 주기적인 동작(Ajax) 처리
            // 3초에 한번씩 함수를 호출해라
            setInterval(function(){
                $.ajax({
                    url:'/getservertime' ,
                    success:function(data){
                        ajax1.display(data);
                    },
                    error:function (e){
                        console.log(e);
                    }
                });
            }, 1000);


        },
        display:function(data){
            $('#result').text(data);
        }
    }

    $(function(){
        ajax1.init();
    });
</script>
<div class="container">
    <h2>AJAX1 Page</h2>
    <p>Ajax : Asyncronus JavaScript And XML</p>
    <p>자바스크림트와 XML 통신을 비동기로 하겠다</p>
    <h3>Sever time</h3>
    <div id="result" class="container div_bg">
<%--  Ajax로 가져온 데이터를 뿌리는 공간      --%>
    </div>
</div>
