package com.gelato.app.prd.prdIndica.dao;

import java.util.List;

public interface PrdIndicaMngMapper {

	//미지시 생산계획 조회
	List<PrdIndicaMngVO> nonIndicaList();
}
