package com.gelato.app.com.bomCode.service;

import java.util.List;

import com.gelato.app.com.bomCode.dao.BomCodeVO;

public interface BomCodeService {

	// BOM 전체 조회.
		List<BomCodeVO> findBomList(BomCodeVO vo);
}
