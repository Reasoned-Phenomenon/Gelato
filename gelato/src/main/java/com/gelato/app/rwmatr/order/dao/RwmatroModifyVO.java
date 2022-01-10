package com.gelato.app.rwmatr.order.dao;

import java.util.List;

import lombok.Data;

@Data
public class RwmatroModifyVO {

	List<RwmatroVO> createdRows;
	List<RwmatroVO> updatedRows;
	List<RwmatroVO> deletedRows;
}
