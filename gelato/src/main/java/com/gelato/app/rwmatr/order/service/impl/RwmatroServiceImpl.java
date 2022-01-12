package com.gelato.app.rwmatr.order.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gelato.app.rwmatr.order.dao.RwmatroMapper;
import com.gelato.app.rwmatr.order.dao.RwmatroVO;
import com.gelato.app.rwmatr.order.service.RwmatroService;
import com.gelato.app.vr.ModifyVO;

@Service
public class RwmatroServiceImpl implements RwmatroService {

	@Autowired RwmatroMapper rwmatroMapper;
	
	@Override
	public List<RwmatroVO> rwmatrOrderList() {
		return rwmatroMapper.rwmatrOrderList();
	}
	
	@Override
	public List<RwmatroVO> selectVendList() {
		return rwmatroMapper.selectVendList();
	}

	@Override
	public int modifyRwmatro(ModifyVO<RwmatroVO> mvo) {
		
		if(mvo.getCreatedRows().get(0).getOrderId() == "") {
			System.out.println("발주번호 추가");
			rwmatroMapper.insertRwmatro(mvo.getCreatedRows().get(0));
		}
		for(RwmatroVO vo : mvo.getCreatedRows()) {
//			if(vo.getOrderId() == "") {
//				System.out.println("발주번호 추가");
//				rwmatroMapper.insertRwmatro(vo);
//			}
			System.out.println("발주디테일코드 추가");
			rwmatroMapper.insertRwmatroDeta(vo);
		}
		
		for(RwmatroVO vo : mvo.getUpdatedRows()) {
			System.out.println("수정");
			rwmatroMapper.updateRwmatro(vo);
			rwmatroMapper.updateRwmatroDeta(vo);
		}
		
		for(RwmatroVO vo : mvo.getDeletedRows()) {
			System.out.println("삭제");
			rwmatroMapper.deleteRwmatroDeta(vo);
		}
		
		return 0;
	}

}
