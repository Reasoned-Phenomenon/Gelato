package com.gelato.app.rwmatr.istInsp.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gelato.app.rwmatr.istInsp.dao.RwmatrIstInspMapper;
import com.gelato.app.rwmatr.istInsp.dao.RwmatrIstInspVO;
import com.gelato.app.rwmatr.istInsp.service.RwmatrIstInspService;
import com.gelato.app.vr.ModifyVO;

@Service
public class RwmatrIstInspServiceImpl implements RwmatrIstInspService {

	@Autowired RwmatrIstInspMapper rwmatrIstInspMapper;

	@Override
	public List<RwmatrIstInspVO> RwmatrIstInspList(Map<String, String> map) {
		return rwmatrIstInspMapper.RwmatrIstInspList(map);
	}
	
	@Override
	public List<RwmatrIstInspVO> selectOrderDetail() {
		return rwmatrIstInspMapper.selectOrderDetail();
	}

	@Override
	public int modifyIstInsp(ModifyVO<RwmatrIstInspVO> mvo) {
		for(RwmatrIstInspVO vo : mvo.getCreatedRows()) {
		}
		
		for(RwmatrIstInspVO vo : mvo.getUpdatedRows()) {
		}
		
		for(RwmatrIstInspVO vo : mvo.getDeletedRows()) {
		}
		
		return 0;
	}
	
}
