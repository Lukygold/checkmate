package com.kh.checkmate.board.sharingInformation.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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

		model.addAttribute("list", list);
		model.addAttribute("pi", pi);

		return "board/sharingInformation/siListView";
	}

	@RequestMapping("enrollForm.si")
	public String siEnrollForm() {
		return "board/sharingInformation/siEnrollForm";
	}
	
	@RequestMapping("insert.bo")
	public String insertBoard(SharingInformation b, MultipartFile upfile, HttpSession session, Model model) {
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = saveFile(upfile,session);
			b.setInformationOriginName(upfile.getOriginalFilename());
			b.setInformationChangeName("resources/uploadFiles/"+changeName);
		}
		
		int result = sharingInformationService.insertBoard(b);
 		System.out.println(b);
		if(result>0) {
			session.setAttribute("alertMsg", "게시글을 작성하셨습니다.");
			return "redirect:list.bo";
		}else { 
			model.addAttribute("errorMsg", "게시글 작성 실패");
			return "common/errorPage";
		}
		
	}

	@RequestMapping("detail.si")
	public ModelAndView selectBoard(int informationNo, ModelAndView mv) {
		int result = sharingInformationService.increaseCount(informationNo);
		
		if (result > 0) {
			SharingInformation b = sharingInformationService.selectBoard(informationNo);
			System.out.println(b);
			mv.addObject("b", b).setViewName("board/sharingInformation/siDetailView");
		} else {
			mv.addObject("errorMsg", "게시글 조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("updateForm.si")
	public String updateForm(int informationNo, Model model) {
		SharingInformation b = sharingInformationService.selectBoard(informationNo);
		
		model.addAttribute("b", b);
		
		return "board/sharingInformation/siUpdateForm";
	}
	
	@RequestMapping("update.si")
	public ModelAndView updateBoard(ModelAndView mv, MultipartFile upfile, SharingInformation b, HttpSession session) {
		
//		if(!upfile.getOriginalFilename().equals("")) {
//			if(!b.getOriginName().equals("")) {
//				new File(session.getServletContext().getRealPath(b.getChangeName())).delete();
//			}
//			
//			String changeName = saveFile(upfile,session);
//			
//			b.setOriginName(upfile.getOriginalFilename());
//			b.setChangeName("resources/uploadFiles/"+changeName);
//		}
		System.out.println(b.getInformationNo());
		System.out.println(b);
		int result = sharingInformationService.updateBoard(b);
		
		if(result>0) {
			session.setAttribute("alertMsg", "게시글 수정 성공");
			mv.setViewName("redirect:detail.si?informationNo="+b.getInformationNo());
		}else {
			mv.addObject("errorMsg","게시글 수정 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	public String saveFile(MultipartFile upfile,HttpSession session) {
		
		String originName = upfile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		int ranNum = (int)(Math.random() * 90000 + 10000);
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime+ranNum+ext;
		
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		try {
			upfile.transferTo(new File(savePath+changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
		
	}

}
