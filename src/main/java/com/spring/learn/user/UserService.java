package com.spring.learn.user;

public interface UserService {

	UserVO getUser(UserVO vo);
	void insertUser(UserVO vo);
	int getUserId(UserVO vo);
	int modifyUser(UserVO vo);
	
}
