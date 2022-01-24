package com.gelato.app.prd.prdIndicaFind.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PrdIndicaMngFindController {

	//생산지시조회로 이동
	@RequestMapping("/prd/prdIndicaMngFind.do")
	public String prdIndicaMng() {
		System.out.println("생산지시조회 페이지 이동");
		return "tiles/prd/prdIndicaMngFind";
	}
}
