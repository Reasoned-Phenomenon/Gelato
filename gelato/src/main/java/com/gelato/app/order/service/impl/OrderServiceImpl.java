package com.gelato.app.order.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gelato.app.order.OrderVO;
import com.gelato.app.order.dao.OrderMapper;
import com.gelato.app.order.service.OrderService;

@Service
public class OrderServiceImpl implements  OrderService{
	
	@Autowired OrderMapper orderMapper;
	
	@Override
	public List<OrderVO> findOrder(String orderId) {
		
		return orderMapper.findOrder(orderId);
	}

}
