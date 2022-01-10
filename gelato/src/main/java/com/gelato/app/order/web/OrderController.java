package com.gelato.app.order.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.gelato.app.order.service.OrderService;

@Controller
public class OrderController {

	@Autowired OrderService ordservice;
	

	@GetMapping("/biz/ordSearch.do")
	public String ordSearch() {
		return "tiles/biz/ordSearch";
	}
	// 이어서 하기.
	//@RequestMapping("/ord/findOrder")
	
}
