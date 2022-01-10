package com.gelato.app.eqm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gelato.app.eqm.dao.Eqm;
import com.gelato.app.eqm.dao.EqmMapper;
import com.gelato.app.eqm.service.EqmService;

@Service	
public class EqmServiceImpl implements EqmService{
	
	@Autowired EqmMapper eqmMapper;
	
	@Override
	public int insertEqm(Eqm eqm) {
		return eqmMapper.insertEqm(eqm);
	}
	
}
