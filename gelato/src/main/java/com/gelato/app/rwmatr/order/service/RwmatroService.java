package com.gelato.app.rwmatr.order.service;

import java.util.List;

import com.gelato.app.rwmatr.order.dao.RwmatroVO;
import com.gelato.app.vr.ModifyVO;

public interface RwmatroService {

	List<RwmatroVO> rwmatrOrderList(RwmatroVO vo);
	
	List<RwmatroVO> selectVendList();
	
	public int modifyRwmatro(ModifyVO<RwmatroVO> mvo);
	
}
