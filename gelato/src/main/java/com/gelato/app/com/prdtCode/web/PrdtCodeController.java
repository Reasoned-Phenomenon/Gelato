package com.gelato.app.com.prdtCode.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PrdtCodeController {

	// 완제품코드 관리 페이지로 이동.
	@RequestMapping("/com/prdtCode.do")
	public String comBom() {
		System.out.println("완제품 코드 관리 페이지 이동");
		return "tiles/common/prdtCode";
	}
}
