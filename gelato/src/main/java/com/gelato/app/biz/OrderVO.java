package com.gelato.app.biz;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class OrderVO {

	String orderId; // 주문코드.
	String vendId;  // 업체 코드.
	@JsonFormat(pattern="yyyy-MM-dd")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	Date orderDt;  // 주문 일자.
	@JsonFormat(pattern="yyyy-MM-dd")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	Date oustDt; // 납기 일자.
	String stFg; // 진행상황 구분.
	String remk; // 비고.
	
	
	// 주문서 디테일(join)
	String orderShtDetaId; // 주문서 디테일 코드.
	String prdtId;         // 제품 코드.
	String qy;             // 수량.
	
	// 거래처(join) 
	String vendName;       // 업체명.
}
