package com.gelato.app.prd.prdPlan.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.gelato.app.prd.prdPlan.dao.PrdPlanMngMapper;
import com.gelato.app.prd.prdPlan.dao.PrdPlanMngVO;
import com.gelato.app.prd.prdPlan.service.PrdPlanMngService;

@Service
public class PrdPlanMngServiceImpl implements PrdPlanMngService{

	@Autowired PrdPlanMngMapper ppmMapper;

	@Override
	public List<PrdPlanMngVO> OrderShtList() {
		return ppmMapper.OrderShtList();
	}

	@Override
	public List<PrdPlanMngVO> SearchPlanList(PrdPlanMngVO vo) {
		return ppmMapper.SearchPlanList(vo);
	}

	@Override
	public List<PrdPlanMngVO> ChooseOrder(PrdPlanMngVO vo) {
		return ppmMapper.ChooseOrder(vo);
	}

	@Override
	public List<PrdPlanMngVO> PrdtList() {
		return ppmMapper.PrdtList();
	}



	
	
}
