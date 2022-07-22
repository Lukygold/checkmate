package com.kh.checkmate.studyGroup.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmate.studyGroup.model.vo.StudyGroup;

@Repository
public class StudyGroupDao {

	public int nameCheck(SqlSessionTemplate sqlSession, String sgName) {
		return sqlSession.selectOne("studyGroupMapper.nameCheck",sgName);
	}

	public int insertStudyGroup(SqlSessionTemplate sqlSession, StudyGroup sg) {
		return sqlSession.insert("studyGroupMapper.insertStudyGroup", sg);
	}

}
