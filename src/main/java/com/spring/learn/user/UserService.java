package com.spring.learn.user;

import java.util.List;

public interface UserService {

	UserVO getUser(UserVO vo);
	void insertUser(UserVO vo);
	
	//findUserId
	List<UserVO> findUserIdList(UserVO user);
	String findUserId(UserVO user);
	
	//changePassWord
	void changePwd(UserVO user);
	
	//deleteUser
	void deleteUser(UserVO user);
}
