package com.spring.learn.callcenter.impl;

import com.spring.learn.callcenter.CallCenterVO;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class CallCenterDAO {
  @Autowired
  private SqlSessionTemplate mybatis;

  public List<CallCenterVO> getCallCenterList(CallCenterVO vo) {
    return mybatis.selectList("callCenterDAO.getCallCenterList", vo);
  }
}
