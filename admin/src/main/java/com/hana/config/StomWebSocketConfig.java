package com.hana.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@EnableWebSocketMessageBroker
@Configuration
public class StomWebSocketConfig implements WebSocketMessageBrokerConfigurer{

    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        //registry.addEndpoint("/ws").setAllowedOrigins("http://127.0.0.1").withSockJS();
        registry.addEndpoint("/ws").setAllowedOriginPatterns("*").withSockJS();
        // ws로 들어온 채널은 다 열어놓겠다
        // registry.addEndpoint("/ws").setAllowedOrigins("http://172.16.21.50").withSockJS();
        // http://127.0.0.1 로 접속한 서버에서 ws로 들어올 수 있게 하겠다

//        registry.addEndpoint("/chbot").setAllowedOrigins("http://127.0.0.1").withSockJS();
//        registry.addEndpoint("/wss").setAllowedOrigins("http://127.0.0.1").withSockJS();
    }

    /* 어플리케이션 내부에서 사용할 path를 지정할 수 있음 */
    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
        registry.enableSimpleBroker("/send","/broadcast");
    }
}