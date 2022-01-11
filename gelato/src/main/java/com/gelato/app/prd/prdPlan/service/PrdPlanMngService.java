package com.gelato.app.prd.prdPlan.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gelato.app.prd.prdPlan.dao.PrdPlanMngVO;

public interface PrdPlanMngService {
	
	//주문서 조회
	List<PrdPlanMngVO> OrderShtList();
	
	//검색결과 조회
	List<PrdPlanMngVO> SearchPlanList();
	
	//상세생산계획 그리드에 출력
	List<PrdPlanMngVO> ChooseOrder(PrdPlanMngVO vo);
}
