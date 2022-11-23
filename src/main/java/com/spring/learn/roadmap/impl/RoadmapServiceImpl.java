package com.spring.learn.roadmap.impl;

import com.spring.learn.roadmap.RoadmapService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoadmapServiceImpl implements RoadmapService {

  @Autowired
  private RoadmapDAO roadmapDAO;

  public RoadmapServiceImpl() {
    System.out.println(">> RoadmapServiceImpl 생성");
  }

}
