package com.gelato.app.com.mkLot.dao;

public interface MkLotMapper {

	MkLotVO findLot(String itemId);
	
	int insertGvLot(String itemId);
}
