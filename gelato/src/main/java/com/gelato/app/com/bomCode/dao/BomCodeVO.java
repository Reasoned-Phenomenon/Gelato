package com.gelato.app.com.bomCode.dao;

import lombok.Data;

@Data
public class BomCodeVO {

		String bomId;  // 제품 BOM코드.
		String prdtId; // 제품 코드.
		String rwmatrId; // 자재 코드.
		String qy;       // 소모량.
		String prcsId;   // 공정 코드.
		String fg;       // 단계 구분.
		String remk;     // 비고. 
		String useYn;    // 사용 여부.
		
		
		// 필요한 거 있으면 vo에 추가하기.
}