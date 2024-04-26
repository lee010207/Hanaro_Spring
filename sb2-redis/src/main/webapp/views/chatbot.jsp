
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

            $('#sendto').click(()=>{
                var msg = JSON.stringify({
                    'sendid' : this.id,
                    'content1' : $('#totext').val()
                });
                this.stompClient.send('/sendchatbot', {}, msg);
            // sb2에 있는 controller(/sendchatbot) 에 데이터 전송
            });
        },
        connect:function(){
            let sid = this.id;
            let socket = new SockJS('${chatboturl}/chatbot');
            // /chatbot 웹소켁 채널을 통해 serverurl로 접속
            this.stompClient = Stomp.over(socket);

            this.stompClient.connect({}, function(frame) {
                websocket.setConnected(true);
                console.log('Connected: ' + frame);

                this.subscribe('/send/me/'+sid, function(msg) {
                    $("#to").prepend(
                        "<h4>" + JSON.parse(msg.body).sendid +":"+
                        JSON.parse(msg.body).content1
                        + "</h4>");
                });
            });
        },
        disconnect:function(){
            if (this.stompClient !== null) {
                this.stompClient.disconnect();
            }
            websocket.setConnected(false);
            console.log("Disconnected");
        },
        setConnected:function(connected){
            if (connected) {
                $("#status").text("Connected");
            } else {
                $("#status").text("Disconnected");
            }
        }
    };
    $(function(){
        websocket.init();
    });
</script>
<div class="container">
    <h2>Chat Page</h2>
    <div class="col-sm-5">
        <h1 id="adm_id">${sessionScope.id}</h1>
        <H1 id="status">Status</H1>
        <button id="connect">Connect</button>
        <button id="disconnect">Disconnect</button>

        <h3>To</h3>
        <input type="text" id="totext"><button id="sendto">Send</button>
        <div id="to"></div>

    </div>

</div>
