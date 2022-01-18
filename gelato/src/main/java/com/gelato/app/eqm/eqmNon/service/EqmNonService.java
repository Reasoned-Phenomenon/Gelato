package com.gelato.app.eqm.eqmNon.service;

import java.util.List;

import com.gelato.app.eqm.dao.EqmVO;
import com.gelato.app.eqm.eqmNon.dao.EqmNonVO;

public interface EqmNonService {
	
	//비가동설비 조회
	List<EqmVO> eqmNonList(EqmVO eqmVo);

	// 비가동관리 내역조회
	List<EqmNonVO> eqmNonSelect(EqmNonVO eqmNonVo);

	//비가동관리 등록
	int insertNonEqm(EqmNonVO eqmNonVo);

}