package com.gelato.app.prd.prdPlan.dao;

import java.util.List;

public interface PrdPlanMngMapper {
	
	//주문서 조회
	List<PrdPlanMngVO> OrderShtList();
	
	//검색결과 조회
	List<PrdPlanMngVO> SearchPlanList();
	
	//상세생산계획 그리드에 출력
	List<PrdPlanMngVO> ChooseOrder(PrdPlanMngVO vo);

}
