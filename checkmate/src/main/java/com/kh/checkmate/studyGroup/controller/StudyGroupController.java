package com.kh.checkmate.studyGroup.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StudyGroupController {

	@RequestMapping("studyGroupExploration.sg")
	public String studyGroupExploration() {
		return "studyGroup/studyGroupExploration";
	}
	
	@RequestMapping("studyGroupList.sg")
	public String studyGroupList() {
		return "studyGroup/studyGroupList";
	}
	
	@RequestMapping("studyGroupEnrollForm.sg")
	public String studyGroupEnrollForm() {
		return "studyGroup/studyGroupEnrollForm"; 
	}
	
	
	
}
