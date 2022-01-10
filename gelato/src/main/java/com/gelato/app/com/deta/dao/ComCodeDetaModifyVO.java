package com.gelato.app.com.deta.dao;

import java.util.List;

import com.gelato.app.com.comCode.dao.ComCodeVO;

import lombok.Data;

@Data
public class ComCodeDetaModifyVO {
	
		List<ComCodeDetaVO> createdRows;
		List<ComCodeDetaVO> updatedRows;
		List<ComCodeDetaVO> deletedRows;
		
}
