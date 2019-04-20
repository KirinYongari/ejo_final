package kr.co.jhta.dao;

import java.util.List;
import java.util.Map;

import kr.co.jhta.vo.Album;
import kr.co.jhta.vo.Concert;
import kr.co.jhta.vo.Criteria;
import kr.co.jhta.vo.Expect;
import kr.co.jhta.vo.Performance;
import kr.co.jhta.vo.Question;
import kr.co.jhta.vo.Review;

public interface ConcertDao {
	
	int getConcertCount();
	Concert getConcertByNo(int concertNo);
	Concert getConcertByNoForAdmin(int concertNo);
	List<Concert> getConcerts();
	List<Concert> getLikeConcerts();
	List<Concert> getNewConcerts();
	List<Performance> getPerformanceTiemByConcertNo(int conNo);

	List<Concert> getNewFiveActing();		// 메인에 뿌려줄 연극 최신순 5개
	List<Concert> getLikeFiveConcerts();	// 메인에 뿌려줄 콘서트 인기순 5개
	List<Concert> getPopularFiveActing();	// 메인에 뿌려줄 연극 인기순 5개
	
	int getTotalConcertRows(Criteria criteria);
	List<Concert> getConcertsByCriteria(Criteria criteria);
	List<Concert> getSortConcerts(Criteria criteria);
	List<Map<String, Object>> getRank(Criteria criteria);
	
	void addConcert(Concert concert);
	void updateConcert(Concert concert);
	
	int getCountExpect(int conNo);
	int getCountReview(int conNo);
	int getCountQuestion(int conNo);
	
	List<Expect> getExpects(int conNo);
	List<Review> getReviews(int conNo);
	List<Question> getQuestions(int conNo);
	
	//추가
	void addExpect(Expect expect);
	void addReview(Review reivew);
	void addQuestion(Question question);
}
