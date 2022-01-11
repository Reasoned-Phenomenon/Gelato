package com.gelato.app.prd.prdPlan.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gelato.app.prd.prdPlan.dao.PrdPlanMngVO;
import com.gelato.app.prd.prdPlan.service.PrdPlanMngService;

@Controller
public class PrdPlanMngController {

	@Autowired PrdPlanMngService prdPlanMngService;
	
	//생산계획관리 페이지로 이동
	@RequestMapping("/prd/prdPlanMng.do")
	public String prdPlanMng() {
		System.out.println("생산계획관리 페이지 이동");
		
		// 생산계획관리 페이지
		 return "tiles/prd/prdPlanMng"; 
		
		// 생산계획관리에 들어갈 주문서 modal jsp.
		/* return "tiles/prd/orderShtModal"; */
		
		// 생산계획관리에 들어갈 검색창 modal jsp.
		/* return "tiles/prd/searchPlanModal"; */
	}
	
	//주문서 modal
	@RequestMapping("prd/orderShtDialog.do")
	public String orderShtDialog() {
		System.out.println("주문서 이동");
		// 생산계획관리에 들어갈 주문서 modal jsp.
		return "prd/orderShtModal"; 
	}
	
	//검색결과 modal
	@RequestMapping("prd/searchPlanDialog.do")
	public String searchPlanDialog() {
		System.out.println("검색창 이동");
		// 생산계획관리에 들어갈 검색창 modal jsp.
		return "prd/searchPlanModal"; 
	}
	
	// 주문서 list 출력
	@RequestMapping("/prd/orderShtModal.do")
	public String OrderShtList(Model model) {
		System.out.println("주문서 list 출력");
		System.out.println(model);
		model.addAttribute("datas", prdPlanMngService.OrderShtList());
		return "grid";
	}
	
	// 검색결과 list 출력
	@RequestMapping("/prd/searchPlanList.do")
	public String SearchPlanList(Model model) {
		System.out.println("검색결과 출력");
		System.out.println(model);
		model.addAttribute("datas", prdPlanMngService.SearchPlanList());
		return "grid";
	}
	
	// 상세계획그리드에 출력
	@RequestMapping("/prd/chooseOrder.do")
	public String ChooseOrder(Model model, PrdPlanMngVO vo) {
		System.out.println("상세계획 출력");
		model.addAttribute("datas", prdPlanMngService.ChooseOrder(vo));
		System.out.println(prdPlanMngService.ChooseOrder(vo));
		return "grid";
	}
	
}
