package com.gelato.app.com.rwmatrCode.dao;

import java.util.List;





public interface RwmatrCodeMapper {
		
	// rwmatr 전체 조회.
	List<RwmatrCodeVO> findRwmatrList(RwmatrCodeVO vo);
	
	// rwmatrCode Modal 거래처 조회.
	List<RwmatrCodeVO> vendList();
	
	// rwmatr 등록. 
	int insertRwmatrCode(RwmatrCodeVO vo);  
	
}
