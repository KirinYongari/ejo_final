package kr.co.jhta.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.dao.ConcertDao;
import kr.co.jhta.dao.HallDao;
import kr.co.jhta.dao.PerformanceDao;
import kr.co.jhta.vo.Concert;
import kr.co.jhta.vo.Criteria;
import kr.co.jhta.vo.Expect;
import kr.co.jhta.vo.Hall;
import kr.co.jhta.vo.Performance;
import kr.co.jhta.vo.Question;
import kr.co.jhta.vo.Review;

@Service
public class ConcertServiceImpl implements ConcertService {

	@Autowired
	private ConcertDao concertDao;
	@Autowired
	private HallDao hallDao;
	@Autowired
	private PerformanceDao performanceDao;
	
	@Override
	public int getConcertCount() {
		return concertDao.getConcertCount();
	}
	
	@Override
	public Concert getConcertByNo(int concertNo) {
		Concert concert = concertDao.getConcertByNo(concertNo);
		List<Hall> halls = hallDao.getHallByConcertNo(concert.getNo());
		concert.setHalls(halls);
		return concert;
	}
	
	@Override
	public Concert getConcertByNoForAdmin(int concertNo) {
		return concertDao.getConcertByNoForAdmin(concertNo);
	}
	
	@Override
	public List<Concert> getLikeConcerts() {
		return concertDao.getLikeConcerts();
	}
	
	@Override
	public List<Concert> getNewConcerts() {
		return concertDao.getNewConcerts();
	}
	
	@Override
	public List<Performance> getPerfByConNo(int conNo) {
		return performanceDao.getPerfByConNo(conNo);
	}
	
	@Override
	public List<Concert> getConcerts() {
		List<Concert> getConcerts = concertDao.getConcerts();
		return getConcertIterator(getConcerts);
	}
	
	public List<Concert> getConcertIterator(List<Concert> getCocnerts) {
		
		if(!(getCocnerts.isEmpty())) {
			Iterator<Concert> iterator =  getCocnerts.iterator();
			while(iterator.hasNext()) {
				Concert concert = iterator.next();
				List<Hall> getHallByConcertNo = hallDao.getHallByConcertNo(concert.getNo());
				concert.setHalls(getHallByConcertNo);

			}
		
		}
		return getCocnerts;
		
	}

	@Override
	public List<Concert> getSerssion(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Cookie[] cookies = request.getCookies();
		List<Concert> cookieConcerts = new ArrayList<>();
		if(cookies != null){
			String cookieValue = this.getCookieValue(cookies, "recent-concert");
			
			if(cookieValue != null && !cookieValue.isEmpty()){
				String[] concertsNo = cookieValue.split(":");
				for(String cookieNo : concertsNo){
					System.out.println("cookieNo:"+ cookieNo);
					Concert concert = concertDao.getConcertByNo(Integer.parseInt(cookieNo));
					cookieConcerts.add(concert);
				}
			}
			
		}
		return cookieConcerts;
	}
	
	@Override
	public void setSession(HttpServletRequest request,HttpServletResponse response,HttpSession session,int conNo) {
		
		Cookie[] cookies = request.getCookies();
		
		if(cookies !=null){
			String cookieValue = this.getCookieValue(cookies, "recent-concert");
			System.out.println("cookie set"+cookieValue);
			if(cookieValue == null || cookieValue.isEmpty()) {
				Cookie cookie = new Cookie("recent-concert", String.valueOf(conNo));
				cookie.setPath("/");
				cookie.setMaxAge(60*60*24*365);
				response.addCookie(cookie);
			}else {
				String currentValue = this.addCookieValue(cookieValue, conNo);
				Cookie cookie = new Cookie("recent-concert",currentValue);
				cookie.setPath("/");
				cookie.setMaxAge(60*60*24*365);
				response.addCookie(cookie);
			}
		}
	}
	
	private String addCookieValue(String cookieValue, int conNo){
		List<String> concerts = new ArrayList<>();
		System.out.println("add"+ cookieValue);
		String[] concertValue = cookieValue.split(":");
		for(String value : concertValue){
			concerts.add(value);
		}
		if(concerts.contains(String.valueOf(conNo))){
			return cookieValue;
		}
		if(concerts.size()>10){
			concerts.remove(0);
		}
		concerts.add(String.valueOf(conNo));
		String currentValue = String.join(":", concerts);
		
		return currentValue;
		
	}
	private String getCookieValue(Cookie[] cookies, String cookieName){
		
		if(cookies == null){
			return null;
		}
		for(Cookie cookie : cookies){
			String name = cookie.getName();
			if(name.equals(cookieName)){
				return cookie.getValue();
			}
		}
		return null;
	}
	
	@Override
	public int getCountExpect(int conNo) {
		
		return concertDao.getCountExpect(conNo);
	}

	@Override
	public int getCountReview(int conNo) {
		return concertDao.getCountReview(conNo);
	}

	@Override
	public int getCountQuestion(int conNo) {
		// TODO Auto-generated method stub
		return concertDao.getCountQuestion(conNo);
	}

	@Override
	public List<Expect> getExpects(int conNo) {
		// TODO Auto-generated method stub
		
		return concertDao.getExpects(conNo);
	}

	@Override
	public List<Review> getReviews(int conNo) {
		// TODO Auto-generated method stub
		
		return concertDao.getReviews(conNo);
	}

	@Override
	public List<Question> getQuestion(int conNo) {
		// TODO Auto-generated method stub
		
		
		return concertDao.getQuestions(conNo);
	}

	@Override
	public void addExpect(Expect expect) {
		concertDao.addExpect(expect);
		
	}

	@Override
	public void addReview(Review reivew) {
		// TODO Auto-generated method stub
		concertDao.addReview(reivew);
	}

	@Override
	public void addQuestion(Question question) {
		// TODO Auto-generated method stub
		concertDao.addQuestion(question);
	}
	
	@Override
	public List<Performance> getPerformanceTiemByConcertNo(int concertno) {
		// TODO Auto-generated method stub
		return concertDao.getPerformanceTiemByConcertNo(concertno);
	}
	
	@Override
	public int getTotalConcertRows(Criteria criteria) {
		return concertDao.getTotalConcertRows(criteria);
	}

	@Override
	public List<Concert> getConcertsByCriteria(Criteria criteria) {
		return concertDao.getConcertsByCriteria(criteria);
	}
	
	@Override
	public List<Concert> getSortConcerts(Criteria criteria) {
		List<Concert> getSortConcerts = concertDao.getSortConcerts(criteria);
	
		return getConcertIterator(getSortConcerts);
	}

	@Override
	public void addConcert(Concert concert) {
		concertDao.addConcert(concert);
	}

	@Override
	public void updateConcert(Concert concert) {
		concertDao.updateConcert(concert);
	}

	// 메인에 뿌려줄 콘서트 인기순 5개
	@Override
	public List<Concert> getLikeFiveConcerts() {
		return concertDao.getLikeFiveConcerts();
	}

	// 메인에 뿌려줄 연극 최신순 5개
	@Override
	public List<Concert> getNewFiveActing() {
		return concertDao.getNewFiveActing();
	}
	
	// 메인에 뿌려줄 연극 인기순 5개
	@Override
	public List<Concert> getPopularFiveActing() {
		return concertDao.getPopularFiveActing();
	}
	
	@Override
	public List<Map<String, Object>> getRank(Criteria criteria) {
		return concertDao.getRank(criteria);
	}

	@Override
	public void addPerformance(Performance performance) {
		performanceDao.addPerformance(performance);
	}
	
	
}
