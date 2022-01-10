package com.gelato.app.prd.prdPlan.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gelato.app.prd.prdPlan.dao.PrdPlanMngVO;

public interface PrdPlanMngService {
	
	List<PrdPlanMngVO> findOrderSht();

}
