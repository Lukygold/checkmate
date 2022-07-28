package com.kh.checkmate.studyGroup.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.checkmate.common.model.vo.PageInfo;
import com.kh.checkmate.common.template.Pagination;
import com.kh.checkmate.member.model.vo.Member;
import com.kh.checkmate.studyGroup.model.service.StudyGroupService;
import com.kh.checkmate.studyGroup.model.vo.StudyGroup;
import com.kh.checkmate.studyGroupApply.model.service.StudyGroupApplyService;
import com.kh.checkmate.studyGroupApply.model.vo.StudyGroupApply;
import com.kh.checkmate.studyGroupMember.controller.StudyGroupMemberController;
import com.kh.checkmate.studyGroupMember.model.service.StudyGroupMemberService;
import com.kh.checkmate.studyGroupMember.model.vo.StudyGroupMember;

@Controller
public class StudyGroupController {

	@Autowired
	private StudyGroupService studyGroupService;
	
	@Autowired
	private StudyGroupApplyService studyGroupApplyService;
	
	@Autowired
	private StudyGroupMemberService studyGroupMemberService;
	
	@Autowired
	private StudyGroupMemberController studyGroupMemeberController;

	@RequestMapping("studyGroupExploration.sg")
	public String studyGroupExploration() {
		return "studyGroup/studyGroupExploration";
	}

	@RequestMapping("studyGroupEnrollForm.sg")
	public String studyGroupEnrollForm() {
		return "studyGroup/studyGroupEnrollForm";
	}

	@ResponseBody
	@RequestMapping(value = "nameCheck.sg", produces = "text/html; charset=UTF-8")
	public String nickCheck(String sgName) {

		int result = studyGroupService.nameCheck(sgName);

		if (result > 0) {
			return "N";
		} else {
			return "Y";
		}
	}

	@RequestMapping("insert.sg")
	public String insertStudyGroup(StudyGroup sg, HttpSession session, Model model) {
		
		int result = studyGroupService.insertStudyGroup(sg);

		if (result > 0) {
			session.setAttribute("alertMsg", "스터디그룹 생성 성공");
			return studyGroupMemeberController.insertOwner(sg, session, model);
		} else {
			model.addAttribute("errorMsg", "스터디그룹 생성 실패");
			return "common/errorPage";
		}

	}
	
	@RequestMapping("update.sg")
	public String updateStudyGroup(StudyGroup sg, HttpSession session, Model model) {
		
		int result = studyGroupService.updateStudyGroup(sg);
		
		if (result > 0) {
			session.setAttribute("alertMsg", "스터디그룹 수정 성공");
			return "redirect:/";
		} else {
			model.addAttribute("errorMsg", "스터디그룹 수정 실패");
			return "common/errorPage";
		}
		
	}
	

	// 구대영
	@RequestMapping("studyGroupDetail.sg")
	public String studyGroupDetail(int sgNo, HttpSession session, Model model) {
		
		Member member = (Member)session.getAttribute("loginUser");

		ArrayList<StudyGroupApply> studyGroupApplyList = studyGroupApplyService.studyGroupApplyList(sgNo);
		model.addAttribute("studyGroupApplyList", studyGroupApplyList);
		int applyCount = studyGroupApplyService.applyCount(sgNo);
		model.addAttribute("applyCount", applyCount);
		
		StudyGroup studyGroup = studyGroupService.studyGroupDetail(sgNo);
		model.addAttribute("studyGroup", studyGroup);
		
		ArrayList<StudyGroupMember> studyGroupMember = studyGroupMemberService.memberList(sgNo);
		int memberCount = studyGroupMemberService.memberCount(sgNo);
		model.addAttribute("studyGroupMember", studyGroupMember);
		model.addAttribute("memberCount", memberCount);
	
		return "studyGroup/studyGroupDetail";
	}
	
	@RequestMapping("studyGroupList.sg")
	public String studyGroupList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model) {

		int listCount = studyGroupService.selectListCount();
		
		int pageLimit = 10;
		int boardLimit = 10;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		ArrayList<StudyGroup> studyGroupList = studyGroupService.studyGroupList(pi);
		
		model.addAttribute("studyGroupList", studyGroupList);
		model.addAttribute("pi", pi);

		return "studyGroup/studyGroupList";
	}
	
	
	
}
