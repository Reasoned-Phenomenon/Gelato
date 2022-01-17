package com.gelato.app.rwmatr.infer.service;

import java.util.List;

import com.gelato.app.rwmatr.infer.dao.RwmatrInferVO;

public interface RwmatrInferService {
	
	//자재 불량내역 전체조회
	List<RwmatrInferVO> RwmatrInferList(RwmatrInferVO vo);
}
