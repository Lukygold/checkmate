package com.kh.checkmate.chat.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.checkmate.chat.model.service.ChatService;
import com.kh.checkmate.chat.model.vo.Chat;

@Controller
public class ChatController {
	
	@Autowired
	private ChatService chatService;
	
//	//채팅창으로 입장 // 임의 테스트
//	@RequestMapping("chat.do")
//    public ModelAndView enterChat(@RequestParam int sgNo,ModelAndView mav, HttpSession session) {
//		String userNick = (String)session.getAttribute("userNick");
//		List<Chat> firstList = chatService.selectFirstChatList(sgNo);
//		mav.addObject("sgNo",sgNo);
//		mav.addObject("userNick",userNick);
//		mav.addObject("firstList",firstList);
//		mav.setViewName("chat/chatting");
//    	return mav;
//    }
//	
//	//채팅 내역 가져오기
//	@RequestMapping("/chat/chatList.do")
//	@ResponseBody
//	public List<Chat> selectChatList(@RequestParam int roomNo,@RequestParam int endNo) {
//		int startNo = endNo-11;
////		int roomNo = Integer.parseInt(room);
//
//			
//		Map<String,Object> map = new HashMap<>();
//		map.put("roomNo", roomNo);
//		map.put("startNo",endNo-1);
////		map.put("endNo", endNo-1);
//		List<Chat> list = chatService.selectChatList(map);
//		
////		mav.addObject("list", list);
////		mav.addObject("roomNo",roomNo);
////		mav.setViewName("mypage2/chatting");
//		return list;
//	}

	// 채팅 메세지 전달
    @MessageMapping("/hello/{roomNo}")
    @SendTo("/subscribe/chat/{roomNo}")
    public Chat broadcasting(Chat chat) {
    	
        chat.setChatSendDate(new Date());
        
        return chat;
    }
    
  //채팅 저장
    @RequestMapping("insertChat.do")
    @ResponseBody
    public int insertChat(Chat chat) {

    	int result = chatService.insertChat(chat);
    	return result;
    }
    
    @RequestMapping("chat.do")
    public String chat() {
    	return "chat/chatting";
    }
    
}
