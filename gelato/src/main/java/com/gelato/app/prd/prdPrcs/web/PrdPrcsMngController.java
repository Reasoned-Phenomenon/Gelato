package com.gelato.app.prd.prdPrcs.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PrdPrcsMngController {

	//생산관리로 이동
	@RequestMapping("/prd/prdPrcsMng.do")
	public String prdPrcsMng() {
		System.out.println("생산관리 이동");
		return "tiles/prd/prdPrcsMng";
	}
}
