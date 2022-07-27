package com.kh.checkmate.chat.model.service;

import java.util.List;
import java.util.Map;

import com.kh.checkmate.chat.model.vo.Chat;

public interface ChatService {

	List<Chat> selectChatList(Map<String, Object> map);

	List<Chat> selectFirstChatList(int roomNo);

	int insertChat(Chat chat);
}
