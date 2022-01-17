package com.gelato.app.prd.prdPlanFind.dao;

import java.time.LocalDate;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class PrdPlanMngFindVO {
	
	//order_sht
	String orderId;
	String vendId;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	Date orderDt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	Date oustDt;
	String stFg;
	String remk;
	
	//order_sht_deta
	String orderShtDetaId;
	String prdtId;
	String qy;
	
	//prod_plan
	String planId;
	String name;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	Date dt;
	String prodDcnt;
	String fg;
	
	//prod_plan_deta
	String planDetaId;
	String priort;
	
	//excp
	String rwmatrId;
	
	//prdt
	String prdtNm;
	String spec;
	String unit;
	String safStc;
	
	//bom
	String bomId;
	String prcsId;
	String useYn;
	
	//vend
	String vendName;
	
	String startD;
	String endD;
	
}