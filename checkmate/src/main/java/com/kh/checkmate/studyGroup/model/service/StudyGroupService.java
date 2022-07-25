package com.kh.checkmate.studyGroup.model.service;

import com.kh.checkmate.studyGroup.model.vo.StudyGroup;

public interface StudyGroupService {
	
	int nameCheck(String sgName);

	int insertStudyGroup(StudyGroup sg);

}
