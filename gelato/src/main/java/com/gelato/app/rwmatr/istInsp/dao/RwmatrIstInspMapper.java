package com.gelato.app.rwmatr.istInsp.dao;

import java.util.List;
import java.util.Map;

public interface RwmatrIstInspMapper {

	//입고검사내역 전체조회
	List<RwmatrIstInspVO> RwmatrIstInspList(Map<String, String> map);
	
	int insertRwmatrIstInsp(RwmatrIstInspVO vo);
	int updateRwmatrIstInsp(RwmatrIstInspVO vo);
	int deleteRwmatrIstInsp(RwmatrIstInspVO vo);
}
