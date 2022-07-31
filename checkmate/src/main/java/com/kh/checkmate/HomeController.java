package com.kh.checkmate;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.checkmate.common.model.vo.PageInfo;
import com.kh.checkmate.common.template.Pagination;
import com.kh.checkmate.member.model.service.MemberService;
import com.kh.checkmate.member.model.vo.Member;
import com.kh.checkmate.studyGroup.model.service.StudyGroupService;
import com.kh.checkmate.studyGroup.model.vo.StudyGroup;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	private StudyGroupService studyGroupService;

	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {

		// explore용 model
		int listCount = studyGroupService.selectListCount();
		int pageLimit = 10;
		int boardLimit = 10;
		int currentPage = 1;
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		ArrayList<StudyGroup> studyGroupList = studyGroupService.studyGroupList(pi);
		ArrayList<StudyGroup> oneStudyGroupList = studyGroupService.oneStudyGroupList();
		model.addAttribute("oneStudyGroupList", oneStudyGroupList);
		model.addAttribute("studyGroupList", studyGroupList);
		// explore용 model 끝

		return "main";

	}

}
