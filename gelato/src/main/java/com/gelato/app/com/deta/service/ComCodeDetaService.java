package com.gelato.app.com.deta.service;

import java.util.List;
import java.util.Map;

import com.gelato.app.com.deta.dao.ComCodeDetaVO;
import com.gelato.app.vr.ModifyVO;

public interface ComCodeDetaService {

	List<ComCodeDetaVO> findComCodeDeta(ComCodeDetaVO vo);
	Map findComCodeProcedure(Map map);
	
	int modifyComCodeDeta (ModifyVO<ComCodeDetaVO> mvo);
}
