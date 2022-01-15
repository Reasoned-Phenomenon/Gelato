package com.gelato.app.prd.prdPlanFind.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gelato.app.prd.prdPlanFind.service.PrdPlanMngFindService;

@Controller
public class PrdPlanMngFindController {

	@Autowired PrdPlanMngFindService prdPlanMngFindService;
	
	// 생산계획조회 페이지로 이동
	@RequestMapping("/prd/prdPlanMngFind.do")
	public String prdPlanMngFind() {
		System.out.println("생산계획조회 페이지 이동");
		
		// 생산계획관리 페이지
		 return "tiles/prd/prdPlanMngFind"; 
	}
}
