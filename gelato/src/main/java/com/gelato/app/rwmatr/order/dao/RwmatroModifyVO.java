package com.gelato.app.rwmatr.order.dao;

import java.util.List;

import lombok.Data;

@Data
public class RwmatroModifyVO {

	List<RwmatroModifyVO> createdRows;
	List<RwmatroModifyVO> updatedRows;
	List<RwmatroModifyVO> deletedRows;
}
