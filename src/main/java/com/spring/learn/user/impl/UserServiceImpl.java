package com.spring.learn.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.learn.user.UserService;
import com.spring.learn.user.UserVO;

// UserService 구현
@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;

	@Override
	public UserVO getUser(UserVO vo) {
		return userDAO.getUser(vo);
	}

	@Override
	public void insertUser(UserVO vo) {
		userDAO.insertUser(vo);
	}

	
	@Override
	public List<String> findUserIdList(UserVO user) {
		return userDAO.findUserIdList(user);
	}


	@Override
	public String findUserId(UserVO user) {
		return userDAO.findUserId(user);
	}

}
