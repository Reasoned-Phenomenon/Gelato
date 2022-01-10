package com.gelato.app.order.service;

import java.util.List;

import com.gelato.app.order.OrderVO;

public interface OrderService {

	List<OrderVO> findOrder(String orderId);
}
