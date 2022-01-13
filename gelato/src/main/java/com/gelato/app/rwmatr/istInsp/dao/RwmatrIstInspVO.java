package com.gelato.app.rwmatr.istInsp.dao;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class RwmatrIstInspVO {
	
	String rwmatrId;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	Date dt;
	String passQy;
	String inferQy;
	String remk;
	String mngr;
	String rwmatrOrderDetaId;
	
	//join
	String orderId;
	String nm;
	String qy;
}