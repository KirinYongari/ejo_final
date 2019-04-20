package kr.co.jhta.dao;

import java.util.List;
import java.util.Map;

import kr.co.jhta.vo.Concert;
import kr.co.jhta.vo.Criteria;
import kr.co.jhta.vo.Expect;
import kr.co.jhta.vo.Pagination;
import kr.co.jhta.vo.Performance;
import kr.co.jhta.vo.Question;
import kr.co.jhta.vo.Review;


public interface ArtDao {
	
	int countByConcert();
	//공연 정보 가져오기
	Concert getConcertByno(int no);
	//최근 등록된 날짜 연극 가져오기 
	List<Concert> getConcertByDate();
	//총 공연 정보 가오기
	List<Concert> getConcerts(Pagination pagination);
	//랜덤으로 6개 가져오기
	List<Concert> getRandomConcert();
	
	//퍼포먼스 dao
	//공연
	List<Performance> getPerformances();
	
	List<Performance> getPerformanceByConcertNo(int concertNo);
	
	List<Performance> getPerFomranceByMap(Map<String, Object> map);
	
	Performance	getPerformanceByNo(int performanceNo);
	
	
	//티켓 오픈
	int countByOpenConcert(Criteria criteria);
	
	List<Concert> getConcertsByOpenTicket(Criteria criteria);
	
	List<Concert> getConcertsByOpenTicketDate(Map<String, String> map);
	
	//기대평
	int getCountExpect(int concertNo);
	int getCountReview(int concertNo);
	int getCountQuestion(int concertNo);
	
	List<Expect> getExpects(int concertNo);
	List<Review> getReviews(int concertNo);
	List<Question> getQuestions(int concertNo);
	
	//추가
	void addExpect(Expect expect);
	void addReview(Review reivew);
	void addQuestion(Question question);
	
	
	List<Concert> getOpenIfream();
	List<Performance> getPerformanceTiemByConcertNo(int concertno);
}
