<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2024-03-27
  Time: 오전 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    .fakeimg {
        height: 200px;
        background: #aaa;
    }
    #scroll-btn {
        opacity: 0;
        width: 50px;
        height: 50px;
        color: #fff;
        background-color: #ef476f;
        position: fixed;
        bottom: 13%;
        right: 10%;
        border: 2px solid #fff;
        border-radius: 50%;
        font: 2px monospace;
        transition: opacity 2s, transform 2s;
    }
    #scroll-btn.show {
        opacity: 1;
        transition: opacity 5s, transform 5s;
    }
    #scroll-btn2 {
        opacity: 0;
        width: 50px;
        height: 50px;
        color: #fff;
        background-color: #ef476f;
        position: fixed;
        bottom: 5%;
        right: 10%;
        border: 2px solid #fff;
        border-radius: 50%;
        font: bold 10px monospace;
        transition: opacity 2s, transform 2s;
    }
    #scroll-btn2.show {
        opacity: 1;
        transition: opacity 5s, transform 5s;
    }
</style>
<script>
    let chatbtn = {
        init:function(){
           /* const scrollBtn = document.createElement("button");
            scrollBtn.innerHTML = "chatbot";
            scrollBtn.setAttribute("id", "scroll-btn");
            document.body.appendChild(scrollBtn);
            scrollBtn.classList.add("show");
            scrollBtn.addEventListener("click", function(){
                location.href='/login';
            });*/
            const scrollBtn2 = document.createElement("button");
            scrollBtn2.innerHTML = "1:1";
            scrollBtn2.setAttribute("id", "scroll-btn2");
            document.body.appendChild(scrollBtn2);
            scrollBtn2.classList.add("show");
            scrollBtn2.addEventListener("click", function(){
                location.href='/login';
            });
        }
    };
    $(function(){
        chatbtn.init();
    });
</script>
<script>
    let summary = {
        init:function (){
            $('#summary-form button').click(()=>{
                this.send();
            });
        },
        send:function (){
            let content = $("#content").val();
            $.ajax({
                url:'<c:url value="/summaryimpl"/>',
                data:{"content":content},
                success:(res)=>{
                    $("#result").val(res.summary);
                },
                error:(e)=>{
                    console.log(e);
                }
            });
        }
    };

    $(function (){
        summary.init();
    });

</script>
<div class="container">
    <h2>Summary</h2>
    <form id="summary-form">
        <div class="form-group">
            <label for="content">Content:</label>
            <textarea class="form-control"
                      rows="50" id="content"
                      name="boardContent" placeholder="Enter content"></textarea>
        </div>
        <button type="button" class="btn btn-primary">REGISTER</button>
    </form>
    <textarea class="form-control"
              rows="10" id="result"
              name="boardContent" placeholder="Enter content"></textarea>
</div>