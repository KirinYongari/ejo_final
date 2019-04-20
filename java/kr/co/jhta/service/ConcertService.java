package kr.co.jhta.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.jhta.vo.Concert;
import kr.co.jhta.vo.Criteria;
import kr.co.jhta.vo.Expect;
import kr.co.jhta.vo.Performance;
import kr.co.jhta.vo.Question;
import kr.co.jhta.vo.Review;

public interface ConcertService {

	int getConcertCount();
	
	Concert getConcertByNo(int concertNo);
	
	Concert getConcertByNoForAdmin(int concertNo);
	
	List<Concert> getConcerts();
	
	List<Concert> getLikeConcerts();
	
	List<Concert> getNewConcerts();
	
	List<Concert> getNewFiveActing();		// 메인에 뿌려줄 연극 최신순 5개
	
	List<Concert> getLikeFiveConcerts();	// 메인에 뿌려줄 콘서트 인기순 5개
	
	List<Concert> getPopularFiveActing();	// 메인에 뿌려줄 연극 인기순 5개
	
	List<Performance> getPerfByConNo(int conNo);

	int getTotalConcertRows(Criteria criteria);

	List<Concert> getConcertsByCriteria(Criteria criteria);
	
	List<Concert> getSortConcerts(Criteria criteria);

	void addConcert(Concert concert);

	void updateConcert(Concert concert);

	void addPerformance(Performance performance);
	
	List<Map<String, Object>> getRank(Criteria criteria);

	void setSession(HttpServletRequest request,HttpServletResponse response,HttpSession session,int conNo);
	List<Concert> getSerssion(HttpServletRequest request);
	
	int getCountExpect(int conNo);
	int getCountReview(int conNo);
	int getCountQuestion(int conNo);
	
	List<Expect> getExpects(int conNo);
	List<Review> getReviews(int conNo);
	List<Question> getQuestion(int conNo);
	
	void addExpect(Expect expect);
	void addReview(Review review);
	void addQuestion(Question question);
	
	List<Performance> getPerformanceTiemByConcertNo(int conNo);
}
