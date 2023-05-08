package com.kbstar;

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
        registry.addEndpoint("/ws").setAllowedOrigins("http://127.0.0.1").withSockJS();
        registry.addEndpoint("/chbot").setAllowedOrigins("http://127.0.0.1").withSockJS();
        registry.addEndpoint("/wss").setAllowedOrigins("http://127.0.0.1").withSockJS();
        // setAllowedOrigin(127.0.0.1로 들어오는 모든 서버들은 우리 서버로 들어올 수 있게 허용하겠다.)
        // 단순하게 말해선, Service단에서(127.0.0.1)로 들어온 브라우저도 우리 서버 접속이 가능하게 하겠다.
        // 서버 소켓을 3개 만든 것임.
    }

    /* 어플리케이션 내부에서 사용할 path를 지정할 수 있음 */
    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
        registry.enableSimpleBroker("/send","/broadcast");
    }
}