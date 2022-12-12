package com.spring.learn.roadmap;

import java.sql.Date;

public class MyroadmapVO {
  private String rboardNo, userId;
  private Date roadmapStart;
  private int roadmapRate;
  private String searchKeyword, ordering
  ;

  public String getRboardNo() {
    return rboardNo;
  }

  public void setRboardNo(String rboardNo) {
    this.rboardNo = rboardNo;
  }

  public String getUserId() {
    return userId;
  }

  public void setUserId(String userId) {
    this.userId = userId;
  }

  public Date getRoadmapStart() {
    return roadmapStart;
  }

  public void setRoadmapStart(Date roadmapStart) {
    this.roadmapStart = roadmapStart;
  }

  public int getRoadmapRate() {
    return roadmapRate;
  }

  public void setRoadmapRate(int roadmapRate) {
    this.roadmapRate = roadmapRate;
  }
	
	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public String getOrdering() {
		return ordering;
	}

	public void setOrdering(String ordering) {
		this.ordering = ordering;
	}

	@Override
	public String toString() {
		return "MyroadmapVO [rboardNo=" + rboardNo + ", userId=" + userId + ", roadmapStart=" + roadmapStart
				+ ", roadmapRate=" + roadmapRate + ", searchKeyword=" + searchKeyword + ", ordering=" + ordering + "]";
	}

}
