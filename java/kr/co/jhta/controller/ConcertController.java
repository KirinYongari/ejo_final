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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jhta.service.ConcertService;
import kr.co.jhta.service.ForUService;
import kr.co.jhta.vo.Album;
import kr.co.jhta.vo.Concert;
import kr.co.jhta.vo.Criteria;
import kr.co.jhta.vo.Expect;
import kr.co.jhta.vo.LikesPlanner;
import kr.co.jhta.vo.Performance;
import kr.co.jhta.vo.Question;
import kr.co.jhta.vo.Review;
import kr.co.jhta.vo.User;

@Controller
public class ConcertController {

	@Autowired
	private ConcertService concertService;
	
	@Autowired
	private ForUService forUService;
	
	@RequestMapping(value="/con/list.do")
	public String conlist(Model model) {

		model.addAttribute("likecon", concertService.getLikeConcerts());
		
		return "concerts/conlist";
	}
	
	@RequestMapping(value="/con/conlist.do", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Concert> conlist(@RequestParam("opt") String opt, @RequestParam("sortby") String sortby) {
		
		Criteria criteria = new Criteria();
		criteria.setOpt(opt);
		criteria.setSortby(sortby);
		
		return concertService.getSortConcerts(criteria);
	}

	@RequestMapping(value="/con/detail.do")
	public String detail(@RequestParam("conNo") int conNo, Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {

		Concert con = concertService.getConcertByNo(conNo);
		List<Performance> perfs = concertService.getPerfByConNo(conNo);
		concertService.setSession(request, response, session, conNo);
		
		model.addAttribute("con", con);
		model.addAttribute("perfs", perfs);
		
		int countExpect = concertService.getCountExpect(conNo);
		int countReview = concertService.getCountReview(conNo);
		int countQuestion = concertService.getCountQuestion(conNo);
		User user = (User)session.getAttribute("LOGIN_USER");
		model.addAttribute("user",user);
		model.addAttribute("countExpect",countExpect);
		model.addAttribute("countReview",countReview);
		model.addAttribute("countQuestion",countQuestion);
		
		List<Expect> initExpect = concertService.getExpects(conNo);
		
		List<Review> initReview = concertService.getReviews(conNo);
		List<Question> initQuestion = concertService.getQuestion(conNo);
		model.addAttribute("initExpects",initExpect);
		model.addAttribute("initReviews",initReview);
		model.addAttribute("initQuestions",initQuestion);
		
		
		//공연 시간만 가져오기 
		List<Performance> PerformanceTiem = concertService.getPerformanceTiemByConcertNo(conNo);
		model.addAttribute("PerformanceTiems",PerformanceTiem);
		//공연클래너인지 아닌지 확인
		String plannerText = "";
		
		try {
			LikesPlanner planner = forUService.getLikePlannerByuserNoandConcertNo(user.getNo(), conNo);
			
			System.out.println(planner.getNo());
			plannerText = "true";
		}catch(NullPointerException e) {
			plannerText ="false";
		}
		
		model.addAttribute("plannerText",plannerText);
		
		return "concerts/condetail";
	}
	
	@RequestMapping(value="/con/expect.do", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map<String, Object> expect(Expect expect){
		
		concertService.addExpect(expect);
		int count = concertService.getCountExpect(expect.getConcert().getNo());
		Expect countExpect = new Expect();
		User user = new User();
		user.setNo(expect.getUser().getNo());
		countExpect.setUser(user);
		countExpect.setCountExpect(count);
		
		List<Expect> expects =  concertService.getExpects(expect.getConcert().getNo());
		
		Map<String,Object> map = new HashMap<>();
		map.put("expects", expects);
		map.put("countExpect", countExpect);
		
		return map;
	}
	@RequestMapping(value="/con/review.do", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map<String, Object> expect(Review review){
		System.out.println(review);
		concertService.addReview(review);
		int count = concertService.getCountReview(review.getConcert().getNo());
		Review countReview = new Review();
		User user = new User();
		user.setNo(review.getUser().getNo());
		countReview.setUser(user);
		countReview.setCountReview(count);
		
		List<Review> reviews =  concertService.getReviews(review.getConcert().getNo());
		
		Map<String,Object> map = new HashMap<>();
		map.put("reviews", reviews);
		map.put("countReview", countReview);
		
		return map;
	}
	
	@RequestMapping(value="/con/question.do", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map<String, Object> expect(Question question){
		System.out.println(question);
		concertService.addQuestion(question);
		int count = concertService.getCountQuestion(question.getConcert().getNo());
		Question countQuestion = new Question();
		User user = new User();
		user.setNo(question.getUser().getNo());
		countQuestion.setUser(user);
		countQuestion.setCountQuestion(count);
		
		List<Question> questions =  concertService.getQuestion(question.getConcert().getNo());
		
		Map<String,Object> map = new HashMap<>();
		map.put("questions", questions);
		map.put("countQuestion", countQuestion);
		
		return map;
	}
	
	@RequestMapping(value="/con/perfdetail.do")
	public @ResponseBody Map<String, Object> perfdetail(@RequestParam(value="conNo") int conNo) {
		
		Map<String, Object> map = new HashMap<>();
		List<Performance> perfs = concertService.getPerfByConNo(conNo);
		Concert con = concertService.getConcertByNo(conNo);
		map.put("perfs", perfs);
		map.put("con", con);
		
		return map;
	}
	
	@RequestMapping("/con/rank.do")
	public String rank() {
		return "concerts/conrank";
	}
	
	@RequestMapping(value="/con/rankPerf.do", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Map<String, Object>> rankPerf(@RequestParam("opt") String opt,
															@RequestParam("sortby") String sortby) {
		Criteria criteria = new Criteria();
		criteria.setOpt(opt);
		criteria.setSortby(sortby);
		List<Map<String, Object>> contents = concertService.getRank(criteria);
		
		return contents;
	}
	
	@RequestMapping("/con/newcon.do")
	public String newcon() {
		return "concerts/newcon";
	}
	
	
}
