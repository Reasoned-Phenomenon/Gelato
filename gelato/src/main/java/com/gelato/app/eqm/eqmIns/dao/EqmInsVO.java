package com.gelato.app.eqm.eqmIns.dao;

import lombok.Data;

@Data
public class EqmInsVO {
	
	String eqmId;		//설비코드
	String chckDt;		//점검일자
	String chckDeta;	//점검내용
	String judt;		//판정
	String inspr;		//검수인
	
	String eqmName;		//설비명
	String chckPerd;	//점검주기		
	
	String nCkDt;		//차기점검일 : 점검일 + 점검주기
	String gubun;
	
	String fromCkDate;	
	String toCkDate;
}
