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

	@Autowired
	EqmService service;

	// 등록 페이지
	@GetMapping("/eqm/eqmRegister.do")
	public String insertForm() {
		return "tiles/eqm/eqmRegister";
	}

	// 등록
	@PostMapping("/eqm/insertEqm.do")
	public String insert(EqmVO eqmVo) {
		service.insertEqm(eqmVo);
		return "tiles/eqm/eqmManagement";
	}

	// 설비 등록 모달(설비구분)
	@RequestMapping("/eqm/searchFg.do")
	public String getModal() {
		return "/eqm/searchFg";
	}

	// 설비관리 페이지
	@RequestMapping("/eqm/eqmManagement.do")
	public String eqmList() {
		return "tiles/eqm/eqmManagement";
	}

	// 설비관리(조회)
	@GetMapping("/eqm/eqmList.do")
	public String findEqm(Model model, EqmVO eqmVo) {
		System.out.println(service.eqmList(eqmVo));
		model.addAttribute("datas", service.eqmList(eqmVo));
		return "grid";
	}

	// 설비관리(단건조회)
	@GetMapping("/eqm/eqmSelect.do")
	public String eqmSelectList(Model model, EqmVO eqmVo) {
		System.out.println(service.eqmSelect(eqmVo));
		model.addAttribute(service.eqmSelect(eqmVo));
		return "tiles/eqm/eqmManagement";
	}
	
	// 설비수정
	@GetMapping("/eqm/eqmUpdate.do")
	public String eqmUpdate(EqmVO eqmVo) {
		int r = service.eqmUpdate(eqmVo);
		System.out.println(r + "건====================");
		return "tiles/eqm/eqmManagement";
	}

	/*// 설비삭제
	@GetMapping("/eqm/eqmDelete.do")
	public String eqmDelete(EqmVO eqmVo) {
		service.eqmDelete(eqmVo);
		return ""; ///////////// 이거 고쳐라
	}*/
	
	//설비비가동관리 페이지
	@GetMapping("/eqm/eqmNonMoving.do")
	public String eqmNonMoving(Model model, EqmVO eqmVo) {
		model.addAttribute("datas", eqmVo.getEqmId());
		System.out.println(eqmVo.getEqmId());
		return "tiles/eqm/eqmNonMoving";
	}
}
