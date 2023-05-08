package com.kbstar.controller;

import com.kbstar.dto.Msg;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

@Slf4j
@Controller
public class MsgController {
    @Autowired
    SimpMessagingTemplate template;

    @MessageMapping("/receiveall") // 모두에게 전송
    public void receiveall(Msg msg, SimpMessageHeaderAccessor headerAccessor) {
        //receiveAll이라는 라우터를 받으면 이 라우터는 전국 방방 곳곳으로
        //template에 메세지를 담아서 send라는 라우터로 뿌리고 있는 거고
        // 전국에 있는 라우터는 /send라고 되어있으면 subscribe해서 받게 되는 거지.
       log.info(String.valueOf(msg));
        template.convertAndSend("/send",msg);
        //즉, send라는 이미지로 메세지를 뿌리고 전국에 뿌리고 있는 거야
    }
    @MessageMapping("/receiveme") // 나에게만 전송 ex)Chatbot
    //sendMe에서는 receiveme에게만 보낸다고 했다. receiveme는 받아서...
    public void receiveme(Msg msg, SimpMessageHeaderAccessor headerAccessor) {
        log.info(String.valueOf(msg));

        String id = msg.getSendid();
        template.convertAndSend("/send/"+id,msg);
        // 내 아이디에 해당되는(즉 나한테만 template에 담아서 다시 보내라)
    }
    @MessageMapping("/receiveto") // 특정 Id에게 전송
    public void receiveto(Msg msg, SimpMessageHeaderAccessor headerAccessor) {
        String id = msg.getSendid();
        String target = msg.getReceiveid();
        // Websocket에서 보낼 때 SendTo 잘 보면 msg라는 JSON 택배상자에
        // target을 열어서 보시고,
        // WebSocket.jsp에서 target을 정해줬고, 해당 target은 어

        template.convertAndSend("/send/to/"+target,msg);
        // 탬플릿에 감싸서 메세지를 뿌려주자. target이라는 id를 담아서 말야.
    }
}

// Message 전체를 컨트럴해주는 MsgController
//recieveAll이라는 것으로 받으면 send라는 이름으로 메세지를 모두 뿌려버린다.