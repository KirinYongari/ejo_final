package kr.co.jhta.vo;

import java.util.Date;

public class UserAccess {

	private int no;
	private int userNo;
	private Date accessDate;
	
	public UserAccess() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public Date getAccessDate() {
		return accessDate;
	}

	public void setAccessDate(Date accessDate) {
		this.accessDate = accessDate;
	}
	
}
