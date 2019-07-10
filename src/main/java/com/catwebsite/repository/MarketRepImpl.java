package com.catwebsite.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.catwebsite.mapper.MarketMapper;
import com.catwebsite.vo.Market;
import com.catwebsite.vo.MarketComment;
import com.catwebsite.vo.MarketFile;
import com.catwebsite.vo.Question;

public class MarketRepImpl implements MarketRep {

	private SqlSessionTemplate sessionTemplate;

	public SqlSessionTemplate getSessionTemplate() {
		return sessionTemplate;
	}

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}

	private MarketMapper marketMapper;

	public MarketMapper getMarketMapper() {
		return marketMapper;
	}

	public void setMarketMapper(MarketMapper marketMapper) {
		this.marketMapper = marketMapper;
	}

	// 반환 값은 UPLOAD 테이블에 새로 INSERT된 데이터의 UPLOADNO (NEXTVAL한 후의 CURRVAL)
	@Override
	public int insertMarket(Market market) {
		//System.out.println(market.getMkboardNo()+" / 1");
		marketMapper.insertMarket(market);
		//System.out.println(market.getMkboardNo()+" / 2");
		return market.getMkboardNo();

//		marketMapper.insertMarket2(market); ///////////////////////////
//		return market.getMkboardNo();
	}

	@Override
	public void insertMarketFile(MarketFile file) {

		marketMapper.insertMarketFile(file);

	}

	@Override
	public ArrayList<Market> selectMarkets() {

		List<Market> markets = marketMapper.selectMarkets();

		return (ArrayList<Market>) markets;

	}

	@Override
	public Market selectMarketByMkboardNo(int mkboardNo) {
		
		Market market = marketMapper.selectMarketByMkboardNo(mkboardNo);

		return market; // 호출한 곳으로 조회한 데이터를 반환
	}

	@Override
	public ArrayList<MarketFile> selectMarketFilesByMkboardNo(int mkboardNo) {
		List<MarketFile> files = marketMapper.selectMarketFilesByMkboardNo(mkboardNo);

		return (ArrayList<MarketFile>) files;
	}

	@Override
	public MarketFile selectMarketFileByMarketFileNo(int fileNo) {
		MarketFile file = marketMapper.selectMarketFileByMarketFileNo(fileNo);
		return file; // 호출한 곳으로 조회한 데이터를 반환
	}

	@Override
	public void deleteMarket(int mkboardNo) {
		marketMapper.deleteMarket(mkboardNo);
	}

	@Override
	public void deleteMarketFile(int fileNo) {
		marketMapper.deleteMarketFile(fileNo);
	}

	@Override
	public void updateMarket(Market market) {
		marketMapper.updateMarket(market);
	}

	/* ==================================================== */

	@Override
	public void insertComment(MarketComment comment) {
		marketMapper.insertComment(comment);
	}

	@Override
	public void updateComment(MarketComment comment) {
		marketMapper.updateComment(comment);
	}

	@Override
	public void deleteComment(int commentNo) {
		marketMapper.deleteComment(commentNo);
	}

	@Override
	public ArrayList<MarketComment> selectCommentsByMkboardNo(int mkboardNo) {
		List<MarketComment> comments = marketMapper.selectCommentsByMkboardNo(mkboardNo);
		return (ArrayList<MarketComment>) comments;
	}

	@Override
	public MarketComment selectCommentByCommentNo(int commentNo) {
		MarketComment comment = marketMapper.selectCommentByCommentNo(commentNo);
		return comment;
	}

	@Override
	public void updateCommentStep(MarketComment comment) {
		marketMapper.updateCommentStep(comment);
	}

	@Override
	public void insertRecomment(MarketComment comment) {
		marketMapper.insertRecomment(comment);
	}

	@Override
	public List<Market> selectMarketlist(String category) {
		 
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("category", category);
		//List<Question> Questions = QuestionMapper.selectQuestionlist(category);
		List<Market> Markets = marketMapper.selectMarketlist(params);
		return (ArrayList<Market>)Markets;
	}

}
