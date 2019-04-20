package kr.co.jhta.service;

import java.util.List;

import kr.co.jhta.vo.Hall;

public interface HallService {
	
	List<Hall> getHallByConcertNo(int no);
	List<Hall> getHalls();
	Hall getHallByHallNo(int no);
}
