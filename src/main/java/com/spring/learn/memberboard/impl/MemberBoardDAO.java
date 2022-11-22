package com.spring.learn.memberboard.impl;

import java.util.List;

import com.spring.learn.memberboard.MemberBoardVO;

public interface MemberBoardDAO {
	
	// 메소드명이 Mapper 파일의 id명으로 사용
	void insertBoard(MemberBoardVO vo);
	void updateBoard(MemberBoardVO vo);
	void deleteBoard(MemberBoardVO vo);
	MemberBoardVO getBoard(MemberBoardVO vo);
	List<MemberBoardVO> getBoardList(MemberBoardVO vo);
	List<MemberBoardVO> resolvedCBoardList(MemberBoardVO vo);
	List<MemberBoardVO> unResolvedCBoardList(MemberBoardVO vo);
}





