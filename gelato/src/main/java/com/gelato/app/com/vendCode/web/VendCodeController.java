package com.gelato.app.com.vendCode.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gelato.app.com.vendCode.dao.VendCodeVO;
import com.gelato.app.com.vendCode.service.VendCodeService;

@Controller
public class VendCodeController {

	@Autowired VendCodeService vendcodeService;
	
	// 거래처 코드관리 페이지로 이동.
	@RequestMapping("/com/vendCode.do")
	public String comBom() {
		System.out.println("거래처 코드 관리 페이지 이동");
		return "tiles/common/vendCode";
	}
	
	// 거래처코드 vendCode list 출력 조회.
	@RequestMapping("/com/vendCodeList.do")
	public String prdtCodeList(Model model, VendCodeVO vo) {
		    System.out.println("거래처 코드 list 조회.");
			model.addAttribute("datas", vendcodeService.vendCodeList(vo));
			return "grid";
	}
}
