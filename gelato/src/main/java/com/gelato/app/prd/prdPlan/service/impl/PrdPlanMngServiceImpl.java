package com.gelato.app.prd.prdPlan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gelato.app.prd.prdPlan.dao.PrdPlanMngMapper;
import com.gelato.app.prd.prdPlan.dao.PrdPlanMngVO;
import com.gelato.app.prd.prdPlan.service.PrdPlanMngService;

@Service
public class PrdPlanMngServiceImpl implements PrdPlanMngService{

	@Autowired PrdPlanMngMapper ppmMapper;
	
	@Override
	public List<PrdPlanMngVO> findOrderSht() {
		return null;
	}

}