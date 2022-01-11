package com.gelato.app.biz.dao;

import java.util.List;

import com.gelato.app.biz.OrderVO;

public interface OrderMapper {
	
	List<OrderVO> findOrderList();
}
