package com.spring.learn.memberboard.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.learn.board.BoardService;
import com.spring.learn.memberboard.MemberBoardService;
import com.spring.learn.memberboard.MemberBoardVO;

// UserService
@Service("memberBoardService")
public class MemberBoardServiceImpl implements MemberBoardService {
	
	@Autowired
	private MemberBoardDAO memberBoardDAO;

	public MemberBoardServiceImpl() {
		System.out.println(">> BoardServiceImple 생성");
	}

	@Override
	public void insertBoard(MemberBoardVO vo) {
		memberBoardDAO.insertBoard(vo);
	}

	@Override
	public void updateBoard(MemberBoardVO vo) {
		memberBoardDAO.updateBoard(vo);
	}

	@Override
	public void deleteBoard(MemberBoardVO vo) {
		memberBoardDAO.deleteBoard(vo);
	}

	@Override
	public MemberBoardVO getBoard(MemberBoardVO vo) {		
		return memberBoardDAO.getBoard(vo);
	}

	@Override
	public List<MemberBoardVO> getBoardList(MemberBoardVO vo) {
		return memberBoardDAO.getBoardList(vo);
	}

	@Override
	public List<MemberBoardVO> resolvedCBoardList(MemberBoardVO vo) {
		// TODO Auto-generated method stub
		return memberBoardDAO.resolvedCBoardList(vo);
	}

	@Override
	public List<MemberBoardVO> unResolvedCBoardList(MemberBoardVO vo) {
		// TODO Auto-generated method stub
		return memberBoardDAO.unResolvedCBoardList(vo);
	}


  
}
