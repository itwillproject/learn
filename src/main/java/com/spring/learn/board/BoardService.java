package com.spring.learn.board;

import java.util.List;

public interface BoardService {
	void insertBoard(BoardVO vo);
	void updateBoard(BoardVO vo);
	void deleteBoard(BoardVO vo);
	BoardVO getBoard(BoardVO vo); // 1���� ������ ��ȸ
	List<BoardVO> getBoardList(BoardVO vo); // ��ü�� ��ȸ
	
	
}