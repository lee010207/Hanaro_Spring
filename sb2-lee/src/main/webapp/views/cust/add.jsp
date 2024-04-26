
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let cust_add = {
        url:'',
        init:function(url){
            this.url = url;
            $('#register_form > button').click(()=>{
                let id = $('#id').val();
                let addr = $('#addr').val();

                if(id == '' || id == null){
                    alert('ID를 입력 하세요');
                    $('#id').focus();
                    return;
                }
                if(addr == '' || addr == null){
                    alert('주소를 입력 하세요');
                    $('#addr').focus();
                    return;
                }

                this.send();
            });
        },
        send:function(){
            $('#register_form').attr({
                'method':'post',
                'action':this.url
            });
            $('#register_form').submit();
        }
    };
    $(function(){
        cust_add.init('<c:url value="/cust/addimpl"/>');
    });

</script>
<div class="container">
    <h2>Register Page</h2>
    <form id="register_form">
        <input type="hidden" value=${id} name="custId">
        <div class="form-group">
            <label for="id">주소지 이름:</label>
            <input type="text" class="form-control" id="id" placeholder="Enter id" name="addrName">

        </div>
        <div class="form-group">
            <label for="addr">주소:</label>
            <input type="text" class="form-control" id="addr" placeholder="Enter password" name="addrDetail">

        </div>
        <button type="button" class="btn btn-primary">등록</button>
    </form>
</div>