package com.kh.checkmate.common.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.checkmate.board.sharingInformation.model.service.SharingInformationService;
import com.kh.checkmate.common.model.service.CommonService;
import com.kh.checkmate.common.model.vo.PageInfo;
import com.kh.checkmate.common.template.Pagination;
import com.kh.checkmate.studyGroup.model.service.StudyGroupService;
import com.kh.checkmate.studyGroup.model.vo.StudyGroup;

@Controller
public class CommonController {

	@Autowired
	private CommonService commonService;

	@Autowired
	private StudyGroupService studyGroupService;
	
	@Autowired
	private SharingInformationService sharingInformationService;

	@RequestMapping("mainSearch.co")
	public String mainSearch(@RequestParam(value = "searchContent") String searchContent,
			@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model) {
		
		model.addAttribute("searchContent", searchContent); //검색한 단어 들고가기
		
		int pageLimit = 10;
		int boardLimit = 10;
		
		//검색결과 수(COUNT)
		int sgSearchCount = studyGroupService.searchListCount(searchContent);
		model.addAttribute("sgSearchCount", sgSearchCount);
//		int siSearchCount =  sharingInformationService.searchListCount(searchContent); 정보공유
//		int jsiSearchCount = sharingInformationService.searchListCount2(searchContent); 직업정보공유
//		int 고객센터SearchCount = 고객센터Service.searchListCount(searchContent); 고객센터
		
//		int totalListCount = sgSearchCount + siSearchCount + jsiSearchCount + 고객센터SearchCount; 지우세요
		int totalListCount = sgSearchCount;
		


		PageInfo pi = Pagination.getPageInfo(totalListCount, currentPage, pageLimit, boardLimit);

		//검색결과 리스트
		ArrayList<StudyGroup> sgSearchList = studyGroupService.sgSearchList(pi, searchContent);
		model.addAttribute("sgSearchList", sgSearchList);
		
		
		
		
		//테스트
		System.out.println(sgSearchCount);
		System.out.println(totalListCount);
		System.out.println(sgSearchList);


//		model.addAttribute("studyGroupList", studyGroupList);
		model.addAttribute("pi", pi);

		return "common/searchResult";
	}

}
