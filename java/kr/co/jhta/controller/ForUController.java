package kr.co.jhta.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.type.IntegerTypeHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jhta.service.ArtService;
import kr.co.jhta.service.ForUService;
import kr.co.jhta.service.UserService;
import kr.co.jhta.vo.Concert;
import kr.co.jhta.vo.LikesPlanner;
import kr.co.jhta.vo.User;

@Controller
public class ForUController {

	@Autowired
	ForUService forUService;
	@Autowired
	UserService userService;
	@Autowired
	ArtService artService;
	//ForU 폼
	@RequestMapping(value="/forU/form.do")
	public String form(HttpSession session, Model model, HttpServletRequest request,HttpServletResponse response,@CookieValue(value="recent-concert", required=false) String recentConcert){
		System.out.println(recentConcert);
		User user = (User) session.getAttribute("LOGIN_USER");
		List<Concert> concerts = new ArrayList<>();
	
		if(user != null){
			
			List<LikesPlanner> planners = forUService.getConcertPlanner(user);
			model.addAttribute("planners",planners);
			System.out.println("recentConcert"+recentConcert);
			
			if(recentConcert != null) {
				
				String finalCookieValue = forUService.plannerByUserNo(user.getNo(), recentConcert);
				
				Cookie cookie = new Cookie("recent-concert", finalCookieValue);
				System.out.println("new-cookieValue"+finalCookieValue);
				cookie.setPath("/");
				cookie.setMaxAge(60*60*365*24);
				response.addCookie(cookie);
				
				concerts = artService.getSerssion(request);
			}
			model.addAttribute("concerts",concerts);
			int countConcert= concerts.size();
			//List<LikesPlanner> concerts = forUService.sessionPlanners(user.getNo(), recentConcert);
			//model.addAttribute("concerts",concerts);
			//int countConcert = concerts.size();
			model.addAttribute("countConcert",countConcert);
		}else {
			return "redirect:/jhta/user/home.do?error=fail";	
		}
		
		
		return "forU/forU";
	}
	
	
	//공연 플래너 등록
	@RequestMapping(value="/art/addPlanner.do")
	public @ResponseBody String addPlanner(@RequestParam("concertNo") int concertNo, HttpSession session) {
		User user = (User) session.getAttribute("LOGIN_USER");
		forUService.addPlanner(user.getNo(), concertNo);
		
		return "true";		
	}
	@RequestMapping(value="/art/deletePlanner.do")
	public @ResponseBody String deletePlanner(@RequestParam("concertNo") int concertNo, HttpSession session) {
		User user = (User) session.getAttribute("LOGIN_USER");
		forUService.deletePlanner(user.getNo(), concertNo);
		
		return "true";
		
	}
}
