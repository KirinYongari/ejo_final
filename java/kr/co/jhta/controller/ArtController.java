package kr.co.jhta.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jhta.service.ArtService;
import kr.co.jhta.service.ForUService;
import kr.co.jhta.vo.Concert;
import kr.co.jhta.vo.Expect;
import kr.co.jhta.vo.LikesPlanner;
import kr.co.jhta.vo.Pagination;
import kr.co.jhta.vo.Performance;
import kr.co.jhta.vo.Question;
import kr.co.jhta.vo.Review;
import kr.co.jhta.vo.User;

@Controller
public class ArtController {

	@Autowired
	private ArtService artService;
	
	@Autowired
	private ForUService forUService;
	
	@RequestMapping(value ="/art/artPage.do")
	public String artPage(Model model) {
	
	
		int cp = 1;
		int artByCount = artService.countByConcert();
		int totalRows = artByCount;
		int rows = 10;
		
		Pagination pagination = new Pagination(totalRows, cp, 0, rows );
		//최근 등록날짜 5개
		List<Concert> artsByDate = artService.getConcertByDate();
		
		//모든 셀렉트 좋아요 순
		List<Concert> arts = artService.getConcerts(pagination);
		//연극 총 갯수
		//랜덤으로 6개 가져오기
		List<Concert> randomConcerts = artService.getRandomConcert();
		List<Concert> concerts = artService.getOpenIfream();
		model.addAttribute("concerts",concerts); 
		model.addAttribute("randomConcerts",randomConcerts);
		model.addAttribute("artsByDate", artsByDate);
		model.addAttribute("arts",arts);
		model.addAttribute("artByCount",artByCount);
		
		
		
		return "arts/artPage";
	}
	
