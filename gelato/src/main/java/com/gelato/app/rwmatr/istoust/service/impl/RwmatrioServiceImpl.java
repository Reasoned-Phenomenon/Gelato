package com.gelato.app.rwmatr.istoust.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gelato.app.rwmatr.istoust.dao.RwmatrioMapper;
import com.gelato.app.rwmatr.istoust.dao.RwmatrioVO;
import com.gelato.app.rwmatr.istoust.service.RwmatrioService;

@Service
public class RwmatrioServiceImpl implements RwmatrioService {

	@Autowired RwmatrioMapper rwmatrioMapper;

	@Override
	public List<RwmatrioVO> RwmatrIstList(RwmatrioVO vo) {
		return rwmatrioMapper.RwmatrIstList(vo);
	}

	@Override
	public List<RwmatrioVO> rwmatrPassList(RwmatrioVO vo) {
		return rwmatrioMapper.RwmatrPassList(vo);
	}
}
