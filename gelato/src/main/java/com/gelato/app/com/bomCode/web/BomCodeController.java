package com.gelato.app.com.bomCode.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gelato.app.biz.dao.OrderVO;
import com.gelato.app.com.bomCode.service.BomCodeService;

@Controller
public class BomCodeController {
	
	
	
	// 제품 BOM 관리 페이지로 이동.
	@RequestMapping("/com/comBom.do")
	public String comBom() {
		return "tiles/common/comBom";
	}
	
	// 제품BOM list 출력 조회.
	
}
