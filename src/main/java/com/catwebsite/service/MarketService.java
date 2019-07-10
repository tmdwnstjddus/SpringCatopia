package com.catwebsite.service;

import java.util.List;

import com.catwebsite.vo.Market;
import com.catwebsite.vo.MarketComment;
import com.catwebsite.vo.MarketFile;

public interface MarketService {
	
	int registerMarket(Market market);
	
	void registerMarketFile(MarketFile marketFile);
	
	List<Market> findMarketList();
	
	Market findMarketByMkboardNo(int mkboardNo);
	
	List<MarketFile> findMarketFilesByMkboardNo(int mkboardNo);
	
	MarketFile findMarketFileByMarketFileNo(int marketFileNo);
	
	void deleteMarket(int  mkboardNo);
	
	void deleteMarketFile(int fileNo);
	
	void updateMarket(Market market);
	
	/* ==================================================== */

	void writeComment(MarketComment comment);
	
	void deleteComment(int commentNo);

	void updateComment(MarketComment comment);

	List<MarketComment> findCommentListByMkboardNo(int mkboardNo);
	
	void writeRecomment(MarketComment comment);

	List<Market> findMarketlist(String category);

	 

 

}
