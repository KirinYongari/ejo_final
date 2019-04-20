package kr.co.jhta.dao;

import java.util.List;

import kr.co.jhta.vo.Criteria;
import kr.co.jhta.vo.User;

public interface UserDao {
	
	// 유저 조회(아이디)
	User getUserById(String id);
	// 유저 정보 추가
	void addUser(User user);
	// 유저 정보 변경
	void updateUser(User user);
	// 유저 조회(번호)
	User getUserByNo(int no);
	
	int getTotalUserRows(Criteria criteria);
	
	List<User> getUsers(Criteria criteria);
	
	int getUserCount();
	
}
