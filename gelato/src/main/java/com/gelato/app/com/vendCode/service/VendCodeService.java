package com.gelato.app.com.vendCode.service;

import java.util.List;

import com.gelato.app.com.vendCode.dao.VendCodeVO;

public interface VendCodeService {

	//VendCode 전체 조회.
	List<VendCodeVO> vendCodeList(VendCodeVO vo);
}
