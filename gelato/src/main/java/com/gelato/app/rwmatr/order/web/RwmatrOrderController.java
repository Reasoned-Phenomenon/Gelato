package com.gelato.app.rwmatr.order.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gelato.app.rwmatr.order.service.RwmatroService;

@Controller
public class RwmatrOrderController {

	@Autowired RwmatroService rwmatroService;
	
	@RequestMapping("/com/rwmatrOrder.do")
	public String comCode () {
		return "tiles/common/rwmatrOrder";
	}
	
	@RequestMapping("/com/rwmatrOrderList.do")
	public String findComCode(Model model) {
		model.addAttribute("datas",rwmatroService.rwmatrOrderList());
		return "grid";
	}
}
