package com.kh.checkmate.studyGroupMember.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.checkmate.studyGroupMember.model.service.StudyGroupMemberService;

@Controller
public class StudyGroupMemberController {
	
	@Autowired
	private StudyGroupMemberService studyGroupMemberService;

}
