package kr.co.jhta.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;

import kr.co.jhta.vo.Concert;
import kr.co.jhta.vo.Criteria;
import kr.co.jhta.vo.Expect;
import kr.co.jhta.vo.Pagination;
import kr.co.jhta.vo.Performance;
import kr.co.jhta.vo.Question;
import kr.co.jhta.vo.Review;
import kr.co.jhta.vo.User;

public interface ArtService {

	void setSession(HttpServletRequest request,HttpServletResponse response,HttpSession session,int concertNo,int userNo);
	List<Concert> getSerssion(HttpServletRequest request);
	int countByConcert();
	//공연 정보 가져오기
	Concert getConcertByno(int no);
	//최근 날짜 등록된 아트 가져오기
	List<Concert> getConcertByDate();
	//총 공연 정보 가오기
	List<Concert> getConcerts(Pagination pagination);
	
	//랟머으로 6개 가져오기
	List<Concert> getRandomConcert();
	
	//상세페이지의 공연장 찾기
	List<Performance> gethallByconcertNo(int conNo);
	
	//퍼포먼스 dao
	List<Performance> getPerformanceByConcertNo(int concertNo);
	
	
	//회차 구하기
	List<Performance> getPerFomranceByMap(Map<String, Object> map);
	
	Performance getPerformanceByNo(int performanceNo);
	
	
	List<Concert> getConcertsByOpenTicketDate(Map<String, String> map);
	
	List<Concert> getConcertsByCriteria(int cp, String opt, String keyword, String orders);
	
	//기대평
	int getCountExpect(int concertNo);
	int getCountReview(int concertNo);
	int getCountQuestion(int concertNo);
	
	List<Expect> getExpects(int concertNo);
	List<Review> getReviews(int concertNo);
	List<Question> getQuestion(int concertNo);
	
	void addExpect(Expect expect);
	void addReview(Review review);
	void addQuestion(Question question);
	
	List<Concert> getOpenIfream();
	//공연 시간만 가져오기
	List<Performance> getPerformanceTiemByConcertNo(int concertno);
	
	
}
