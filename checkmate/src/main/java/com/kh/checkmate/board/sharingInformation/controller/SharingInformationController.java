package com.kh.checkmate.board.sharingInformation.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.checkmate.board.sharingInformation.model.service.SharingInformationService;
import com.kh.checkmate.board.sharingInformation.model.vo.SharingInformation;
import com.kh.checkmate.common.model.vo.PageInfo;
import com.kh.checkmate.common.template.Pagination;

@Controller
public class SharingInformationController {

	@Autowired
	private SharingInformationService sharingInformationService;

	@RequestMapping("list.si")
	public String selectList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model) {

		int listCount = sharingInformationService.selectListCount();

		int pageLimit = 10;
		int boardLimit = 5;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		ArrayList<SharingInformation> list = sharingInformationService.selectList(pi);

		System.out.println(list);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);

		return "board/sharingInformation/siListView";
	}

	@RequestMapping("enrollForm.si")
	public String siEnrollForm() {
		return "board/sharingInformation/siEnrollForm";
	}

	@RequestMapping("detail.si")
	public ModelAndView selectBoard(int sino, ModelAndView mv) {
		int result = sharingInformationService.increaseCount(sino);
		
		if (result > 0) {
			 SharingInformation b = sharingInformationService.selectBoard(sino);
			mv.addObject("b", b).setViewName("board/sharingInformation/siDetailView");
		} else {
			mv.addObject("errorMsg", "게시글 조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}

}
