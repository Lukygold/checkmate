package com.kh.checkmate.reservation.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.checkmate.reservation.model.dao.ReservationDao;
import com.kh.checkmate.reservation.model.vo.Reservation;
import com.kh.checkmate.reservation.model.vo.Room;
@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationDao reservationDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Reservation> selectAllReservation(Reservation r) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Reservation selectUserReservation(String reservationUser) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertReservation(Reservation r) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReservation(String reservationUser) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Room> home() {
		return reservationDao.home(sqlSession);
	}

	@Override
	public ArrayList<Room> selectRoomSize(String roomCenterName) {
		return reservationDao.selectRoomSize(sqlSession,roomCenterName) ;
	}

	@Override
	public ArrayList<Room> selectRoomName(Room r) {
		return reservationDao.selectRoomName(sqlSession,r);
	}

}
