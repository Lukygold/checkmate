package com.kh.checkmate.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmate.member.model.vo.Member;

@Repository
public class MemberDao {

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.loginMember",m);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember",m);
	}
	
	public int insertMember2(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember2",m);
	}

	public int idCheck(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("memberMapper.idCheck",userId);
	}

	public int nickCheck(SqlSessionTemplate sqlSession, String userNick) {
		return sqlSession.selectOne("memberMapper.nickCheck",userNick);
	}
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember",m);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("memberMapper.deleteMember",userId);
	}

	public int updatePwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updatePwd",m);
	}

	public int updateMember2(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember2",m);
	}
	

}
