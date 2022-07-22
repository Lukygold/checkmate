package com.kh.checkmate.board.sharingInformation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class userTrackerController {
	
	@RequestMapping("api.si")
	public String selectList() {

		return "board/sharingInformation/test2";
	}
}
