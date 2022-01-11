package com.gelato.app.eqm.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gelato.app.eqm.dao.Eqm;
import com.gelato.app.eqm.service.EqmService;

@Controller
public class EqmController {
	
	@Autowired EqmService service;
	//등록 페이지
	@GetMapping("/eqm/eqmRegister.do")
	public String insertForm() {
		return "tiles/eqm/eqmRegister";
	}
	
	//등록
	@PostMapping("/insert")
	public String insert(Eqm eqm) {
		service.insertEqm(eqm);
		return "tiles/eqm/eqmManagement";
	}
	
	//설비 등록 모달(설비구분)
	@RequestMapping("/eqm/searchFg.do")
	public String getModal() {
		System.out.println("!111111");
		return "/eqm/searchFg";
	}
	
	//설비관리 페이지 
	@GetMapping("/eqm/eqmManagement.do")
	public String management() {
		return "tiles/eqm/eqmManagement";
	}
	
	
}
