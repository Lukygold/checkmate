package com.kh.checkmate.board.sharingInformation.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.checkmate.board.sharingInformation.model.vo.Reply;
import com.kh.checkmate.board.sharingInformation.model.vo.SharingInformation;
import com.kh.checkmate.common.model.vo.PageInfo;

@Repository
public class SharingInformationDao {
	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("sharingInformationMapper.selectListCount");
	}

	public ArrayList<SharingInformation> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
 		return (ArrayList)sqlSession.selectList("sharingInformationMapper.selectList",null,rowBounds);
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int informationNo) {
		return sqlSession.update("sharingInformationMapper.increaseCount",informationNo);
	}

	public SharingInformation selectBoard(SqlSessionTemplate sqlSession, int informationNo) {
		return sqlSession.selectOne("sharingInformationMapper.selectBoard",informationNo);
	}

	public int updateBoard(SqlSessionTemplate sqlSession, SharingInformation b) {
		return sqlSession.update("sharingInformationMapper.updateBoard",b);
	}

	public int insertBoard(SqlSessionTemplate sqlSession, SharingInformation b) {
		return sqlSession.insert("sharingInformationMapper.insertBoard",b);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("sharingInformationMapper.deleteBoard",boardNo);
	}

	public ArrayList<SharingInformation> searchList(SqlSessionTemplate sqlSession, PageInfo pi, SharingInformation b) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset,limit);
		
 		return (ArrayList)sqlSession.selectList("sharingInformationMapper.searchList",b,rowBounds);
	}

	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int informationNo) {
		return (ArrayList)sqlSession.selectList("sharingInformationMapper.selectReplyList",informationNo);
	}

	public Reply checkNo(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.selectOne("sharingInformationMapper.checkNo", r);
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("sharingInformationMapper.insertReply",r);
	}
	
	
	// 취업정보공유 게시판
	public int jobSelectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("jobSharingInformationMapper.jobSelectListCount");
	}

	public ArrayList<SharingInformation> jobSelectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("jobSharingInformationMapper.jobSelectList",null,rowBounds);
	}

	public int jobInsertBoard(SqlSessionTemplate sqlSession, SharingInformation b) {
		return sqlSession.insert("jobSharingInformationMapper.jobInsertBoard",b);
	}

	public int jobIncreaseCount(SqlSessionTemplate sqlSession, int informationNo) {
		return sqlSession.update("jobSharingInformationMapper.jobIncreaseCount",informationNo);
	}

	public SharingInformation jobSelectBoard(SqlSessionTemplate sqlSession, int informationNo) {
		return sqlSession.selectOne("jobSharingInformationMapper.jobSelectBoard",informationNo);
	}

	public int jobDeleteBoard(SqlSessionTemplate sqlSession, int informationNo) {
		return sqlSession.update("jobSharingInformationMapper.jobDeleteBoard",informationNo);
	}

	public int jobUpdateBoard(SqlSessionTemplate sqlSession, SharingInformation b) {
		return sqlSession.update("jobSharingInformationMapper.jobUpdateBoard",b);
	}

	public ArrayList<SharingInformation> jobSearchList(SqlSessionTemplate sqlSession, PageInfo pi,
			SharingInformation b) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset,limit);
		
 		return (ArrayList)sqlSession.selectList("jobSharingInformationMapper.jobSearchList",b,rowBounds);
	}

	public ArrayList<Reply> jobSelectReplyList(SqlSessionTemplate sqlSession, int informationNo) {
		return (ArrayList)sqlSession.selectList("jobSharingInformationMapper.jobSelectReplyList",informationNo);
	}

	public int jobInsertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("jobSharingInformationMapper.jobInsertReply",r);
	}

}
