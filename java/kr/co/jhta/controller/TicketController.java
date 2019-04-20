package kr.co.jhta.controller;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import kr.co.jhta.service.TicketService;

import kr.co.jhta.vo.Concert;
import kr.co.jhta.vo.DiscountEvent;
import kr.co.jhta.vo.Performance;
import kr.co.jhta.vo.SeatInfo;
import kr.co.jhta.vo.Ticket;
import kr.co.jhta.vo.User;


@Controller
@RequestMapping("/ticket")
public class TicketController {
	
	@Autowired
	private TicketService ticketService;
	
	
	
	@RequestMapping("/seat.do")
	public  @ResponseBody Map<String, Object> allSeats(@RequestParam("performanceNo") int performanceNo, Model model) {
		
		Map<String, Object> seatMap = new HashMap<>();
		
		List<SeatInfo> seats = ticketService.allSeats(performanceNo); 
		List<Ticket> reservedTickets = ticketService.reservedTicketByPerformanceNo(performanceNo);
		seatMap.put("seats", seats);
		seatMap.put("reservedTickets", reservedTickets);
		
		return seatMap;
	}
	
	@RequestMapping("/home.do")
	public String home(@RequestParam("concertNo") int concertNo, Model model) {
		
		Concert concert = ticketService.getConcertInfo(concertNo);
		
		model.addAttribute("no", concert.getNo());
		model.addAttribute("price", concert.getPrice());
		model.addAttribute("img", concert.getCoverImg());
		model.addAttribute("title", concert.getTitle());
		model.addAttribute("artist", concert.getArtist());
		model.addAttribute("startDate", concert.getOpenDate().getTime());
		model.addAttribute("endDate", concert.getCloseDate().getTime());
		model.addAttribute("start1Date", concert.getOpenDate());
		model.addAttribute("end1Date", concert.getCloseDate());
		
		return "tickets/ticket";
	}
	
	@RequestMapping("/getPerformanceList.do")
	public @ResponseBody List<Performance> timeList(@RequestParam("concertNo") int concertNo, @RequestParam("performanceDay") String performanceDay, Model model) {
		
		return ticketService.getPerformanceList(concertNo, performanceDay);
	}
	
	@RequestMapping(value="/createTicket.do", produces=MediaType.TEXT_PLAIN_VALUE)
	public @ResponseBody String createTickets(@RequestParam("performanceNo") int performanceNo, @RequestParam("discountEventNo") int discountEventNo, @RequestParam("seatNos") String seatNos, 
			@RequestParam("cardApprovalNo") String cardApprovalNo, @RequestParam("properId") String properId, @RequestParam("merchantId") String merchantId, @RequestParam("totalPrice") int totalPrice, @RequestParam("discountedPrice") int discountedPrice, HttpSession session) {
		
		String[] seats = seatNos.split(",");
		
		try {
			
			for (int i=0; i<seats.length; i++ ) {
				
				Ticket ticket = new Ticket();
				User user = (User)session.getAttribute("LOGIN_USER");
				SeatInfo seatIn = new SeatInfo();
				seatIn.setNo(Integer.parseInt(seats[i]));
				
				Performance performance = new Performance();
				performance.setNo(performanceNo);
				
				DiscountEvent discountEvent = new DiscountEvent();
				discountEvent.setNo(discountEventNo);
				
				ticket.setDiscountEvent(discountEvent);
				ticket.setUser(user);
				ticket.setSeatInfo(seatIn);
				ticket.setPerformance(performance);
				ticket.setPrice(discountedPrice);
				ticket.setCardApprovalNo(cardApprovalNo);
				ticket.setMerchantId(merchantId);
				ticket.setProperId(properId);
				ticket.setTotalPrice(totalPrice);
				ticketService.createTickets(ticket);
			}
			ticketService.updateRestSeatCount(performanceNo);
			
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}	
	}
	
	@RequestMapping("/restSeatCount.do")
	public @ResponseBody Map<String, Object> restCount(@RequestParam("performanceNo") int performanceNo, Model model) {
		Map<String, Object> result = ticketService.restCountSeatByPerformanceNo(performanceNo);
		return result;
	} 
	
}
