package kr.co.jhta.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.codec.multipart.SynchronossPartHttpMessageReader;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import kr.co.jhta.dao.ArtDao;
import kr.co.jhta.dao.ForUDao;
import kr.co.jhta.dao.HallDao;
import kr.co.jhta.dao.PerformanceDao;
import kr.co.jhta.vo.Concert;
import kr.co.jhta.vo.Criteria;
import kr.co.jhta.vo.Expect;
import kr.co.jhta.vo.Hall;
import kr.co.jhta.vo.LikesPlanner;
import kr.co.jhta.vo.Pagination;
import kr.co.jhta.vo.Performance;
import kr.co.jhta.vo.Question;
import kr.co.jhta.vo.Review;

@Service
public class ArtServiceImpl implements ArtService {

	@Autowired
	private ArtDao artDao;
	@Autowired
	private HallDao hallDao;
	
	@Autowired
	private ForUDao forUDao;
	
	@Autowired
	private PerformanceDao performanceDao;
	
	@Override
	public int countByConcert() {		
		return artDao.countByConcert();
		
	}

	@Override
	public Concert getConcertByno(int no) {
		Concert concert = artDao.getConcertByno(no); 
 		List<Hall> getHallByConcertNo = hallDao.getHallByConcertNo(concert.getNo());
		concert.setHalls(getHallByConcertNo);
 		return concert;
	}
	//랜덤으로 6개 가져오기
	public List<Concert> getRandomConcert(){
		return artDao.getRandomConcert();
	}
	
	@Override
	public List<Concert> getConcertByDate() {
		
		List<Concert> getConcerts = artDao.getConcertByDate();
		
		return getConcertIterator(getConcerts);
		
	}

	@Override
	public List<Concert> getConcerts(Pagination pagination) {
		List<Concert> getConcerts = artDao.getConcerts(pagination);
		return getConcertIterator(getConcerts);
		
	}
	

	@Override
	public List<Performance> getPerformanceByConcertNo(int concertNo) {
		return artDao.getPerformanceByConcertNo(concertNo);
	}

	@Override
	public List<Performance> getPerFomranceByMap(Map<String, Object> map) {
		
		return artDao.getPerFomranceByMap(map);
	}
	public Performance getPerformanceByNo(int performanceNo) {
		return artDao.getPerformanceByNo(performanceNo);
	}
	
	
	public List<Concert> getConcertsByOpenTicketDate(Map<String, String> map){
		return artDao.getConcertsByOpenTicketDate(map);
	}

	@Override
	public List<Concert> getConcertsByCriteria(int cp, String opt, String keyword, String orders) {
		Criteria criteria = new Criteria();
		
		if(opt != null && !opt.isEmpty()) {
			criteria.setOpt(opt);
		}
		
		if(keyword != null && !keyword.isEmpty()) {
			criteria.setKeyword(keyword);
		}
		
		int rows = 10;
		int totalRows = artDao.countByOpenConcert(criteria);
		
		Pagination pagination = new Pagination(totalRows, cp, 0 , rows);
		criteria.setOrderby(orders);
		criteria.setBeginIndex(pagination.getBeginIndex());
		criteria.setEndIndex(pagination.getEndIndex());
		
		return artDao.getConcertsByOpenTicket(criteria);
				
	}

