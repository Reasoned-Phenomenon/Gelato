package com.gelato.app.rwmatr.order.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gelato.app.rwmatr.order.dao.RwmatroModifyVO;
import com.gelato.app.rwmatr.order.service.RwmatroService;
import com.gelato.app.rwmatr.service.RwmatrService;

@Controller
public class RwmatrOrderController {

	@Autowired RwmatroService rwmatroService;
	@Autowired RwmatrService rwmatrService;
	
	//발주 관리 페이지로 이동
	@RequestMapping("/rwmatr/rwmatrOrder.do")
	public String comCode () {
		return "tiles/rwmatr/rwmatrOrder";
	}
	
	//발주 리스트 조회
	@RequestMapping("/rwmatr/rwmatrOrderList.do")
	public String findComCode(Model model) {
		System.out.println("111111111111111111");
		model.addAttribute("datas",rwmatroService.rwmatrOrderList());
		return "grid";
	}
	
	//원자재 modal
	@RequestMapping("rwmatr/searchRwmatrDialog.do")
	public String orderShtDialog() {
		System.out.println("원자재 모달");
		return "rwmatr/searchRwmatrModal"; 
	}
	
	//원자재리스트 출력
	@RequestMapping("rwmatr/searchRwmatrList.do")
	public String searchRwmatrDialog(Model model) {
		System.out.println("원자재리스트");
		model.addAttribute("datas", rwmatrService.rwmatrList());
		System.out.println(rwmatrService.rwmatrList());
		return "grid"; 
	}
	
	@PutMapping("/com/rwmatroModifyData.do")
	@ResponseBody
	public boolean modifyData (@RequestBody RwmatroModifyVO mvo) {
		System.out.println(mvo);
		rwmatroService.modifyRwmatro(mvo);
		return true;
	}
	
}
