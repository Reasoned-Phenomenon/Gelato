package com.gelato.app.eqm.dao;

import java.util.List;

public interface EqmMapper {
	int insertEqm(EqmVO eqmVo);
	List<EqmVO> eqmList();
}
