package com.gelato.app.rwmatr.istInsp.service;

import java.util.List;
import java.util.Map;

import com.gelato.app.rwmatr.istInsp.dao.RwmatrIstInspVO;
import com.gelato.app.vr.ModifyVO;

public interface RwmatrIstInspService {

	//입고검사내역 전체조회
	List<RwmatrIstInspVO> RwmatrIstInspList(Map<String, String> map);
	
	public int modifyIstInsp(ModifyVO<RwmatrIstInspVO> mvo);
}
