package com.spring.learn.lecture.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.learn.lecture.OfftimetableService;

@Service("offtimetableService")
public class OfftimetableServiceImpl implements OfftimetableService {

	@Autowired //타입이 일치하는 객체(인스턴스)주입 (DI)
	private OfftimetableDAO OfftimetableDAO;

	public OfftimetableServiceImpl() {
		System.out.println(">> OfftimetableServiceImpl() 객체 생성");
	}
	
	
}
