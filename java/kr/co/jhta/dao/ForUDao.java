package kr.co.jhta.dao;

import java.util.List;
import java.util.Map;

import kr.co.jhta.vo.LikesPlanner;
public interface ForUDao {
	List<LikesPlanner> getConcertPlanner(int userNo);
	
	//추가
	void addPlanner(LikesPlanner likesPlanner);
	//삭제
	void deletePlanner(Map<String, Object> map);
	
	LikesPlanner getLikePlannerByuserNoandConcertNo(Map<String, Object> map);
	
	List<LikesPlanner> sessionPlanners(Map<String , Object> map);
	
	List<LikesPlanner> plannerByUserNo(int userNo);
}
