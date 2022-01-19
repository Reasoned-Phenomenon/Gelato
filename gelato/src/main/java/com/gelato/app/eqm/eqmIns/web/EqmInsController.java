package com.gelato.app.eqm.eqmIns.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.gelato.app.eqm.eqmIns.service.EqmInsService;

@Controller
public class EqmInsController {

	@Autowired 
	EqmInsService service;
	
	// 설비점검관리 - 페이지
	@GetMapping("/eqm/eqmInspection.do")
	public String eqmIns() {
		return"tiles/eqm/eqmInspection";
	}
}
