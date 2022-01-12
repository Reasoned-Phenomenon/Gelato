package com.gelato.app.prd.prdPlan.dao;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

public interface PrdPlanMngMapper {
	
	//주문서 조회
	List<PrdPlanMngVO> OrderShtList();
	
	//검색결과 조회
	List<PrdPlanMngVO> SearchPlanList(Map<String, String> map);
	
	//제품 목록 조회
	List<PrdPlanMngVO> PrdtList();
	
	//상세생산계획 그리드에 출력
	List<PrdPlanMngVO> ChooseOrder(PrdPlanMngVO vo);

}
