package com.spring.learn.user;

import java.util.List;

public interface UserService {

	UserVO getUser(UserVO vo);
	void insertUser(UserVO vo);

	int getUserId(UserVO vo);
	int modifyUser(UserVO vo);

	
	//findUserId
	List<String> findUserIdList(UserVO user);
	String findUserId(UserVO user);

	
}
