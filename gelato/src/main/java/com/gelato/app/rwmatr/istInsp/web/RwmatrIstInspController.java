package com.gelato.app.rwmatr.istInsp.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gelato.app.rwmatr.istInsp.dao.RwmatrIstInspVO;
import com.gelato.app.rwmatr.istInsp.service.RwmatrIstInspService;
import com.gelato.app.vr.ModifyVO;

@Controller
public class RwmatrIstInspController {

	@Autowired RwmatrIstInspService rwmatrIstInspService;
	
	//원자재 검사 페이지로 이동
	@RequestMapping("/rwmatr/rwmatrIstInsp.do")
	public String comCode () {
		return "tiles/rwmatr/rwmatrIstInsp";
	}
	
	//원자재 입고내역 조회
	@RequestMapping("/rwmatr/rwmatrIstInspList.do")
	public String rwmatrIstInspList(@RequestBody Map<String, String> map, Model model) {
		System.out.println("원자재 입고내역 조회");
		model.addAttribute("datas",rwmatrIstInspService.RwmatrIstInspList(map));
		return "grid";
	}
	
	@PutMapping("/rwmatr/rwmatrIstInspModifyData.do")
	@ResponseBody
	public boolean modifyData (@RequestBody ModifyVO<RwmatrIstInspVO> mvo) {
		System.out.println(mvo);
		//rwmatroService.modifyRwmatro(mvo);
		return true;
	}
}
