package com.kh.checkmate.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmate.member.model.vo.Member;

@Repository
public class MemberDao {

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("mamberMapper.loginMember",m);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("mamberMapper.insertMember",m);
	}
	
	public int insertMember2(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("mamberMapper.insertMember2",m);
	}

	public int idCheck(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("mamberMapper.idCheck",userId);
	}

	public int nickCheck(SqlSessionTemplate sqlSession, String userNick) {
		return sqlSession.selectOne("mamberMapper.nickCheck",userNick);
	}

	

}
