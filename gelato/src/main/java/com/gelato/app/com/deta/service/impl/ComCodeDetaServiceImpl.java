package com.gelato.app.com.deta.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gelato.app.com.deta.dao.ComCodeDetaMapper;
import com.gelato.app.com.deta.dao.ComCodeDetaModifyVO;
import com.gelato.app.com.deta.dao.ComCodeDetaVO;
import com.gelato.app.com.deta.service.ComCodeDetaService;

@Service
public class ComCodeDetaServiceImpl implements ComCodeDetaService {

	@Autowired ComCodeDetaMapper detaMapper;
	
	@Override
	public List<ComCodeDetaVO> findComCodeDeta(String codeId) {
		return detaMapper.findComCodeDeta(codeId);
	}

	@Override
	public Map findComCodeProcedure(Map map) {
		return detaMapper.findComCodeProcedure(map);
	}

	@Override
	public int modifyComCodeDeta(ComCodeDetaModifyVO mvo) {
		
		for(ComCodeDetaVO vo : mvo.getCreatedRows()) {
			detaMapper.insertComCodeDeta(vo);
		}
		
		for(ComCodeDetaVO vo : mvo.getUpdatedRows()) {
			//detaMapper.updateComCode(vo);
		}
		
		for(ComCodeDetaVO vo : mvo.getDeletedRows()) {
			detaMapper.deleteComCodeDeta(vo);
		}
		
		return 0;
	}

}
