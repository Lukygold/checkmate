package com.kh.checkmate.reservation.model.dao;



import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmate.reservation.model.vo.Room;

@Repository
public class ReservationDao {

	public ArrayList<Room> home(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("reservationMapper.home");
	}

	public ArrayList<Room> selectRoomSize(SqlSessionTemplate sqlSession, String roomCenterName) {
		return (ArrayList)sqlSession.selectList("reservationMapper.selectRoomSize",roomCenterName);
	}

	public ArrayList<Room> selectRoomName(SqlSessionTemplate sqlSession,Room r) {
		return (ArrayList)sqlSession.selectList("reservationMapper.selectRoomName",r);
	}



	
}
