package com.gelato.app.rwmatr.order.dao;

import java.util.List;
import java.util.Map;

public interface RwmatroMapper {

	List<RwmatroVO> rwmatrOrderList(Map<String, String> map);
	List<RwmatroVO> selectVendList();
	
	//발주 Insert
	int insertRwmatro(RwmatroVO vo);
	int updateRwmatro(RwmatroVO vo);
	
	//발주 디테일
	int insertRwmatroDeta(RwmatroVO vo);
	int updateRwmatroDeta(RwmatroVO vo);
	int deleteRwmatroDeta(RwmatroVO vo);
}
