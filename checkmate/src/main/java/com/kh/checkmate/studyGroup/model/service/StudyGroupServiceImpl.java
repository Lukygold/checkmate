package com.kh.checkmate.studyGroup.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.checkmate.common.model.vo.PageInfo;
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
	
	@Override
	public int updateStudyGroup(StudyGroup sg) {
		return studyGroupDao.updateStudyGroup(sqlSession, sg);
	}

	// 구대영
	@Override
	public StudyGroup studyGroupDetail(int sgNo) {
		return studyGroupDao.studyGroupDetail(sqlSession, sgNo);
	}

	@Override
	public int selectListCount() {
		return studyGroupDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<StudyGroup> studyGroupList(PageInfo pi) {
		return studyGroupDao.studyGroupList(sqlSession, pi);
	}

	@Override
	public StudyGroup studyGroupNoSelect(StudyGroup sg) {
		return studyGroupDao.studyGroupNoSelect(sqlSession, sg);
	}

}
