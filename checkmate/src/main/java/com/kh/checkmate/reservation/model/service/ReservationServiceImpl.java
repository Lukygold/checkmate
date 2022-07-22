package com.kh.checkmate.reservation.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.checkmate.reservation.model.dao.ReservationDao;
import com.kh.checkmate.reservation.model.vo.Reservation;
@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationDao reservationDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Reservation selectUserReservation(String reservationUser) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertReservation(Reservation r) {
		return reservationDao.insertReservation(sqlSession,r);
	}

	@Override
	public int deleteReservation(String reservationUser) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Reservation> home() {
		return reservationDao.home(sqlSession);
	}

	@Override
	public ArrayList<Reservation> selectRoomSize(String roomCenterName) {
		return reservationDao.selectRoomSize(sqlSession,roomCenterName) ;
	}

	@Override
	public ArrayList<Reservation> selectRoomName(Reservation r) {
		return reservationDao.selectRoomName(sqlSession,r);
	}

	@Override
	public int selectRoomNo(Reservation r) {
		return reservationDao.selectRoomNo(sqlSession,r);
	}

	@Override
	public ArrayList<Reservation> selectReservationList(Reservation r) {
		return reservationDao.selectReservationList(sqlSession,r);
	}

}
