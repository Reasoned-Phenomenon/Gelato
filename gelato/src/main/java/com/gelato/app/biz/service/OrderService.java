package com.gelato.app.biz.service;

import java.util.List;
import java.util.Map;


import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.gelato.app.biz.dao.OrderVO;

public interface OrderService {

	//주문서 조회.
	List<OrderVO> findOrderList(OrderVO vo);
	
	// 거래처 조회
	List<OrderVO> vendList();
	
	// 제품코드 조회.
	List<OrderVO> prdtList();
}
