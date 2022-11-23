package com.spring.learn.memberboard.impl;

import java.util.List;
import java.util.Map;

import com.spring.learn.board.BoardVO;
import com.spring.learn.memberboard.CallcenterCommentVO;
import com.spring.learn.memberboard.MemberBoardVO;

public interface MemberBoardDAO {
	// 메소드명이 Mapper 파일의 id명으로 사용
	void insertBoard(MemberBoardVO vo);
	void updateBoard(MemberBoardVO vo);
	void deleteBoard(MemberBoardVO vo);
	MemberBoardVO getBoard(MemberBoardVO vo);
	List<MemberBoardVO> getBoardList(Map<String, String> map);
	int countBoard(MemberBoardVO vo);
	void addCallcenterComment(CallcenterCommentVO cvo);
	List<CallcenterCommentVO> getCallcenterComment(MemberBoardVO bvo);
	void delCallcenterComment(CallcenterCommentVO cvo);	
}





