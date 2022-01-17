package com.gelato.app.prd.prdIndica.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PrdIndicaMngController {
	
	/* @Autowired */
	
	//생산지시관리로 이동
	@RequestMapping("/prd/prdIndicaMng.do")
	public String prdIndicaMng() {
		System.out.println("생산지시관리 페이지 이동");
		return "tiles/prd/prdIndicaMng";
	}
	
	//미지시생산계획 modal
	@RequestMapping("/prd/nonIndicaDialog.do")
	public String nonIndicaDialog() {
		System.out.println("미지시생산계획 이동");
		// 미지시생산계획 들어갈 주문서 modal jsp.
		return "prd/nonIndicaModal"; 
	}
}
