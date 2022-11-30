package com.spring.learn.board.impl;

import java.util.List;
import java.util.Map;

import com.spring.learn.board.BoardVO;
import com.spring.learn.board.BoardCommentVO;
import com.spring.learn.memberboard.MemberBoardVO;

public interface BoardDAO {
	// 메소드명이 Mapper 파일의 id명으로 사용
	void updateBoard(BoardVO vo);
	void deleteBoard(BoardVO vo);
	BoardVO getBoard(BoardVO vo);
	List<BoardVO> getBoardList(BoardVO vo);
	
	void insertQnaBoard(BoardVO bvo); // qna보드 입력
	void insertFreeBoard(BoardVO bvo); // free보드 입력
	int countQnaBoard(BoardVO bvo); // qna보드 전체 수 검색
	List<BoardVO> getQnaBoardList(Map<String, String> map); // qna보드 검색 가져오기
	List<BoardCommentVO> getComment(BoardVO bvo); // 코멘트 가져오기 , 안에서 분기처리 할 것
}





