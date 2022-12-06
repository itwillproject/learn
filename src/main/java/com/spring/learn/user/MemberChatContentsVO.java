package com.spring.learn.user;

public class MemberChatContentsVO {
	private String chatroomNo, senderId, chatContent, chatRegdate;

	public String getChatroomNo() {
		return chatroomNo;
	}

	public void setChatroomNo(String chatroomNo) {
		this.chatroomNo = chatroomNo;
	}

	public String getSenderId() {
		return senderId;
	}

	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}

	public String getChatContent() {
		return chatContent;
	}

	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}

	public String getChatRegdate() {
		return chatRegdate;
	}

	public void setChatRegdate(String chatRegdate) {
		this.chatRegdate = chatRegdate;
	}

	@Override
	public String toString() {
		return "MemberChatContentsVO [chatroomNo=" + chatroomNo + ", senderId=" + senderId + ", chatContent="
				+ chatContent + ", chatRegdate=" + chatRegdate + "]";
	}

}
