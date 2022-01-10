package com.gelato.app.eqm.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
	@PostMapping("/eqm/eqmRegister.do")
	public String insert(Eqm eqm) {
		service.insertEqm(eqm);
		return "redirect:eqmManagement";
	}
	
}
