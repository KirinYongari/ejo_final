package kr.co.jhta.dao;


import java.util.List;
import java.util.Map;

import kr.co.jhta.vo.Performance;

public interface PerformanceDao {

	Performance getPerformanceByNo(int performanceNo);
	List<Performance> getPerformanceByPerformanceDay(Map<String, Object> param);
	List<Performance> getPerfByConNo(int conNo);
	//연극 상세페이지 공연장 찾기
		List<Performance>gethallByconcertNo(int concertNo);
	void updatePerformance(Performance performance);
	void addPerformance(Performance performance);
}
