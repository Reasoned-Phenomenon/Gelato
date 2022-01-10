package com.gelato.app.prd.prdPlan.dao;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class PrdPlanMngVO {
	
	//order_sht
	String orderId;
	String vendId;
	String oustDt;
	String stFg;
	String remk;
	
	//order_sht_deta
	String orderShtDetaId;
	String prdtId;
	String qy;
	
	//prod_plan
	String planId;
	String name;
	@DateTimeFormat(pattern = "yyyyMMdd")
	LocalDate dt;
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
	
	
	
}
