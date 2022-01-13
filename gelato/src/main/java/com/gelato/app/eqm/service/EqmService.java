package com.gelato.app.eqm.service;

import java.util.List;

import com.gelato.app.eqm.dao.EqmNonVO;
import com.gelato.app.eqm.dao.EqmVO;

public interface EqmService {

	int insertEqm(EqmVO eqmVo);

	List<EqmVO> eqmList(EqmVO eqmVo);

	EqmVO eqmSelect(EqmVO eqmVo);

	//EqmVO eqmUpdate(EqmVO eqmVo);
	int eqmUpdate(EqmVO eqmVo);

	int eqmDelete(EqmVO eqmVo);
	
	List<EqmNonVO> eqmNon(EqmNonVO eqmNonVo);
}
