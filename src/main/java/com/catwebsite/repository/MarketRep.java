package com.catwebsite.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.List;

import com.catwebsite.vo.Market;
import com.catwebsite.vo.MarketComment;
import com.catwebsite.vo.MarketFile;

public interface MarketRep {

	//반환 값은 UPLOAD 테이블에 새로 INSERT된 데이터의 UPLOADNO (NEXTVAL한 후의 CURRVAL)
	int insertMarket(Market market);

	void insertMarketFile(MarketFile file);

	ArrayList<Market> selectMarkets();

	Market selectMarketByMkboardNo(int mkboardNo);

	ArrayList<MarketFile> selectMarketFilesByMkboardNo(int mkboardNo);

	MarketFile selectMarketFileByMarketFileNo(int fileNo);

	void deleteMarket(int mkboardNo);

	void deleteMarketFile(int fileNo);

	void updateMarket(Market market);

	/* ==================================================== */
	
	void insertComment(MarketComment comment);
	
	void updateComment(MarketComment comment);

	void deleteComment(int commentNo);

	ArrayList<MarketComment> selectCommentsByMkboardNo(int mkboardNo);
 
	MarketComment selectCommentByCommentNo(int commentNo);
	
	void updateCommentStep(MarketComment comment);
	
	void insertRecomment(MarketComment comment);

 

	List<Market> selectMarketlist(String category);


	
	

}