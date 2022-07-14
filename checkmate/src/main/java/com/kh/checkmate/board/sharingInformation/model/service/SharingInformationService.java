package com.kh.checkmate.board.sharingInformation.model.service;

import java.util.ArrayList;

import com.kh.checkmate.board.sharingInformation.model.vo.SharingInformation;
import com.kh.checkmate.common.model.vo.PageInfo;
import com.kh.checkmate.common.template.Pagination;


public interface SharingInformationService {
	//게시판 리스트 조회 + 페이징처리
	//전체 게시글 수 구하기
	int selectListCount();
	//게시글 리스트 조회
	ArrayList<SharingInformation> selectList(PageInfo pi);
	
	//게시글 작성하기
	int insertBoard(SharingInformation b);
	
	//게시글 상세조회
	//게시글 조회수 증가
	int increaseCount(int boardNo);
	
	//게시글 상세조회
	public abstract SharingInformation selectBoard(int boardNo); 
	
	//게시글 삭제
	public abstract int deleteBoard(int boardNo);
	
	//게시글 수정
	public abstract int updateBoard(SharingInformation b);
	
//	//댓글 리스트 조회 
//	public abstract ArrayList<Reply> selectReplyList(int boardNo);
//	
//	//댓글 작성
//	public abstract int insertReply(Reply r);
//	
//	//게시글 top5 조회
//	ArrayList<Board> selectTopList();
}
