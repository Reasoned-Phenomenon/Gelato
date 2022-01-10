package com.gelato.app.com.dao;

import java.util.List;

public interface ComCodeMapper {
	List<ComCodeVO> findComCode ();
	int insertComCode(ComCodeVO vo);
	int updateComCode(ComCodeVO vo);
	int deleteComCode(ComCodeVO vo);
}
