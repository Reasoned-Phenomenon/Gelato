package com.gelato.app.com.vendCode.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gelato.app.com.vendCode.dao.VendCodeMapper;
import com.gelato.app.com.vendCode.dao.VendCodeVO;
import com.gelato.app.com.vendCode.service.VendCodeService;

@Service
public class VendCodeServiceImpl implements VendCodeService {

	@Autowired VendCodeMapper vendcodeMapper;
	
	// VendCode 전체 조회.
	@Override
	public List<VendCodeVO> vendCodeList(VendCodeVO vo) {
		
		return vendcodeMapper.vendCodeList(vo);
	}

}
