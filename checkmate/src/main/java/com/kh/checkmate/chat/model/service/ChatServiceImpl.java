package com.kh.checkmate.chat.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.checkmate.chat.model.dao.ChatDao;
import com.kh.checkmate.chat.model.vo.Chat;

@Service
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	private ChatDao chatDao;
	
	@Override
	public List<Chat> selectChatList(Map<String, Object> map) {
		
		List<Chat> list = chatDao.selectchatList(map);
		return list;
	}

	@Override
	public List<Chat> selectFirstChatList(int roomNo) {
		
		return chatDao.selectFirstChatList(roomNo);
	}

	@Override
	public int insertChat(Chat chat) {
		return chatDao.insertChat(chat);
	}
	

}
