package kr.co.jhta.service;

import java.util.List;


import kr.co.jhta.vo.LikesPlanner;
import kr.co.jhta.vo.User;

public interface ForUService {
	
	List<LikesPlanner> getConcertPlanner(User user);
	
	//추가
	void addPlanner(int userNo,int concertNo);
	//삭제
	void deletePlanner(int userNo,int concertNo);
	
	//유저가 선택한 공연클래너 인지 아닌지 확인하기 위한 셀렉터
	LikesPlanner getLikePlannerByuserNoandConcertNo(int userNo,int concertNo);
	
	List<LikesPlanner> sessionPlanners(int userNo,String recentConcert);
	
	String plannerByUserNo(int userNo, String cookieValue);
}
