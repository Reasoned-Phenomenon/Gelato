package com.gelato.app.rwmatr.istoust.service;

import java.util.List;

import com.gelato.app.rwmatr.istoust.dao.RwmatrioVO;

public interface RwmatrioService {

	//입고 관리 전체조회
	List<RwmatrioVO> RwmatrIstList(RwmatrioVO vo);
}
