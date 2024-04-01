<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2024-03-27
  Time: 오전 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .div_bg{
        border: 2px solid;
    }
</style>
<script>
    let jquery2 = {
        init:function(){
            $('#append').click(function(){
                $('#result').append("<h2>APPEND</h2>");
            });
            $('#prepend').click(function(){
                $('#result').prepend("<h2>PREPEND</h2>");
            });
            $('#after').click(function(){
                $('#result').after("<h2>AFTER</h2>");
            });
            $('#before').click(function(){
                $('#result').before("<h2>before</h2>");
            });
            $('#remove').click(function(){
                $('#result').remove();
            });
            $('#empty').click(function(){
                $('#result').empty("<h2>EMPTY</h2>");
            });
        }
    }

    $(function(){
        jquery2.init();
    })
</script>
<div class="container">
    <h2>jQuery2 Page</h2>
    <button type="button" id="append" class="btn btn-light">APPEND</button>
    <button type="button" id="prepend" class="btn btn-light">PREPEND</button>
    <button type="button" id="after" class="btn btn-light">AFTER</button>
    <button type="button" id="before" class="btn btn-light">BEFORE</button>
    <button type="button" id="remove" class="btn btn-light">REMOVE</button>
    <button type="button" id="empty" class="btn btn-light">EMPTY</button>
    <div id="result" class="container div_bg">

    </div>
</div>
