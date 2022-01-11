package com.gelato.app.biz.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gelato.app.biz.service.OrderService;

@Controller
public class OrderController {

	@Autowired OrderService ordService;
	

	@GetMapping("/biz/ordSearch.do")
	public String comCode() {
		return "tiles/biz/ordSearch";
	}
	
	@RequestMapping("/biz/findOrderList.do")
	public String findComCode(Model model) {
		System.out.println("aaaaaaaaaaa");
		model.addAttribute("datas",ordService.findOrderList());
		return "grid";
	}
	
}
