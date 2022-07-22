package com.kh.checkmate.studyGroup.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.checkmate.studyGroup.model.service.StudyGroupService;
import com.kh.checkmate.studyGroup.model.vo.StudyGroup;


@Controller
public class StudyGroupController {
	
	@Autowired
	private StudyGroupService studyGroupService;
	
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
	
	@ResponseBody
	@RequestMapping(value="nameCheck.sg", produces="text/html; charset=UTF-8")
	public String nickCheck(String sgName) {
		
		int result = studyGroupService.nameCheck(sgName);
		
		if(result>0) {
			return "N";
		}else {
			return "Y";
		}
	}
	
	@RequestMapping("insert.sg")
	public String insertStudyGroup(StudyGroup sg, HttpSession session, Model model) {
		
		int result = studyGroupService.insertStudyGroup(sg);
		
		if(result>0) {
			session.setAttribute("alertMsg", "스터디그룹 생성 성공");
			return "redirect:/";
		}
		else {
			model.addAttribute("errorMsg","스터디그룹 생성 실패");
			return "common/errorPage";
		}
		
	}
	
	
	
	
}
