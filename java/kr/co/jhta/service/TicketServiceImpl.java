package kr.co.jhta.service;





import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.dao.ConcertDao;
import kr.co.jhta.dao.PerformanceDao;
import kr.co.jhta.dao.SeatInfoDao;
import kr.co.jhta.dao.TicketDao;


import kr.co.jhta.vo.Concert;
import kr.co.jhta.vo.Criteria;
import kr.co.jhta.vo.DiscountEvent;
import kr.co.jhta.vo.Performance;
import kr.co.jhta.vo.SeatInfo;
import kr.co.jhta.vo.Ticket;



@Service
public class TicketServiceImpl implements TicketService{

	@Autowired
	private TicketDao ticketDao;
	
	@Autowired
	private ConcertDao concertDao;
	
	@Autowired
	private PerformanceDao performanceDao;
	
	@Autowired
	private SeatInfoDao seatInfoDao;

	@Override
	public Concert getConcertInfo(int concertNo) {
		Concert concert = ticketDao.getConcertAndArtByNo(concertNo);
		if (concert == null) {
			throw new RuntimeException("콘서트 번호가 올바르지 않습니다.");
		}
		
		return concert;
	}
	@Override
	public List<Performance> getPerfByConNo(int consertNo) {
		
		return performanceDao.getPerfByConNo(consertNo);
	}
	
	@Override
	public List<Performance> getPerformanceList(int concertNo, String performanceDay) {
		
		Map<String, Object> param = new HashMap<>();
		param.put("concertNo", concertNo);
		param.put("performanceDay", performanceDay);
		
		return performanceDao.getPerformanceByPerformanceDay(param);
	}
	
	@Override
	public void createTickets(Ticket ticket) {
		ticketDao.createTickets(ticket);

	}
	
	
	
	@Override
	public Map<String, Object> restCountSeatByPerformanceNo(int performanceNo) {
		
		int ticket = ticketDao.countTicketByPerformanceNo(performanceNo);
		Performance performance = performanceDao.getPerformanceByNo(performanceNo);
		Map<String, Object> result = new HashMap<>();
		result.put("seatCount", performance.getHall().getSeatNumber());
		result.put("restSeatCount", performance.getHall().getSeatNumber() - ticket);

		return result;
	}
	
	@Override
	public void updateRestSeatCount(int performanceNo) {
		Performance performance = performanceDao.getPerformanceByNo(performanceNo);
		int hallSeatCount = performance.getHall().getSeatNumber();
		int ticket = ticketDao.countTicketByPerformanceNo(performanceNo);
		
		performance.setRestSeatCount(hallSeatCount - ticket);
		performanceDao.updatePerformance(performance);
	}
	
	@Override
	public List<SeatInfo> allSeats(int performanceNo) {
        return seatInfoDao.getSeatInfoByPerformanceNo(performanceNo);

    }
	@Override
	public List<Ticket> reservedTicketByPerformanceNo(int performanceNo) {
		return ticketDao.reservedTicketByPerformanceNo(performanceNo);
	}


	@Override
	public Performance getPerformanceByPerformanceNo(int performanceNo) {
		return performanceDao.getPerformanceByNo(performanceNo);
	}
	
	@Override
	public DiscountEvent discountEventInfo() {
		// TODO Auto-generated method stub
		return null;
	}
		
	@Override
	public List<Ticket> createTickets(int performanceNo, int totalPrice, List<SeatInfo> seatInfo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	// 마이페이지에서 예매내역 뿌려주기
	@Override
	public List<Ticket> reservedTicketByUserNo(int userNo) {
		List<Ticket> reservedSeatNo = ticketDao.reservedTicketByUserNo(userNo);
		return reservedSeatNo;
	}
	
	// 예매한 티켓수 카운트 
	@Override
	public int getTotalTicketRows(Criteria criteria) {
		return ticketDao.getTotalTicketRows(criteria);
	}
	
	// 티켓순서대로 정렬
	@Override
	public List<Ticket> getTicketsByCriteria(Criteria criteria) {
		return ticketDao.getTicketsByCriteria(criteria);
	}
	
	


	
}
