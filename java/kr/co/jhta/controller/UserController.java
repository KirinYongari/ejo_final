package kr.co.jhta.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jhta.service.ForUService;

import kr.co.jhta.service.MusicService;
import kr.co.jhta.service.ThemeService;
import kr.co.jhta.service.TicketService;
import kr.co.jhta.service.UserService;
import kr.co.jhta.utils.SessionUtils;
import kr.co.jhta.vo.Criteria;
import kr.co.jhta.vo.LikesPlanner;
import kr.co.jhta.vo.Pagination;
import kr.co.jhta.vo.Theme;
import kr.co.jhta.vo.Ticket;
import kr.co.jhta.vo.User;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ThemeService themeService;
	
	@Autowired
	private TicketService ticketService;
	
	@Autowired
	private ForUService forUService;

	@Autowired
	private MusicService musicService;
	
	// 로그인 페이지
	@RequestMapping(value="/user/login.do", method=RequestMethod.GET)
	public String loginform(){
		return "user/loginform";
	}
	
	// 로그인 처리
	@RequestMapping(value="/user/login.do", method=RequestMethod.POST , produces=MediaType.TEXT_PLAIN_VALUE)
	public @ResponseBody String login(@RequestParam("userid") String id, @RequestParam("pwd") String pwd, 
						@RequestParam("autoLogin") boolean  autoLogin, @RequestParam("autoId") boolean autoId,
						HttpSession session){
		
		User user = userService.getUserById(id);
		
		if(user == null){
			return "redirect:/jhta/home.do?error=fail";
		}
		if(!user.getPassword().equals(pwd)){
			return "redirect:/jhta/home.do?error=fail";
		}
		SessionUtils.setAttribute("LOGIN_USER", user);
		
		user.setLastAccessDate(new Date());
		userService.updateUser(user);
		userService.addLoginDate(user.getNo());
		
		//쿠키처리
		
		return "result";
	}
	
	// 회원가입 페이지
	@RequestMapping(value="/user/registerform.do")
	public String registerform(Model model){
		User user = new User();
		model.addAttribute("userform", user);
		
		return "user/registerform";
	}
	
	// id 중복체크
	@RequestMapping(value="/user/idCheck.do", produces=MediaType.TEXT_PLAIN_VALUE)
	public @ResponseBody String idCheck(@RequestParam("id") String id) {
		
		return (userService.getUserById(id) == null) ? "0" : "1";
	}
	
	// 회원가입 처리
	@RequestMapping(value="/user/register.do", method=RequestMethod.POST)
	public String register(@Valid @ModelAttribute("userform") User user, BindingResult errors){
		if(errors.hasErrors()) {
			System.out.println("폼 입력값 검증 실패");
			return "user/registerform";
		}else {
			System.out.println("폼 입력값 검증 통과");
		}
		
		userService.addUser(user);
		return "redirect:../home.do";
	}
	
	// 회원 수정
	@RequestMapping(value="/user/updateform.do")
	public String updateform(){
		return "user/updateform";
	}
	
	// 회원가입 수정처리
	@RequestMapping(value="/user/update.do")
	public String update(User user){
		userService.updateUser(user);
		return "redirect:home.do";
	}	
	
	// 로그아웃
	@RequestMapping(value="/user/logout.do")
	public String logout(HttpSession session){
		SessionUtils.removeAttribute("LOGIN_USER");
		return "redirect:../home.do";
	}
	
	// 마이페이지
	@RequestMapping(value="/mypage/mypage.do")
	public String mypage(HttpSession session, Model model) {
		User user = (User)session.getAttribute("LOGIN_USER");
		Theme theme = themeService.getThemeByNo(user.getThemeNo());
		model.addAttribute("theme", theme);
		return "mypage/mypage";
	}

	// ajax를 이용한 마이페이지에서 티켓예매내역 보여주기 + 페이징처리
	@RequestMapping(value="/mypage/myticketinfo.do", produces=MediaType.APPLICATION_JSON_VALUE, method=RequestMethod.GET)
	public @ResponseBody Map<String,Object> ticketReserve(Criteria criteria, @RequestParam(value="cp", required=false, defaultValue="1") int cp, HttpSession session) {
		
		User user = (User)session.getAttribute("LOGIN_USER");
		
		int totalRows = ticketService.getTotalTicketRows(criteria);
		Pagination pagination = new Pagination(totalRows, cp, 5, 5);
		
		criteria.setBeginIndex(pagination.getBeginIndex());
		criteria.setEndIndex(pagination.getEndIndex());
		
		Map<String, Object> map = new HashMap<>();
		criteria.setNo(user.getNo());
		
		List<Ticket> tickets = ticketService.getTicketsByCriteria(criteria);
		for(Ticket ticket : tickets) {
			System.out.println(ticket.getNo());
		}
		map.put("tickets", tickets);
		map.put("pagination", pagination);
		return map;
	}
	
	// ajax를 이용한 마이페이지에서 마이픽 보여주기
	@RequestMapping(value="/mypage/mypick.do", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<LikesPlanner> mypick(HttpSession session, Model model) {
		User user = (User)session.getAttribute("LOGIN_USER");
		
		List<LikesPlanner> planners = forUService.getConcertPlanner(user);
		
		return planners;
	}
	
	// ajax를 이용한 마이페이지에서 내정보 수정하기 
	@RequestMapping(value="/mypage/myinfo.do", produces=MediaType.APPLICATION_JSON_VALUE, method=RequestMethod.POST)
	public @ResponseBody User myInfo(HttpSession session) {
		User user = (User)session.getAttribute("LOGIN_USER");
		return user;
	}
	
	// 내정보 수정에서 form으로 보내기
	@RequestMapping(value="/mypage/myinfo-modify.do", method=RequestMethod.POST) 
	public String updateUser(User user, HttpSession session) {
		User loginUser = (User)session.getAttribute("LOGIN_USER");		
		user.setNo(loginUser.getNo());
		
		return "redirect:mypage.do";
	}
	
	// ajax를 이용한 마이페이지에서 회원탈퇴하기
	@RequestMapping(value="/mypage/mywithraw.do", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody User withrawal(HttpSession session, @RequestParam("userAvail") String userAvail) {
		User user = (User)session.getAttribute("LOGIN_USER");
		
		user.setAvailable("N");
		userService.updateUser(user);
		
		return user;
	}
	
}
