package com.spring.learn.board;

import java.util.List;

import com.spring.learn.common.Criteria;

public interface NoticeService {
	NoticeVO getNotice(NoticeVO vo); //1개 데이터 조회
	List<NoticeVO> getNoticeList(NoticeVO vo); //전체 데이터 조회
	
	void updateNoticeHit(NoticeVO vo); //공지사항 조회수 업데이트
	List<NoticeVO> list(Criteria cri);//게시글 목록 조회
	int listCount();//게시글 총 갯수
	
	int searchListCount(NoticeVO vo); //검색어에 해당하는 게시글 총 갯수
	
}
