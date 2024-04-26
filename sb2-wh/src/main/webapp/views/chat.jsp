<%--
  Created by IntelliJ IDEA.
  User: 졍
  Date: 2024-04-11
  Time: 오후 2:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    #all {
        width: 400px;
        height: 200px;
        overflow: auto;
        border: 2px solid red;
    }

    #me {
        width: 400px;
        height: 200px;
        overflow: auto;
        border: 2px solid blue;
    }

    #to {
        width: 400px;
        height: 200px;
        overflow: auto;
        border: 2px solid green;
    }
</style>
<script>
    let websocket = {
        id:'',
        stompClient:null,
        init:function(){
            this.id = $('#adm_id').text();
            $('#connect').click(()=>{
                this.connect();
            });
            $('#disconnect').click(()=>{
                this.disconnect();
            });
            // send 버튼 이벤트 등록
            $('#sendall').click(()=>{
                let msg = JSON.stringify({
                    'sendid' : this.id,
                    'content1' : $("#alltext").val()
                });
                this.stompClient.send("/receiveall", {}, msg);
            });
            $('#sendme').click(()=>{
                let msg = JSON.stringify({
                    'sendid' : this.id,
                    'content1' : $("#metext").val()
                });
                this.stompClient.send("/receiveme", {}, msg);
            });
            $('#sendto').click(()=>{
                var msg = JSON.stringify({
                    'sendid' : this.id,
                    'receiveid' : $('#target').val(),
                    'content1' : $('#totext').val()
                });
                this.stompClient.send('/receiveto', {}, msg);
            });
        },
        connect:function(){
            let sid = this.id;
            let socket = new SockJS('${serverurl}/ws');
            this.stompClient = Stomp.over(socket);
            // 소켓 객체 생성

            this.stompClient.connect({}, function(frame) {
                // 클라이언트와 서버 연결
                websocket.setConnected(true);
                // 화면에 서버 연결됐다 보여주는 함수
                console.log('Connected: ' + frame);
                this.subscribe('/send', function(msg) {
                    // 서버에서 send로 보내면 얘가 받겠다
                    $("#all").prepend(
                        "<h4>" + JSON.parse(msg.body).sendid +":"+
                        JSON.parse(msg.body).content1
                        + "</h4>");
                });
                this.subscribe('/send/'+sid, function(msg) {
                    $("#me").prepend(
                        "<h4>" + JSON.parse(msg.body).sendid +":"+
                        JSON.parse(msg.body).content1+ "</h4>");
                });
                this.subscribe('/send/to/'+sid, function(msg) {
                    $("#to").prepend(
                        "<h4>" + JSON.parse(msg.body).sendid +":"+
                        JSON.parse(msg.body).content1
                        + "</h4>");
                });


            });
        },
        setConnected:function(connected){
            // connect가 일어났을 때 정상이면 true -> 연결완료 화면 보여줌
            // connect가 비정상이면 false -> 연결실패 화면 보여줌
            if (connected) {
                $("#status").text("Connected");
            } else {
                $("#status").text("Disconnected");
            }
        },
        disconnect: function () {
            if (this.stompClient !== null) {
                this.stompClient.disconnect();
            }
            websocket.setConnected(false);
            console.log("Disconnected");
        },

    };
    $(function(){
        websocket.init();
    });
</script>
<div class="container">
    <h1>Chat Page</h1>
    <div class="col-sm-5">
        <h1 id="adm_id">${sessionScope.id}</h1>
        <H1 id="status">Status</H1>
        <button id="connect">Connect</button>
        <button id="disconnect">Disconnect</button>

        <h3>All</h3>
        <input type="text" id="alltext"><button id="sendall">Send</button>
        <div id="all"></div>

        <h3>Me</h3>
        <input type="text" id="metext"><button id="sendme">Send</button>
        <div id="me"></div>

        <h3>To</h3>
        <input type="text" id="target">
        <input type="text" id="totext"><button id="sendto">Send</button>
        <div id="to"></div>

    </div>
</div>
