package com.gelato.app.com.deta.service;

import java.util.List;
import java.util.Map;

import com.gelato.app.com.deta.dao.ComCodeDetaVO;

public interface ComCodeDetaService {

	List<ComCodeDetaVO> findComCodeDeta();
	Map findComCodeProcedure(Map map);
}
