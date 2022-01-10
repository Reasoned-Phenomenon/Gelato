package com.gelato.app.order.dao;

import java.util.List;

import com.gelato.app.order.OrderVO;

public interface OrderMapper {
	
	List<OrderVO> findOrder(String orderId);
}
