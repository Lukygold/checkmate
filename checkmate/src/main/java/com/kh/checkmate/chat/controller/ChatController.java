package com.kh.checkmate.chat.controller;

import java.util.Date;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.checkmate.chat.model.vo.Chat;

@Controller
public class ChatController {

//	@MessageMapping("/hello/{roomNo}")
//    @SendTo("/subscribe/chat/{roomNo}")
//	public Chat broadcasting(Chat chat) {
//	
//		chat.setSendDate(new Date());
//        
//        return chat;
//	}
	
	@RequestMapping("chat.do")
	public String chatTest() {
		return "chat/chatting";
	}
}
