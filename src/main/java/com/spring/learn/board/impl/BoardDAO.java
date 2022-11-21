package com.spring.learn.board.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.learn.board.BoardVO;

public interface BoardDAO {
	// 메소드명이 Mapper 파일의 id명으로 사용
	void insertBoard(BoardVO vo);
	void updateBoard(BoardVO vo);
	void deleteBoard(BoardVO vo);
	BoardVO getBoard(BoardVO vo);
	List<BoardVO> getBoardList(BoardVO vo);
}





