package com.gelato.app.prd.prdIndica.service;

import java.util.List;

import com.gelato.app.prd.prdIndica.dao.PrdIndicaMngVO;

public interface PrdIndicaMngService {

	//미지시 생산계획 조회
	List<PrdIndicaMngVO> nonIndicaList();
}
