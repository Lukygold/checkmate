package com.kh.checkmate.board.sharingInformation.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.checkmate.board.sharingInformation.model.dao.SharingInformationDao;
import com.kh.checkmate.board.sharingInformation.model.vo.SharingInformation;
import com.kh.checkmate.common.model.vo.PageInfo;

@Service
public class SharingInformationServiceImpl implements SharingInformationService{
	
	@Autowired
	private SharingInformationDao sid;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		
		return sid.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<SharingInformation> selectList(PageInfo pi) {
		
		return sid.selectList(sqlSession,pi);
	}

	
	
	////////////////////////////////////////////////////////
	@Override
	public int insertBoard(SharingInformation b) {
		
//		return sid.insertBoard(sqlSession,b);
		return 0;
	}

	@Override
	public int increaseCount(int sino) {
		return sid.increaseCount(sqlSession,sino);
	}

	@Override
	public SharingInformation selectBoard(int boardNo) {
		SharingInformation SharingInformation = new SharingInformation();
//		return sid.selectBoard(sqlSession,boardNo);
		return SharingInformation;
	}

	@Override
	public int deleteBoard(int boardNo) {
//		return sid.deleteBoard(sqlSession,boardNo);
		return 0;
	}

	@Override
	public int updateBoard(SharingInformation b) {
//		return sid.updateBoard(sqlSession,b);
		return 0;
	}

//	@Override
//	public ArrayList<Reply> selectReplyList(int boardNo) {
//		return sid.selectReplyList(sqlSession,boardNo);
//	}
//
//	@Override
//	public int insertReply(Reply r) {
//		return sid.insertReply(sqlSession,r);
//	}

}
