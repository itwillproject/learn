package com.spring.learn.user;

import java.sql.Date;

public class ChatVO {
	private String userId, sendId, content, chatContents;
	private int chatNo, chatOk, contentNo;
	private Date regdate, chatRegdate;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSendId() {
		return sendId;
	}
	public void setSendId(String sendId) {
		this.sendId = sendId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getChatContents() {
		return chatContents;
	}
	public void setChatContents(String chatContents) {
		this.chatContents = chatContents;
	}
	public int getChatNo() {
		return chatNo;
	}
	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}
	public int getChatOk() {
		return chatOk;
	}
	public void setChatOk(int chatOk) {
		this.chatOk = chatOk;
	}
	public int getContentNo() {
		return contentNo;
	}
	public void setContentNo(int contentNo) {
		this.contentNo = contentNo;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getChatRegdate() {
		return chatRegdate;
	}
	public void setChatRegdate(Date chatRegdate) {
		this.chatRegdate = chatRegdate;
	}
	@Override
	public String toString() {
		return "ChatVO [userId=" + userId + ", sendId=" + sendId + ", content=" + content + ", chatContents="
				+ chatContents + ", chatNo=" + chatNo + ", chatOk=" + chatOk + ", contentNo=" + contentNo + ", regdate="
				+ regdate + ", chatRegdate=" + chatRegdate + "]";
	}
	
	

}
	