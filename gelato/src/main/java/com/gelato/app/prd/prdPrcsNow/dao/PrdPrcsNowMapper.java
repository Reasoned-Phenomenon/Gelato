package com.gelato.app.prd.prdPrcsNow.dao;

import java.util.List;

public interface PrdPrcsNowMapper {

	// 공정목록 출력
	List<PrdPrcsNowVO> prcsList(PrdPrcsNowVO vo);
	
	// 공정별 실적
	List<PrdPrcsNowVO> prcsDetaList(PrdPrcsNowVO vo);
}
