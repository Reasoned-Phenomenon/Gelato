package com.gelato.app.rwmatr.order.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gelato.app.rwmatr.order.dao.RwmatroMapper;
import com.gelato.app.rwmatr.order.dao.RwmatroVO;
import com.gelato.app.rwmatr.order.service.RwmatroService;

@Service
public class RwmatroServiceImpl implements RwmatroService {

	@Autowired RwmatroMapper rwmatroMapper;
	
	@Override
	public List<RwmatroVO> rwmatrOrderList() {
		return rwmatroMapper.rwmatrOrderList();
	}

}
