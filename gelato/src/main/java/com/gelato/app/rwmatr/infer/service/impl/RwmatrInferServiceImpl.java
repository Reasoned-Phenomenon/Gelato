package com.gelato.app.rwmatr.infer.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gelato.app.rwmatr.infer.dao.RwmatrInferMapper;
import com.gelato.app.rwmatr.infer.dao.RwmatrInferVO;
import com.gelato.app.rwmatr.infer.service.RwmatrInferService;

@Service
public class RwmatrInferServiceImpl implements RwmatrInferService {

	@Autowired RwmatrInferMapper rwmatrInferMapper;
	
	@Override
	public List<RwmatrInferVO> RwmatrInferList(RwmatrInferVO vo) {
		return rwmatrInferMapper.RwmatrInferList(vo);
	}
}
