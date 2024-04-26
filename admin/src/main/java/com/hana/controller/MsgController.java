package com.hana.controller;

import com.hana.app.data.Msg;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

@Slf4j
@Controller
@RequiredArgsConstructor
public class MsgController {

    final SimpMessagingTemplate template;

    @MessageMapping("/receiveall") // 모두에게 전송
    public void receiveall(Msg msg, SimpMessageHeaderAccessor headerAccessor) {
        // 화면에서 receiveall이라는 주소로 요청
        // 요청을 받아서 send로 msg를 다 뿌리겠다
        log.info(msg.toString());

        template.convertAndSend("/send",msg);
    }
    @MessageMapping("/receiveme") // 나에게만 전송 ex)Chatbot
    public void receiveme(Msg msg, SimpMessageHeaderAccessor headerAccessor) {
        log.info(msg.toString());


        String id = msg.getSendid();
        template.convertAndSend("/send/"+id,msg);
        // send 뒤에 보낸사람아이디로 기다리는 놈에게 메세지를 보내겠다
    }
    @MessageMapping("/receiveto") // 특정 Id에게 전송
    public void receiveto(Msg msg, SimpMessageHeaderAccessor headerAccessor) {
        // 화면에서 receiveto이라는 주소로 요청
        String id = msg.getSendid();
        // 메세지가 들어옴
        // 누구에게 보낼 건지 타켓이 있음
        // 타켓을 붙여서 msg를 보내면 해당 타켓한테만 메세지가 전송됨
        String target = msg.getReceiveid();
        log.info("-------------------------");
        log.info(target);

        template.convertAndSend("/send/to/"+target,msg);
        // send 뒤에 to 뒤에 target을 끄집어내서 해당하는 놈에게 메세지를 보내겠다
    }
}