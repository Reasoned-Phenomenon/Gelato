package com.gelato.app.rwmatr.order.service;

import java.util.List;

import com.gelato.app.rwmatr.order.dao.RwmatroModifyVO;
import com.gelato.app.rwmatr.order.dao.RwmatroVO;

public interface RwmatroService {

	List<RwmatroVO> rwmatrOrderList();
	
	int modifyRwmatro (RwmatroModifyVO mvo);
	
	
}
