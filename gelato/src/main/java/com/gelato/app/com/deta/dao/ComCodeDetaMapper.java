package com.gelato.app.com.deta.dao;

import java.util.List;
import java.util.Map;

public interface ComCodeDetaMapper {

	List<ComCodeDetaVO> findComCodeDeta(ComCodeDetaVO vo);
	Map findComCodeProcedure(Map map);
	
	int insertComCodeDeta(ComCodeDetaVO vo);
	int updateComCodeDeta(ComCodeDetaVO vo);
	int deleteComCodeDeta(ComCodeDetaVO vo);
	
}
