package com.spring.learn.board;

import java.util.List;

public interface FaqService {
	List<FaqVO> getFaqList(FaqVO vo); //전체 데이터 조회
}
