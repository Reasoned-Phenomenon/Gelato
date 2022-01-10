package com.gelato.app.com.comCode.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gelato.app.com.comCode.dao.ComCodeMapper;
import com.gelato.app.com.comCode.dao.ComCodeModifyVO;
import com.gelato.app.com.comCode.dao.ComCodeVO;
import com.gelato.app.com.comCode.service.ComCodeService;

@Service
public class ComCodeServiceImpl implements ComCodeService {

	@Autowired ComCodeMapper mapper;
	
	@Override
	public List<ComCodeVO> findComCode() {
		return mapper.findComCode();
	}

	@Override
	public int modifyComCode(ComCodeModifyVO mvo) {
		
		for(ComCodeVO vo : mvo.getCreatedRows()) {
			mapper.insertComCode(vo);
		}
		
		for(ComCodeVO vo : mvo.getUpdatedRows()) {
			mapper.updateComCode(vo);
		}
		
		for(ComCodeVO vo : mvo.getDeletedRows()) {
			mapper.deleteComCode(vo);
		}
		
		return 0;
	}

	
}
