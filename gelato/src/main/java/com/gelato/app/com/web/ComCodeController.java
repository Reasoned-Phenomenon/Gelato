package com.gelato.app.com.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gelato.app.com.service.ComCodeService;

@Controller
public class ComCodeController {

	@Autowired ComCodeService service;
	
	@RequestMapping("/com/comCode.do")
	public String comCode () {
		return "tiles/common/comCode";
	}
	
	@RequestMapping("/com/findComCode.do")
	public String findComCode(Model model) {
		model.addAttribute("datas",service.findComCode());
		System.out.println(service.findComCode());
		return "grid";
	}
	
	
}
