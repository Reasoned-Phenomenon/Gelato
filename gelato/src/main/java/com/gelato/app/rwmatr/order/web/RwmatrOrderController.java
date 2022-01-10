package com.gelato.app.rwmatr.order.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gelato.app.rwmatr.order.service.RwmatroService;

@Controller
public class RwmatrOrderController {

	@Autowired RwmatroService rwmatroService;
	
	@RequestMapping("/rwmatr/rwmatrOrder.do")
	public String comCode () {
		return "tiles/rwmatr/rwmatrOrder";
	}
	
	@RequestMapping("/rwmatr/rwmatrOrderList.do")
	public String findComCode(Model model) {
		System.out.println("111111111111111111");
		model.addAttribute("datas",rwmatroService.rwmatrOrderList());
		return "grid";
	}
	
//	@PutMapping("/com/rwmatroModifyData.do")
//	@ResponseBody
//	public boolean modifyData (@RequestBody RwmatroModifyVO mvo) {
//		System.out.println(mvo);
//		service.;
//		return true;
//	}
}
