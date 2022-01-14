package com.gelato.app.com.bomCode.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gelato.app.com.bomCode.dao.BomCodeMapper;
import com.gelato.app.com.bomCode.dao.BomCodeVO;
import com.gelato.app.com.bomCode.service.BomCodeService;

@Service
public class BomCodeServiceImpl implements BomCodeService {

	@Autowired BomCodeMapper bomcodeMapper;
	
	@Override
	public List<BomCodeVO> findBomList(BomCodeVO vo) {
		
		return bomcodeMapper.findBomList(vo);
	}

}
