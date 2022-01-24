package com.gelato.app.com.rwmatrCode.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gelato.app.com.rwmatrCode.dao.RwmatrCodeVO;
import com.gelato.app.com.rwmatrCode.service.RwmatrCodeService;
import com.gelato.app.vr.ModifyVO;

@Controller
public class RwmatrCodeController {

	@Autowired RwmatrCodeService rwmatrcodeService;
	
	// 자재코드 관리 페이지로 이동.
	@RequestMapping("/com/rwmatrCode.do")
	public String comBom() {
		System.out.println("자재 코드 관리 페이지 이동");
		return "tiles/common/rwmatrCode";
	}
	
	// 자재 코드 list 출력 조회.
	@RequestMapping("/com/findRwmatrList.do")
	public String findBomList(Model model, RwmatrCodeVO vo) {
	    System.out.println("자재코드 조회");
		model.addAttribute("datas", rwmatrcodeService.findRwmatrList(vo));
		return "grid";
    }
	
	// 거래처 명 modal 호출.
	@RequestMapping("/com/vendModal.do")
	public String vendModal(Model model) {
		System.out.println("거래처 modal");
		return "/common/vendModal"; // 모달 주소 적어야 한다.
	}
	
	// 거래처 명 modal로 조회.
	@RequestMapping("/com/vendModalModal.do")
	public String vendList(Model model) {
		System.out.println("거래처 검색");
		model.addAttribute("datas", rwmatrcodeService.vendList());
		return "grid"; 
	}

	
	
	// Modify 등록
	@PutMapping("/com/rwmatrCodeModifyData.do")
	@ResponseBody
	public boolean modifyData (@RequestBody ModifyVO<RwmatrCodeVO> mvo) {
		System.out.println(mvo);
		rwmatrcodeService.modifyRwmatrCode(mvo);
		return true;
	}
	
}
