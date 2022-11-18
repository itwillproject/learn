package com.spring.learn.callcenter.impl;

import com.spring.learn.callcenter.CallCenterService;
import com.spring.learn.callcenter.CallCenterVO;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("callCenterService")
public class CallCenterImpl implements CallCenterService {
  @Autowired
  private CallCenterDAO callCenterDAO;

  @Override
  public List<CallCenterVO> getCallCenterList(CallCenterVO vo) {
    return callCenterDAO.getCallCenterList(vo);
  }
}
