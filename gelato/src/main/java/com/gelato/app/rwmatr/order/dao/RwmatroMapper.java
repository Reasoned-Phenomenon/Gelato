package com.gelato.app.rwmatr.order.dao;

import java.util.List;

public interface RwmatroMapper {

	List<RwmatroVO> rwmatrOrderList();
	List<RwmatroVO> selectVendList();
	
	int insertRwmatro(RwmatroVO vo);
	int updateRwmatro(RwmatroVO vo);
	int deleteRwmatro(RwmatroVO vo);
	
	int insertRwmatroDeta(RwmatroVO vo);
	//int updateRwmatroDeta(RwmatroVO vo);
	//int deleteRwmatroDeta(RwmatroVO vo);
}
