package com.gelato.app.prd.prdIndicaFind.service;

import java.util.List;

import com.gelato.app.prd.prdIndicaFind.dao.PrdIndicaMngFindVO;

public interface PrdIndicaMngFindService {

	//์ง์ ์กฐํ
	List<PrdIndicaMngFindVO> indicaList(PrdIndicaMngFindVO vo);
}
