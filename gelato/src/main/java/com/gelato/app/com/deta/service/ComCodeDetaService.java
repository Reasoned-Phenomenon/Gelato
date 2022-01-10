package com.gelato.app.com.deta.service;

import java.util.List;
import java.util.Map;

import com.gelato.app.com.deta.dao.ComCodeDetaModifyVO;
import com.gelato.app.com.deta.dao.ComCodeDetaVO;

public interface ComCodeDetaService {

	List<ComCodeDetaVO> findComCodeDeta(String codeId);
	Map findComCodeProcedure(Map map);
	
	int modifyComCodeDeta (ComCodeDetaModifyVO mvo);
}
