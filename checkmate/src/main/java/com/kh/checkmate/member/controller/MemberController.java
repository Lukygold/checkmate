package com.kh.checkmate.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.checkmate.member.model.service.MemberService;
import com.kh.checkmate.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m,HttpSession session,ModelAndView mv) {
		
		
		Member loginUser = memberService.loginMember(m);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getUserPw(), loginUser.getUserPw())) {
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:/");
		}else {
			mv.addObject("errorMsg","로그인 실패");
			mv.setViewName("common/errorPage");
			
		}
		
		return mv;	
	}
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping(value="idcheck.me",produces = "text/html; charset=UTF-8")
	public String idcheck(String userId) {
	
		int result = memberService.idCheck(userId);
		
		if(result>0) {
			return "N";
		}else {
			return "Y";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="nickCheck.me",produces = "text/html; charset=UTF-8")
	public String nickCheck(String userNick) {
		
		int result = memberService.nickCheck(userNick);
		if(result>0) {
			return "N";
		}else {
			return "Y";
		}
	}
	
	@RequestMapping("insert.me")
	public String insertMember(Member m,MultipartFile profile,HttpSession session,Model model) {
		
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPw());		
		m.setUserPw(encPwd);
		
		if(!profile.getOriginalFilename().equals("")) {
			String changeName = saveFile(profile,session);
			m.setUserOriginProfile(profile.getOriginalFilename());
			m.setUserChangeProfile("resources/uploadFiles/"+changeName);
			
			int result = memberService.insertMember2(m);		
			
			if(result>0) {
				
				session.setAttribute("alertMsg", "회원가입 성공");
				return "redirect:/";
			}else {
				
				model.addAttribute("errorMsg","회원가입 실패");
				return "common/errorPage";
			}
			
			
		}else {
			int result = memberService.insertMember(m);		
			System.out.println(m);
			if(result>0) {
				
				session.setAttribute("alertMsg", "회원가입 성공");
				return "redirect:/";
			}else {
				
				model.addAttribute("errorMsg","회원가입 실패");
				return "common/errorPage";
			}
			
		}
		
		
		
	}
	
	@RequestMapping("memberEnrollForm.me")
	public String memberEnrollForm() {
		
		return "member/memberEnrollForm";
	}
	
	@RequestMapping("memberLoginForm.me")
	public String memberLoginForm() {
		return "member/memberLoginForm";
	}
	
	public String saveFile(MultipartFile upfile,HttpSession session) {
		String originName = upfile.getOriginalFilename(); 
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random()*90000+10000); 
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
	
	@RequestMapping(value="/phoneCheck", method =RequestMethod.GET)
	@ResponseBody
	public String sendSMS(@RequestParam("phone") String userPhoneNumber) {
		
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성
		
		if(userPhoneNumber.matches("^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$")) {
			memberService.certifiedPhoneNumber(userPhoneNumber,randomNumber);
					
			return Integer.toString(randomNumber);
		}else {
			return "error";
		}
				
	}
}
