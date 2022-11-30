package com.spring.learn.board;

import java.util.List;
import java.util.Map;

import com.spring.learn.memberboard.MemberBoardVO;

public interface BoardService {
	void updateBoard(BoardVO vo);
	void deleteBoard(BoardVO vo);

	BoardVO getBoard(BoardVO vo); // 1개의 데이터 조회
	List<BoardVO> getBoardList(BoardVO vo); // 전체글 조회
	
	
	void insertQnaBoard(BoardVO bvo); // qna보드 입력
	void insertFreeBoard(BoardVO bvo); // free보드 입력
	
	int countQnaBoard(BoardVO bvo); // qna 보드 수량 검색	
	List<BoardVO> getQnaBoardList(Map<String, String> map); // qna 보드 가져오기
	List<BoardCommentVO> getComment(BoardVO bvo);

	
}