<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2024-03-27
  Time: 오전 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<script>
    let ajax3 = {
        init: function () {
            $('#getBtn').click(function(){
                $.ajax({
                    url: '<c:url value="/getdata"/>',
                    success: function (data) {
                        // console.log(data);
                        ajax3.display(data);
                    },
                    error: function (e) {
                        console.log(e);
                    }
                });
            })
        },
        display: function (data) {
            var res = "";
            /*data.forEach((val)=>{
                res += "<tr>";
                res += "<td>"+ val.id +"</td>";
                res += "<td>"+ val.pwd +"</td>";
                res += "<td>" + val.name +"</td>";
                res += "</tr>";
            })*/
            setInterval(function(){
                let idx = Math.floor(Math.random() * (6 - 1 + 1) + 1);
                console.log(data[idx-1]);
                res += data[idx-1].id + data[idx-1].pwd +data[idx-1].name;
                $('#result').text(res);

            },3000);
        }
    }

    $(function () {
        ajax3.init();
    });
</script>
<div class="container">
    <h2>AJAX3 Page</h2>
    <button id="getBtn" type="button" class="btn btn-primary">LOGIN</button>
    <div id="result" class="container div_bg">

    </div>
</div>
