package com.gelato.app.com.service;

import java.util.List;

import com.gelato.app.com.dao.ComCodeModifyVO;
import com.gelato.app.com.dao.ComCodeVO;

public interface ComCodeService {
	List<ComCodeVO> findComCode ();
	int modifyComCode (ComCodeModifyVO mvo);
}