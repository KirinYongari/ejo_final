package kr.co.jhta.vo;

import java.util.Date;

public class LikesPlanner {
	private int no;
	private Date createDate;
	private User user;
	private Concert concert;
	
	public LikesPlanner() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Concert getConcert() {
		return concert;
	}

	public void setConcert(Concert concert) {
		this.concert = concert;
	}

	@Override
	public String toString() {
		return "LikesPlanner [no=" + no + ", createDate=" + createDate + ", user=" + user + ", concert=" + concert
				+ "]";
	}
	
	
}
