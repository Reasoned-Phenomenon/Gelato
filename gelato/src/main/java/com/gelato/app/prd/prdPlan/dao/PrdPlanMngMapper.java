package com.gelato.app.prd.prdPlan.dao;

import java.util.List;

public interface PrdPlanMngMapper {
	
	//주문서 조회
	List<PrdPlanMngVO> OrderShtList();
	
	//검색결과 조회
	List<PrdPlanMngVO> searchPlanList();
}