	@Override
	public void setSession(HttpServletRequest request,HttpServletResponse response,HttpSession session,int concertNo,int userNo) {
		
		Cookie[] cookies = request.getCookies();
		
		if(cookies !=null){
			String cookieValue = this.getCookieValue(cookies, "recent-concert");
			System.out.println("cookie set"+cookieValue);
			if(cookieValue == null || cookieValue.isEmpty()) {
				Cookie cookie = new Cookie("recent-concert", String.valueOf(concertNo));
				cookie.setPath("/");
				cookie.setMaxAge(60*60*24*365);
				response.addCookie(cookie);
			}else {
				String currentValue = this.addCookieValue(cookieValue, concertNo);
				if(userNo != 0) {
				List<LikesPlanner> likesPlanner = forUDao.plannerByUserNo(userNo);
				List<Integer> concertlist = new ArrayList<>();
				String[] recentConcertsNo  = currentValue.split(":");
				for(String recconcertNo : recentConcertsNo) {
					concertlist.add(Integer.parseInt(recconcertNo));
				}
				System.out.println("디테일 현재쿠키 : " + currentValue);
				
				
				Iterator<Integer> cookieIter = concertlist.iterator();
				
					while (cookieIter.hasNext()) {
						int cookieNo = cookieIter.next();
						System.out.println("cookieNo"+cookieNo);
						if(existPlanner(likesPlanner,cookieNo)) {
							System.out.println("exist : true");
							cookieIter.remove();				
						}
					} 
				
				String concertNumbersStr = StringUtils.collectionToDelimitedString(concertlist, ":");
				System.out.println("디테일 처리 후 쿠키 : " + concertNumbersStr);
				
				
				}
				Cookie cookie = new Cookie("recent-concert",currentValue);
				cookie.setPath("/");
				cookie.setMaxAge(60*60*24*365);
				response.addCookie(cookie);
			}
		}
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
					Concert concert = artDao.getConcertByno(Integer.parseInt(cookieNo));
					cookieConcerts.add(concert);
				}
			}
			
		}
		return cookieConcerts;
	}
	
		

	@Override
	public int getCountExpect(int concertNo) {
		
		return artDao.getCountExpect(concertNo);
	}

	@Override
	public int getCountReview(int concertNo) {
		return artDao.getCountReview(concertNo);
	}

	@Override
	public int getCountQuestion(int concertNo) {
		// TODO Auto-generated method stub
		return artDao.getCountQuestion(concertNo);
	}

	@Override
	public List<Expect> getExpects(int concertNo) {
		// TODO Auto-generated method stub
		
		return artDao.getExpects(concertNo);
	}

	@Override
	public List<Review> getReviews(int concertNo) {
		// TODO Auto-generated method stub
		
		return artDao.getReviews(concertNo);
	}

	@Override
	public List<Question> getQuestion(int concertNo) {
		// TODO Auto-generated method stub
		
		
		return artDao.getQuestions(concertNo);
	}

	@Override
	public void addExpect(Expect expect) {
		artDao.addExpect(expect);
		
	}

	@Override
	public void addReview(Review reivew) {
		// TODO Auto-generated method stub
		artDao.addReview(reivew);
	}

	@Override
	public void addQuestion(Question question) {
		// TODO Auto-generated method stub
		artDao.addQuestion(question);
	}

	
	
	private List<Concert> getConcertIterator(List<Concert> getCocnerts) {
		
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
	
	
	private String addCookieValue(String cookieValue, int concertNo){
		List<String> concerts = new ArrayList<>();
		System.out.println("add"+ cookieValue);
		String[] concertValue = cookieValue.split(":");
		for(String value : concertValue){
			concerts.add(value);
		}
		if(concerts.contains(String.valueOf(concertNo))){
			return cookieValue;
		}
		if(concerts.size()>10){
			concerts.remove(0);
		}
		concerts.add(String.valueOf(concertNo));
		String currentValue = String.join(":", concerts);
		
		
		return currentValue;
		
		
	}
	
	private boolean existPlanner(List<LikesPlanner> likesPlanner, int concertNo) {
		Iterator<LikesPlanner> pannersIter = likesPlanner.iterator();
		while (pannersIter.hasNext()) {
			if (pannersIter.next().getConcert().getNo() == concertNo) {
				System.out.println("true");
				return true;
			}
		}
		return false;
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
	public List<Concert> getOpenIfream() {
		// TODO Auto-generated method stub
		return artDao.getOpenIfream();
	}

	@Override
	public List<Performance> getPerformanceTiemByConcertNo(int concertno) {
		// TODO Auto-generated method stub
		return artDao.getPerformanceTiemByConcertNo(concertno);
	}

	@Override
	public List<Performance> gethallByconcertNo(int concertNo) {
		// TODO Auto-generated method stub
		return performanceDao.gethallByconcertNo(concertNo);
	}
	
}
