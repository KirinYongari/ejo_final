package kr.co.jhta.dao;

import java.util.List;

import kr.co.jhta.vo.SeatInfo;

public interface SeatInfoDao {

	List<SeatInfo> getSeatInfoByPerformanceNo(int performanceNo);
}
