package com.gelato.app.eqm.service;

import java.util.List;

import com.gelato.app.eqm.dao.EqmVO;

public interface EqmService {

	int insertEqm(EqmVO eqmVo);

	List<EqmVO> eqmList(EqmVO eqmVo);

	EqmVO eqmSelect(EqmVO eqmVo);

	//EqmVO eqmUpdate(EqmVO eqmVo);
	int eqmUpdate(EqmVO eqmVo);

	int deleteEqm(EqmVO eqmVo);
}
