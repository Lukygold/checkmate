package com.kh.checkmate.studyGroup.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.checkmate.common.model.vo.PageInfo;
import com.kh.checkmate.studyGroup.model.vo.StudyGroup;

public interface StudyGroupService {
	
	int nameCheck(String sgName);

	int insertStudyGroup(StudyGroup sg);
	
	int updateStudyGroup(StudyGroup sg);
	
	//구대영
	StudyGroup studyGroupDetail(int sgNo);

	int selectListCount();

	ArrayList<StudyGroup> studyGroupList(PageInfo pi);

	StudyGroup studyGroupNoSelect(StudyGroup sg);

	
}
