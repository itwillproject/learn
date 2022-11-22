package com.spring.learn.memberboard;

import java.util.List;

public interface MemberBoardService {
	void insertBoard(MemberBoardVO vo);
	void updateBoard(MemberBoardVO vo);
	void deleteBoard(MemberBoardVO vo);
	MemberBoardVO getBoard(MemberBoardVO vo); // 1개의 데이터 조회
	List<MemberBoardVO> getBoardList(MemberBoardVO vo); // 전체글 조회
	List<MemberBoardVO> resolvedCBoardList(MemberBoardVO vo);
	List<MemberBoardVO> unResolvedCBoardList(MemberBoardVO vo);
	
	
	
	
}