package com.spring.learn.board;

import java.util.List;

public interface BoardService {
	void insertBoard(BoardVO vo);
	void updateBoard(BoardVO vo);
	void deleteBoard(BoardVO vo);

	BoardVO getBoard(BoardVO vo); // 1개의 데이터 조회
	List<BoardVO> getBoardList(BoardVO vo); // 전체글 조회

	
}