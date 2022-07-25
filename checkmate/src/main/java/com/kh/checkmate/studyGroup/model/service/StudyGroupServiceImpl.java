package com.kh.checkmate.studyGroup.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.checkmate.studyGroup.model.dao.StudyGroupDao;
import com.kh.checkmate.studyGroup.model.vo.StudyGroup;

@Service
public class StudyGroupServiceImpl implements StudyGroupService {

	@Autowired
	private StudyGroupDao studyGroupDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int nameCheck(String sgName) {
		return studyGroupDao.nameCheck(sqlSession, sgName);
	}

	@Override
	public int insertStudyGroup(StudyGroup sg) {
		return studyGroupDao.insertStudyGroup(sqlSession, sg);
	}

}
