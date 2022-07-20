package com.kh.checkmate.reservation.model.service;

import java.util.ArrayList;

import com.kh.checkmate.reservation.model.vo.Reservation;
import com.kh.checkmate.reservation.model.vo.Room;

public interface ReservationService {

	//스타디센터 조회
	ArrayList<Room> home();
	//방인원 조회
	ArrayList<Room> selectRoomSize(String roomCenterName);
	//방이름 조회
	ArrayList<Room> selectRoomName(Room r);
	
	
	
	//전체 예약조회
	ArrayList<Reservation> selectAllReservation(Reservation r);
	//유저 예약조회
	Reservation selectUserReservation(String reservationUser);
	//예약
	int insertReservation(Reservation r);
	//예약취소
	int deleteReservation(String reservationUser);
}
