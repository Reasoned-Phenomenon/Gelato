package com.gelato.app.com.deta.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gelato.app.com.deta.dao.ComCodeDetaModifyVO;
import com.gelato.app.com.deta.dao.ComCodeDetaVO;
import com.gelato.app.com.deta.service.ComCodeDetaService;

@Controller
public class ComCodeDetaController {

	@Autowired ComCodeDetaService service;
	
	@RequestMapping("/com/findComCodeDeta.do")
	public String findComCodeDeta(Model model, String codeId) {
		System.out.println("read");
		model.addAttribute("datas",service.findComCodeDeta(codeId));
		System.out.println(service.findComCodeDeta(codeId));
		return "grid";
	}
	
	@PutMapping("/com/comCodeDetaModifyData.do")
	@ResponseBody
	public boolean modifyData (@RequestBody ComCodeDetaModifyVO mvo) {
		System.out.println(mvo);
		service.modifyComCodeDeta(mvo);
		return true;
	}
	
	@RequestMapping("/com/comCodeDetaCodeId.do")
	@ResponseBody
	public Object comCodeDetaCodeId (@RequestBody ComCodeDetaVO mvo) {
		Map param = new HashMap();
		param.put("codeId", mvo.getCodeId());
		service.findComCodeProcedure(param);
		return param.get("out_cursor_table");
	}
	
}
