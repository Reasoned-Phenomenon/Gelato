package com.gelato.app.rwmatr.istInsp.dao;

import java.util.List;
import java.util.Map;

public interface RwmatrIstInspMapper {

	//입고검사내역 전체조회
	List<RwmatrIstInspVO> RwmatrIstInspList(Map<String, String> map);
	
	//입고검사할 발주디테일코드 리스트
	List<RwmatrIstInspVO> selectOrderDetail();
	
	int insertRwmatrIstInsp(RwmatrIstInspVO vo);
	int updateRwmatrIstInsp(RwmatrIstInspVO vo);
	int deleteRwmatrIstInsp(RwmatrIstInspVO vo);
}