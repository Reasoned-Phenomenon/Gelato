package com.gelato.app.prd.prdPlan.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gelato.app.prd.prdPlan.service.PrdPlanMngService;

@Controller
public class PrdPlanMngController {

	@Autowired PrdPlanMngService service;
	
	@RequestMapping("/prd/prdPlanMng.do")
	public String prdPlanMng() {
		System.out.println("11111");
		
		// 생산계획관리 페이지
		/* return "tiles/prd/prdPlanMng"; */
		
		// 생산계획관리에 들어갈 주문서 modal jsp.
		return "tiles/prd/orderShtModal";
	}
	
}
