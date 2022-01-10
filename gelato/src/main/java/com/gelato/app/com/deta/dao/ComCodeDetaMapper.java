package com.gelato.app.com.deta.dao;

import java.util.List;
import java.util.Map;

public interface ComCodeDetaMapper {

	List<ComCodeDetaVO> findComCodeDeta(String codeId);
	Map findComCodeProcedure(Map map);
}
