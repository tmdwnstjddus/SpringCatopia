package com.catwebsite.service;

import java.util.List;
import java.util.HashMap;
import java.util.ArrayList;

import com.catwebsite.repository.MarketRep;
import com.catwebsite.vo.Market;
import com.catwebsite.vo.MarketComment;
import com.catwebsite.vo.MarketFile;
import com.catwebsite.vo.Question;

public class MarketServiceImpl implements MarketService {

	private MarketRep marketRep;	
	public MarketRep getMarketRep() {
		return marketRep;
	}
	public void setMarketRep(MarketRep marketRep) {
		this.marketRep = marketRep;
	}
	
	@Override
	public int registerMarket(Market market) {
		int newMarketNo = marketRep.insertMarket(market);
		for (MarketFile file : market.getFiles()) {
			file.setMkboardNo(newMarketNo);
			marketRep.insertMarketFile(file);
		}
		return newMarketNo;
	}
	
	@Override
	public void registerMarketFile(MarketFile marketFile) {
		marketRep.insertMarketFile(marketFile);		
	}

	@Override
	public List<Market> findMarketList() {
		
		List<Market> markets = marketRep.selectMarkets();
		return markets;
		
	}
	
	@Override
	public Market findMarketByMkboardNo(int mkboardNo) {
		
		Market market = marketRep.selectMarketByMkboardNo(mkboardNo);
		return market;
		
	}
	
	@Override
	public List<MarketFile> findMarketFilesByMkboardNo(int mkboardNo) {
		
		List<MarketFile> files = marketRep.selectMarketFilesByMkboardNo(mkboardNo);
		return files;
	}
	@Override
	public MarketFile findMarketFileByMarketFileNo(int marketFileNo) {
		
		MarketFile file = marketRep.selectMarketFileByMarketFileNo(marketFileNo);		
		return file;
	}
	
	@Override
	public void deleteMarket(int mkboardNo) {
		
		marketRep.deleteMarket(mkboardNo);
		
	}
	
	@Override
	public void deleteMarketFile(int fileNo) {
		
		marketRep.deleteMarketFile(fileNo);
		
	}
	
	@Override
	public void updateMarket(Market market) {
		
		marketRep.updateMarket(market);
		
	}
	
	/* ==================================================== */
	
	@Override
	public void writeComment(MarketComment comment) {
		
		marketRep.insertComment(comment);
		
	}
	
	@Override
	public void deleteComment(int commentNo) {
		marketRep.deleteComment(commentNo);
	}

	@Override
	public void updateComment(MarketComment comment) {
		marketRep.updateComment(comment);		
	}

	@Override
	public List<MarketComment> findCommentListByMkboardNo(int mkboardNo) {
		List<MarketComment> comments = marketRep.selectCommentsByMkboardNo(mkboardNo);
		return comments;
	}
	
	@Override
	public void writeRecomment(MarketComment comment) {		
		
		MarketComment parent = marketRep.selectCommentByCommentNo(comment.getCommentNo());
		marketRep.updateCommentStep(parent);
		
		comment.setGroupNo(parent.getGroupNo());
		comment.setDepth(parent.getDepth() + 1);
		comment.setStep(parent.getStep() + 1);		
		
		marketRep.insertRecomment(comment);
	}
	@Override
	public List<Market> findMarketlist(String category) {
		List<Market> markets = marketRep.selectMarketlist(category);
		return markets;
	}
	

}













