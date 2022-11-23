package com.spring.learn.user;

import java.util.List;

public interface UserService {

	UserVO getUser(UserVO vo);
	void insertUser(UserVO vo);

	int getUserId(UserVO vo);
	int modifyUser(UserVO vo);

	
	//findUserId
	List<UserVO> findUserIdList(UserVO user);
	UserVO findUserId(UserVO user);

	UserVO confirmUser(UserVO vo);
	
	//changePassWord
	void changePwd(UserVO user);
	
	//deleteUser
	void deleteUser(UserVO user);

	void addNaverUser(UserVO user);
}
