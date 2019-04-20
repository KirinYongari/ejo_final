package kr.co.jhta.service;




import java.util.List;
import java.util.Map;

import kr.co.jhta.vo.Concert;
import kr.co.jhta.vo.Criteria;
import kr.co.jhta.vo.DiscountEvent;
import kr.co.jhta.vo.Performance;
import kr.co.jhta.vo.SeatInfo;
import kr.co.jhta.vo.Ticket;


public interface TicketService {
	
	Concert getConcertInfo(int concertNo);
	List<Performance> getPerformanceList(int concertNo, String performanceDay);
	Map<String, Object> restCountSeatByPerformanceNo(int performanceNo);
	
	List<SeatInfo> allSeats(int performanceNo);
	List<Ticket> reservedTicketByPerformanceNo(int performanceNo);
	
	List<Ticket> reservedTicketByUserNo(int userNo); 				// 마이페이지에서 예매내역 뿌려주기
	int getTotalTicketRows(Criteria criteria);						// 예매한 티켓수 카운트 
	List<Ticket> getTicketsByCriteria(Criteria criteria);			// 티켓순서대로 정렬

	DiscountEvent discountEventInfo();
	List<Ticket> createTickets(int performanceNo, int totalPrice, List<SeatInfo> seatInfo);
	Performance getPerformanceByPerformanceNo(int performanceNo);
	void updateRestSeatCount(int performanceNo);
	void createTickets(Ticket ticket);
	List<Performance> getPerfByConNo(int consertNo);
}
