package com.gelato.app.prd.prdPlan.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gelato.app.prd.prdPlan.dao.PrdPlanMngVO;

public interface PrdPlanMngService {
	
	//주문서 조회
	List<PrdPlanMngVO> OrderShtList();
	
	//검색결과 조회
	List<PrdPlanMngVO> searchPlanList();
}
