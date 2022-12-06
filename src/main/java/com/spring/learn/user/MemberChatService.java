package com.spring.learn.user;

import java.util.List;

public interface MemberChatService {

	MemberChatRoomListVO getChatroom(MemberChatRoomListVO mcrlvo);

	void addChatroom(MemberChatRoomListVO mcrlvo);

	String getName(String senderId);

	List<MemberChatContentsVO> getMemberChatContents(MemberChatRoomListVO mcrlvo);
	
		
	
	
}
