package com.kh.checkmate.chat.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.checkmate.chat.model.vo.Chat;

@Repository
public class ChatDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Chat> selectchatList(Map<String, Object> map) {
		
		return sqlSession.selectList("chat.selectChatList",map);
	}

	public List<Chat> selectFirstChatList(int roomNo) {
		return sqlSession.selectList("chat.selectFirstChatList",roomNo);
	}
	
	public int insertChat(Chat chat) {
		return sqlSession.insert("chat.insertChat",chat);
	}
}
