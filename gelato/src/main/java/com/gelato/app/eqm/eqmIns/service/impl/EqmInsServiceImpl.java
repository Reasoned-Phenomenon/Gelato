package com.gelato.app.eqm.eqmIns.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gelato.app.eqm.eqmIns.dao.EqmInsMapper;
import com.gelato.app.eqm.eqmIns.service.EqmInsService;

@Service
public class EqmInsServiceImpl implements EqmInsService{

	@Autowired EqmInsMapper mapper;
	
}
