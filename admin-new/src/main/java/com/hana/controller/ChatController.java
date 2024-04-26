package com.hana.controller;

import com.hana.app.data.msg.Msg;
import com.hana.util.NcpUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequiredArgsConstructor
public class ChatController {

    final SimpMessagingTemplate template;

    @Value("${app.key.ncp-id}")
    String ncpid;
    @Value("${app.key.ncp-secret}")
    String ncpsecret;

   // 얘가 chat2에서 보낸 채팅 값을 받음
    @MessageMapping("/sendchat") // 특정 Id에게 전송
    public void sendchat(Msg msg, SimpMessageHeaderAccessor headerAccessor) {
        String id = msg.getSendid();
        // 누가 보냈냐
        String target = msg.getReceiveid();
        // 누구한테 보냈냐
        log.info("-------------------------");
        log.info(msg.toString());
        // 이 순서로 하면 나한테는 긍부정 안오고 관리자한테만 긍부정 분석데이터 붙어서 메세지가 날라감
        template.convertAndSend("/send3/to/"+id,msg);
        String sentiment = NcpUtil.getSentimentDetail(
                NcpUtil.getSentiment(ncpid, ncpsecret, msg.getContent1())
        );
        msg.setContent1(msg.getContent1()+" : "+sentiment);
        // 기존 메세지 : 부정긍정분석결과
        template.convertAndSend("/send3/to/"+target,msg);
        // 뭐라 보냈냐는 target에 날림
        // 나한테도 날림
    }
}
