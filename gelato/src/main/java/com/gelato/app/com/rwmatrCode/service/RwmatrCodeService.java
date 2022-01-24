package com.gelato.app.com.rwmatrCode.service;

import java.util.List;

import com.gelato.app.com.rwmatrCode.dao.RwmatrCodeVO;
import com.gelato.app.vr.ModifyVO;

public interface RwmatrCodeService {

	// rwmatr 전체 조회.
	List<RwmatrCodeVO> findRwmatrList(RwmatrCodeVO vo);
	
	
	// rwmatrCode Modal 거래처 조회.
	List<RwmatrCodeVO> vendList();
	
	
	// Modify 등록 
	public int modifyRwmatrCode (ModifyVO<RwmatrCodeVO>  mvo);
}
