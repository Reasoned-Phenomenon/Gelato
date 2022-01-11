package com.gelato.app.eqm.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gelato.app.eqm.dao.EqmVO;
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
	public String insert(EqmVO eqmVo) {
		service.insertEqm(eqmVo);
		return "tiles/eqm/eqmManagement";
	}
	
	//설비 등록 모달(설비구분)
	@RequestMapping("/eqm/searchFg.do")
	public String getModal() {
		return "/eqm/searchFg";
	}
	
	//설비관리 페이지
	@RequestMapping("/eqm/eqmManagement.do")
	public String eqmList() {
		return "tiles/eqm/eqmManagement";
	}
	
	
	//설비관리(조회)
	@GetMapping("/eqm/eqmList.do")
	public String findEqm(Model model) {
		System.out.println(service.eqmList());
		model.addAttribute("datas",service.eqmList());
		return "grid";
	}
	
	
}
