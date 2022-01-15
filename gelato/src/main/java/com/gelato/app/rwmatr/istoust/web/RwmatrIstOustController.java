package com.gelato.app.rwmatr.istoust.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gelato.app.rwmatr.istoust.dao.RwmatrioVO;
import com.gelato.app.rwmatr.istoust.service.RwmatrioService;
import com.gelato.app.vr.ModifyVO;

@Controller
public class RwmatrIstOustController {

	@Autowired RwmatrioService rwmatrioService;
	
	//원자재 입고 관리 페이지로 이동
	@RequestMapping("/rwmatr/rwmatrIst.do")
	public String rwmatrIst () {
		return "tiles/rwmatr/rwmatrIst";
	}
	
	//원자재 입고내역 조회
	@RequestMapping("/rwmatr/rwmatrIstList.do")
	public String rwmatrIstList(RwmatrioVO vo, Model model) {
		System.out.println("원자재 입고내역 조회");
		model.addAttribute("datas", rwmatrioService.RwmatrIstList(vo));
		System.out.println(rwmatrioService.RwmatrIstList(vo));
		return "grid";
	}
	
	//원자재 검수완료 내역 모달
	@RequestMapping("/rwmatr/rwmatrPassModal.do")
	public String rwmatrPassModal() {
		return "rwmatr/rwmatrPassModal";
	}
	
	//원자재 검수완료 내역 리스트
	@RequestMapping("/rwmatr/rwmatrPassList.do")
	public String rwmatrPassList(RwmatrioVO vo, Model model) {
		System.out.println("자재검수완료 리스트 조회");
		model.addAttribute("datas", rwmatrioService.rwmatrPassList(vo));
		System.out.println(rwmatrioService.rwmatrPassList(vo));
		return "grid";
	}
	
	//원자재 LOT번호 모달
	@RequestMapping("/rwmatr/rwmatrLotNoModal.do")
	public String rwmatrLotNoModal() {
		return "rwmatr/rwmatrLotNoModal";
	}
	
	@PutMapping("/rwmatr/rwmatrIstModifyData.do")
	@ResponseBody
	public boolean modifyData (@RequestBody ModifyVO<RwmatrioVO> mvo) {
		System.out.println(mvo);
		//rwmatroService.modifyRwmatro(mvo); //수정해야함
		return true;
	}
	
}
