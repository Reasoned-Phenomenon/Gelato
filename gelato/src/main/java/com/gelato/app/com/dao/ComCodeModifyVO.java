package com.gelato.app.com.dao;

import java.util.List;

import lombok.Data;

@Data
public class ComCodeModifyVO {
	
		List<ComCodeVO> createdRows;
		List<ComCodeVO> updatedRows;
		List<ComCodeVO> deletedRows;
		
}
