package com.spring.learn.board.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.learn.board.NoticeVO;
import com.spring.learn.common.Criteria;
	
	@Repository
	public class NoticeDAO {
		
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public NoticeDAO() {
		System.out.println("=========== noticeDAOMybatis() 객체 생성");
	}
	  
	//글 1개 조회
	public NoticeVO getNotice(NoticeVO vo) {
		System.out.println("===> MyBatis 사용 getNotice() 실행");
	return mybatis.selectOne("noticeDAO.getNotice", vo);
	}
	  
	//글 리스트 조회
	public List<NoticeVO> getNoticeList(NoticeVO vo) {
		System.out.println("===> Mybatis 사용 getNoticeList() 실행");
	return mybatis.selectList("noticeDAO.getNoticeList");
	}
	  
	//조회수 추가
	public int updateNoticeHit(NoticeVO vo) {
		System.out.println("===> Mybatis 사용 updateNoticeHit() 실행");
	return mybatis.update("noticeDAO.updateNoticeHit");
	}
	  
	//게시글 목록 조회
	public List<NoticeVO> list(Criteria cri) {
		return mybatis.selectList("noticeDAO.listPage", cri);
	}
	  
	//게시글 총 갯수
	public int listCount() {
		return mybatis.selectOne("noticeDAO.listCount");
	}
  
	public List<NoticeVO> getBoardList(NoticeVO vo) {
		System.out.println("===> MyBatis 사용  getBoardList(vo) 실행");
		List<NoticeVO> list = mybatis.selectList("boardDAO.getBoardList_S", vo.getSearchKeyword());
		return list;
	}
		
}





