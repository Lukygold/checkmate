package com.kh.checkmate.studyGroupMember.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class StudyGroupMemberDao {

	public int insertStudyGroupMember(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.update("studyGroupMemberMapper.insertStudyGroupMember", map);
	}

}
