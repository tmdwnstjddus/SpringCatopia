package com.catwebsite.mapper;

import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;

import com.catwebsite.vo.Market;
import com.catwebsite.vo.MarketComment;
import com.catwebsite.vo.MarketFile;

public interface MarketMapper {
	
	List<Market> selectMarkets();
	
	Market selectMarketByMkboardNo(int mkboardNo);
	
	List<MarketFile> selectMarketFilesByMkboardNo(int mkboardNo);
	
 
	MarketFile selectMarketFileByMarketFileNo(int fileNo);
	
	void deleteMarket(int mkboardNo);
	
	void insertMarket(Market market);
	void insertMarket2(Market market);
	
	void insertMarketFile(MarketFile file);
 
	
	void deleteMarketFile(int marketFileNo);
	
	void updateMarket(Market market);
	
	/* ==================================================== */

	void insertComment(MarketComment comment);
	
	void updateComment(MarketComment comment);

	void deleteComment(int commentNo);

	List<MarketComment> selectCommentsByMkboardNo(int mkboardNo);
	
	void updateCommentStep(MarketComment comment);
	
	void insertRecomment(MarketComment comment);
	
	MarketComment selectCommentByCommentNo(int commentNo);

	List<Market> selectMarketlist(HashMap<String, Object> params);

 

 

	

	

	 

	

	

	

	

	

}
