package kr.co.jhta.service;

import java.util.List;

import kr.co.jhta.vo.Criteria;
import kr.co.jhta.vo.User;

public interface UserService {
	// 유저 찾기
	User getUserById(String id);
	void addUser(User user);
	void updateUser(User user);
	User getUserByNo(int no);
	int getTotalUserRows(Criteria criteria);
	List<User> getUsers(Criteria criteria);
	void addLoginDate(int userNo);
	
}
