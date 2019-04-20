package kr.co.jhta.dao;

import java.util.List;

import kr.co.jhta.vo.Hall;


public interface HallDao {
	
	List<Hall> getHallByConcertNo(int no);
	List<Hall> getHalls();
	Hall getHallByHallNo(int no);
}
