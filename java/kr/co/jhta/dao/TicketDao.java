package kr.co.jhta.dao;

import java.util.List;


import kr.co.jhta.vo.Concert;
import kr.co.jhta.vo.Criteria;

import kr.co.jhta.vo.Ticket;

public interface TicketDao {

	int countTicketByPerformanceNo(int performanceNo);
	List<Ticket> reservedTicketByPerformanceNo(int performanceNo);
	List<Ticket> reservedTicketByUserNo(int userNo);				// 마이페이지에서 예매내역 뿌려주기
	int getTotalTicketRows(Criteria criteria);						// 예매한 티켓수 카운트 
	List<Ticket> getTicketsByCriteria(Criteria criteria);			// 티켓순서대로 정렬
	
	Concert getConcertAndArtByNo(int concertNo);

	void createTickets(Ticket ticket);	
}
