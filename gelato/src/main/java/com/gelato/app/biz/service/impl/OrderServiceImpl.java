package com.gelato.app.biz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



import com.gelato.app.biz.dao.OrderMapper;
import com.gelato.app.biz.dao.OrderVO;
import com.gelato.app.biz.service.OrderService;

@Service
public class OrderServiceImpl implements  OrderService{
	
	@Autowired OrderMapper orderMapper;
	
	@Override
	public List<OrderVO> findOrderList(OrderVO vo) {
		
		return orderMapper.findOrderList(vo);
	}

	@Override
	public List<OrderVO> vendList() {
		
		return orderMapper.vendList();
	}

	@Override
	public List<OrderVO> prdtList() {
		
		return orderMapper.prdtList();
	}

}
