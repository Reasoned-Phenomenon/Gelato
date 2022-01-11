package com.gelato.app.biz.dao;

import java.util.List;

public interface OrderMapper {
	
	//주문서 조회.
	List<OrderVO> findOrderList();
	
	// 거래처 조회
	List<OrderVO> vendList();
}
