package com.gelato.app.biz.service;

import java.util.List;

import com.gelato.app.biz.OrderVO;

public interface OrderService {

	List<OrderVO> findOrderList();
}
