package com.gelato.app.rwmatr.istoust.dao;

import java.util.List;

public interface RwmatrioMapper {

	//입고 관리 전체조회
	List<RwmatrioVO> RwmatrIstList(RwmatrioVO vo);
	
	//검수 완료 리스트 조회
	List<RwmatrioVO> RwmatrPassList(RwmatrioVO vo);
	
	//출고 관리 전체조회
}
