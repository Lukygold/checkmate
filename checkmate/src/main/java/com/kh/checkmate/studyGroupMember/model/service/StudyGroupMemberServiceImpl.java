package com.kh.checkmate.studyGroupMember.model.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.checkmate.studyGroupMember.model.dao.StudyGroupMemberDao;

@Service
public class StudyGroupMemberServiceImpl implements StudyGroupMemberService{

	@Autowired
	private StudyGroupMemberDao studyGroupMemberDao;

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertStudyGroupMember(Map<String, Object> map) {
		return studyGroupMemberDao.insertStudyGroupMember(sqlSession,map);
	}

}
