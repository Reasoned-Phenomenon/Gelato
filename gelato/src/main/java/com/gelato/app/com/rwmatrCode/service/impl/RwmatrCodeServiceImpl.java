package com.gelato.app.com.rwmatrCode.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gelato.app.com.rwmatrCode.dao.RwmatrCodeMapper;
import com.gelato.app.com.rwmatrCode.dao.RwmatrCodeVO;
import com.gelato.app.com.rwmatrCode.service.RwmatrCodeService;
import com.gelato.app.vr.ModifyVO;

@Service
public class RwmatrCodeServiceImpl implements RwmatrCodeService {
	
	@Autowired RwmatrCodeMapper rwmatrcodeMapper;

	// rwmatrCode 전체 조회.
	@Override
	public List<RwmatrCodeVO> findRwmatrList(RwmatrCodeVO vo) {
		
		return rwmatrcodeMapper.findRwmatrList(vo);
	}
	
	// modal 거래처 조회.
	@Override
	public List<RwmatrCodeVO> vendList() {
		
		return rwmatrcodeMapper.vendList();
	}

	@Override
	public int modifyRwmatrCode(ModifyVO<RwmatrCodeVO> mvo) {
		
		for(RwmatrCodeVO vo : mvo.getCreatedRows()) {
			System.out.println("rwmatrCode등록.");
			rwmatrcodeMapper.insertRwmatrCode(vo);
		}
		
		return 0;
	}

	

	
	
}
