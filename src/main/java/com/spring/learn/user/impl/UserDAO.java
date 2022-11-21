package com.spring.learn.user.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.learn.user.UserVO;

@Repository
public class UserDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public UserDAO() {
		System.out.println("=========== UserDAOMybatis() 객체 생성");
	}
	
	public UserVO getUser(UserVO vo) {
		System.out.println("===> Mybatis 사용 getUser() 실행");
		return mybatis.selectOne("userDAO.getUser", vo);
	}
	
	public int insertUser(UserVO vo) {
		System.out.println("===> Mybatis 사용 insertUser() 실행");
		return mybatis.insert("userDAO.insertUser", vo);
	}
	
	
	public List<String> findUserIdList(UserVO user) {
		return mybatis.selectList("userDAO.findUserIdList", user);
	}
	
	public String findUserId(UserVO user) {
		return mybatis.selectOne("userDAO.findUserId", user);
	}
	

}





