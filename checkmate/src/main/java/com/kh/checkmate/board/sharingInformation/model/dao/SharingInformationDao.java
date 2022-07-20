package com.kh.checkmate.board.sharingInformation.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

	public int increaseCount(SqlSessionTemplate sqlSession, int sino) {
		return sqlSession.update("sharingInformationMapper.increaseCount",sino);
	}
}