	@RequestMapping(value="/art/detail.do")
	public String detail(@RequestParam("concertno") int concertno, Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		Concert concert = artService.getConcertByno(concertno);
		List<Performance> performance = artService.getPerformanceByConcertNo(concertno);
		System.out.println(performance.size());
		User user = (User)session.getAttribute("LOGIN_USER");
		if( user == null) {
			user = new User();
			user.setNo(0);
		}
		System.out.println(user.getTheme());
		artService.setSession(request, response, session, concertno,user.getNo());
		
		model.addAttribute("art",concert);
		model.addAttribute("performances",performance);
		
		int countExpect = artService.getCountExpect(concertno);
		int countReview = artService.getCountReview(concertno);
		int countQuestion = artService.getCountQuestion(concertno);
		
		model.addAttribute("user",user);
		model.addAttribute("countExpect",countExpect);
		model.addAttribute("countReview",countReview);
		model.addAttribute("countQuestion",countQuestion);
		
		List<Expect> initExpect = artService.getExpects(concertno);
		
		List<Review> initReview = artService.getReviews(concertno);
		List<Question> initQuestion = artService.getQuestion(concertno);
		model.addAttribute("initExpects",initExpect);
		model.addAttribute("initReviews",initReview);
		model.addAttribute("initQuestions",initQuestion);
		
		
		//공연 시간만 가져오기 
		List<Performance> PerformanceTiem = artService.getPerformanceTiemByConcertNo(concertno);
		model.addAttribute("PerformanceTiems",PerformanceTiem);
		//공연클래너인지 아닌지 확인
		String plannerText = "";
		
		try {
			LikesPlanner planner = forUService.getLikePlannerByuserNoandConcertNo(user.getNo(), concertno);
			
			System.out.println(planner.getNo());
			plannerText = "true";
		}catch(NullPointerException e) {
			plannerText ="false";
		}
		
		model.addAttribute("plannerText",plannerText);
		
		
		return "arts/detail";
		
	}
	//더하기 페이지
	@RequestMapping(value="/art/pagePlus.do", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Concert> pagePlue(@RequestParam("countPerPage") int countPerPage, @RequestParam("pageNo") int pageNo){
		
		
		int rows = 9;
		int cp = pageNo;
		System.out.println("cp:"+cp);
		int totalRows = artService.countByConcert();
		Pagination pagination = new Pagination(totalRows, cp, 0, rows );
		pagination.setBeginIndex(((cp - 1)*rows + 1));
		pagination.setEndIndex((cp*rows));
		
		List<Concert> artsPlue = artService.getConcerts(pagination);

		return artsPlue;
	}

	//날짜에 맞는 공연 시간 가져오기
	@RequestMapping(value="/art/performanceCheck.do", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Performance> perforamnceCheck(@RequestParam("dateText") String dateText, @RequestParam("concertNo") int concertNo) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("dateText", dateText);
		map.put("concertNo",concertNo);
		
		List<Performance> getPerformanceByMap = artService.getPerFomranceByMap(map);
		
		return getPerformanceByMap;
		
	}
	//해당 공연에 맞는 자석 가져오기
	@RequestMapping(value="/art/performanceSeat.do", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Performance seat(@RequestParam("performanceNo") int performanceNo ) {
		
		Performance performance = artService.getPerformanceByNo(performanceNo);
		return performance;
	}
	
	
	//공연 오픈 소식
	@RequestMapping(value="/open/openTicket.do")
	public String openTicket(Model model) {
		
		
		return "arts/openTicket";	
	}
	//공연 오픈 검색	
	@RequestMapping(value="/open/openSearch.do")
	public String openSearch(@RequestParam(value="opt",required=false, defaultValue="") String opt,
							@RequestParam(value="keyword", required=false, defaultValue="") String keyword,
							@RequestParam(value="orders", required=false, defaultValue="createDate") String orders, 
							@RequestParam(value="cp", required=false, defaultValue="1") int cp,
							Model model) {
		Map<String, String> map = new HashMap<>();
		List<Concert> concertByDate2 = artService.getConcertsByOpenTicketDate(map);
		model.addAttribute("concertByDate2", concertByDate2);
		
		map.put("selectDate", "yes");
		List<Concert> concertByDate1 = artService.getConcertsByOpenTicketDate(map);
		model.addAttribute("concertByDate1", concertByDate1);
		
		List<Concert> searchConcerts = artService.getConcertsByCriteria(cp,opt,keyword,orders);
		model.addAttribute("searchConcerts", searchConcerts);
		return "arts/openTicket";
		
	}
	//공연 검색 더 보기
	@RequestMapping(value="/open/openTicketPlus.do", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map<String, Object> openTicketPlus(
			@RequestParam(value="opt",required=false, defaultValue="") String opt,
			@RequestParam(value="keyword", required=false, defaultValue="") String keyword,
			@RequestParam(value="orders", required=false, defaultValue="createDate") String orders, 
			@RequestParam(value="cp", required=false, defaultValue="1") int cp){
		System.out.println(cp);
		Map<String, String> map = new HashMap<>();
		List<Concert> concertByDate2 = artService.getConcertsByOpenTicketDate(map);
		
		map.put("selectDate", "yes");
		List<Concert> concertByDate1 = artService.getConcertsByOpenTicketDate(map);
		
		Map<String,Object> ajaxMap = new HashMap<>();
		List<Concert> searchConcerts = artService.getConcertsByCriteria(cp,opt,keyword,orders);

		System.out.println(orders);
		ajaxMap.put("concertByDate2", concertByDate2);
		ajaxMap.put("concertByDate1", concertByDate1);
		ajaxMap.put("searchConcerts", searchConcerts);
		
		return ajaxMap;
		
	
	}
	//기대평
	@RequestMapping(value="/art/expect.do", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map<String, Object> expect(Expect expect){
		
		artService.addExpect(expect);
		int count = artService.getCountExpect(expect.getConcert().getNo());
		Expect countExpect = new Expect();
		User user = new User();
		user.setNo(expect.getUser().getNo());
		countExpect.setUser(user);
		countExpect.setCountExpect(count);
		
		List<Expect> expects =  artService.getExpects(expect.getConcert().getNo());
		
		Map<String,Object> map = new HashMap<>();
		map.put("expects", expects);
		map.put("countExpect", countExpect);
		
		return map;
	}
	@RequestMapping(value="/art/review.do", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map<String, Object> expect(Review review){
		System.out.println(review);
		artService.addReview(review);
		int count = artService.getCountReview(review.getConcert().getNo());
		Review countReview = new Review();
		User user = new User();
		user.setNo(review.getUser().getNo());
		countReview.setUser(user);
		countReview.setCountReview(count);
		
		List<Review> reviews =  artService.getReviews(review.getConcert().getNo());
		
		Map<String,Object> map = new HashMap<>();
		map.put("reviews", reviews);
		map.put("countReview", countReview);
		
		return map;
	}
	
	@RequestMapping(value="/art/question.do", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map<String, Object> expect(Question question){
		System.out.println(question);
		artService.addQuestion(question);
		int count = artService.getCountQuestion(question.getConcert().getNo());
		Question countQuestion = new Question();
		User user = new User();
		user.setNo(question.getUser().getNo());
		countQuestion.setUser(user);
		countQuestion.setCountQuestion(count);
		
		List<Question> questions =  artService.getQuestion(question.getConcert().getNo());
		
		Map<String,Object> map = new HashMap<>();
		map.put("questions", questions);
		map.put("countQuestion", countQuestion);
		
		return map;
	}
	
	@RequestMapping(value="/art/openIfream.do")
	public String openIfream(Model model){
		
		
		List<Concert> concerts = artService.getOpenIfream();
		model.addAttribute("concerts",concerts);
		return "arts/openIfream";
		
		
	}
	@RequestMapping(value="/art/openAjax.do", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Concert> ajaxIfream(){
		
		List<Concert> concerts = artService.getOpenIfream();
		return concerts;
	}
	
	//공연장 찾기
	@RequestMapping(value="/art/perfdetail.do")
	public @ResponseBody Map<String, Object> perfdetail(@RequestParam(value="concertNo") int concertNo) {
		
		Map<String, Object> map = new HashMap<>();
		List<Performance> perfs = artService.gethallByconcertNo(concertNo);
		Concert con = artService.getConcertByno(concertNo);
		map.put("perfs", perfs);
		map.put("con", con);
		
		return map;
	}
	
}
