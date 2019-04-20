package kr.co.jhta.dao;

import java.util.List;

import kr.co.jhta.vo.UserAccess;

public interface UserAccessDao {

	public void addUserAccess(int userNo);
	public List<UserAccess> getUserAccessByUserNo(int userNo);
	public UserAccess getLastAccessByUserNo(int userNo);
	
}
