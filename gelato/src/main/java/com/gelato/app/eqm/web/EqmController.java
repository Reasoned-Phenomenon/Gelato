package com.gelato.app.eqm.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gelato.app.com.comCode.dao.ComCodeVO;
import com.gelato.app.com.comCode.service.ComCodeService;
import com.gelato.app.eqm.dao.EqmNonVO;
import com.gelato.app.eqm.dao.EqmVO;
import com.gelato.app.eqm.service.EqmService;

@Controller
public class EqmController {

	@Autowired
	EqmService service;
	@Autowired ComCodeService cservice;
	// 설비등록 - 페이지
	@GetMapping("/eqm/eqmRegister.do")
	public String insertForm() {  
		return "tiles/eqm/eqmRegister";
	}

	// 설비등록 - 등록
	@PostMapping("/eqm/insertEqm.do")
	public String insert(EqmVO eqmVo) {
		service.insertEqm(eqmVo);
		return "tiles/eqm/eqmManagement";
	}

	// 설비등록 - 설비구분 모달창 띄우기
	@RequestMapping("/eqm/searchFgModal.do")
	public String getModal() {
		return "/eqm/searchFgModal";
	}
	
	// 설비등록 - 설비구분 모달
	@RequestMapping("/eqm/findSeolbi.do")
	public String getSeolbi(Model model, EqmVO eqmVo) {
		ComCodeVO vo = new ComCodeVO();
		vo.setCodeId(eqmVo.getCodeId());
		System.out.println(cservice.findComCode(vo));
		model.addAttribute("datas",cservice.findComCode(vo));
		return "grid";
	}

	// 설비관리 - 페이지
	@RequestMapping("/eqm/eqmManagement.do")
	public String eqmList() {
		return "tiles/eqm/eqmManagement";
	}

	// 설비관리 - 좌측 조회 그리드
	@GetMapping("/eqm/eqmList.do")
	public String findEqm(Model model, EqmVO eqmVo) {
		System.out.println(service.eqmList(eqmVo));
		model.addAttribute("datas", service.eqmList(eqmVo));
		return "grid";
	}

	// 설비관리 - 단건조회
	@GetMapping("/eqm/eqmSelect.do")
	public String eqmSelectList(Model model, EqmVO eqmVo) {
		System.out.println(service.eqmSelect(eqmVo));
		model.addAttribute(service.eqmSelect(eqmVo));
		return "tiles/eqm/eqmManagement";
	}
	
	// 설비관리 - 공정코드 모달
	@RequestMapping("eqm/searchPrcsModal.do")
	public String searchPrcs() {
		return "eqm/searchPrcsModal";
	}

	// 설비관리 - 수정
	@GetMapping("/eqm/eqmUpdate.do")
	public String eqmUpdate(EqmVO eqmVo) {
		int r = service.eqmUpdate(eqmVo);
		return "tiles/eqm/eqmManagement";
	}

	// 설비비가동관리 - 페이지
	@GetMapping("/eqm/eqmNonMoving.do")
	public String eqmNonMoving(Model model, EqmVO eqmVo) {
		model.addAttribute("datas", eqmVo);
		System.out.println(eqmVo);
		return "tiles/eqm/eqmNonMoving";
	}
	
	// 설비비가동관리 - 좌측 설비전체조회 그리드
	@GetMapping("/eqm/eqmNonMovingList.do")
	public String findEqmNon(Model model, EqmVO eqmVo) {
		model.addAttribute("datas", service.eqmNonList(eqmVo));
		return "grid";
	}
	
	// 설비비가동관리 - 비가동내역조회
	@GetMapping("eqm/eqmNonSelect.do")
	public String eqmNonSelect(Model model, EqmNonVO eqmNonVo) {
		System.out.println(eqmNonVo);
		model.addAttribute("datas",service.eqmNonSelect(eqmNonVo));
		return "grid";
	}
	
	// 설비비가동관리 - 등록 
	@RequestMapping("/eqm/eqmNonInsert.do")
	public String eqmNonInsert(Model model, EqmNonVO eqmNonVo) {
		model.addAttribute("datas",service.insertNonEqm(eqmNonVo));
		return "tiles/eqm/eqmNonMoving";
	}
	
	// 설비비가동관리 - 설비코드 모달
	@RequestMapping("/eqm/searchEqmModal.do")
	public String getEqmModal() {
		return "/eqm/searchEqmModal";
	}	

	
}

