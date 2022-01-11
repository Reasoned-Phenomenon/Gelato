package com.gelato.app.prd.prdPlan.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.gelato.app.prd.prdPlan.dao.PrdPlanMngVO;

public interface PrdPlanMngService {
	
	//주문서 조회
	List<PrdPlanMngVO> OrderShtList();
	
	//검색결과 조회
	List<PrdPlanMngVO> SearchPlanList(Map<String, String> map);
	
	//상세생산계획 그리드에 출력
	List<PrdPlanMngVO> ChooseOrder(PrdPlanMngVO vo);
}
