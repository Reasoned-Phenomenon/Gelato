package com.gelato.app.com.bomCode.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gelato.app.com.bomCode.dao.BomCodeVO;
import com.gelato.app.com.bomCode.service.BomCodeService;
import com.gelato.app.vr.ModifyVO;

@Controller
public class BomCodeController {
	
	@Autowired BomCodeService bomcodeService;
	
	// 제품 BOM 관리 페이지로 이동.
	@RequestMapping("/com/comBom.do")
	public String comBom() {
		return "tiles/common/comBom";
	}
	
	// 제품BOM list 출력 조회.
	@RequestMapping("/com/findBomList.do")
	public String findBomList(Model model, BomCodeVO vo) {
		    System.out.println("vvvvv");
			model.addAttribute("datas", bomcodeService.findBomList(vo));
			return "grid";
	}
	
	// Modify
	@PutMapping("/com/bomCodeModifyData.do")
	@ResponseBody
	public boolean modifyData (@RequestBody ModifyVO<BomCodeVO> mvo) {
		System.out.println(mvo);
		bomcodeService.modifyBomCode(mvo);
		return true;
	}
	
}
