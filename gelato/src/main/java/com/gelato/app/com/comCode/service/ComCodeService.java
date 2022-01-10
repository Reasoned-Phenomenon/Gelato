package com.gelato.app.com.comCode.service;

import java.util.List;

import com.gelato.app.com.comCode.dao.ComCodeModifyVO;
import com.gelato.app.com.comCode.dao.ComCodeVO;

public interface ComCodeService {
	
	List<ComCodeVO> findComCode ();
	
	int modifyComCode (ComCodeModifyVO mvo);
}
