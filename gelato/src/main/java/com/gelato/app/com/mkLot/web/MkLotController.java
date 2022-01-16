package com.gelato.app.com.mkLot.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gelato.app.com.mkLot.dao.MkLotMapper;
import com.gelato.app.com.mkLot.dao.MkLotVO;

@Controller
public class MkLotController {

	@Autowired MkLotMapper mapper;
	
	@RequestMapping("/com/mkLot.do")
	@ResponseBody
	public MkLotVO mkLot (MkLotVO vo) {
		System.out.println("여기로 오나");
		return mapper.findLot(vo);
	}
}
