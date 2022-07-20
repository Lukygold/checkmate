package com.kh.checkmate.reservation.controller;

import java.util.ArrayList;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.checkmate.reservation.model.service.ReservationService;
import com.kh.checkmate.reservation.model.vo.Room;


@Controller
public class ReservationController {

	@Autowired
	private ReservationService reservationService;


	@RequestMapping(value = "/", method = RequestMethod.GET)
		public String homeController(Locale locale, Model model) {
		
			ArrayList<Room> list =reservationService.home();
			model.addAttribute("list",list);
			return "reservation/selectAllReservation";
		}
	@ResponseBody
	@RequestMapping(value="reserveRoomSize.ro",produces="application/json; charset=UTF-8")
	public String selectRoomSize (String roomCenterName) {

		ArrayList<Room> list = reservationService.selectRoomSize(roomCenterName);
	
		return new Gson().toJson(list);
	}
	@ResponseBody
	@RequestMapping(value="reserveRoomName.ro",produces="application/json; charset=UTF-8")
	public String selelctRoomName(String roomCenterName,int roomSize) {

		Room r = new Room();
		r.setRoomCenterName(roomCenterName);
		r.setRoomSize(roomSize);
		ArrayList<Room>list = reservationService.selectRoomName(r);
	
		return new Gson().toJson(list);
	}
}


