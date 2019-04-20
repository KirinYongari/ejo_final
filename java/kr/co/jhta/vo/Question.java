package kr.co.jhta.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Question {
	private int no;
	private String comments;
	@JsonFormat(pattern="yyyy.MM.dd")
	private Date createDate;
	private User user;
	private Concert concert;
	private int countQuestion;
	public Question () {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
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

	public int getCountQuestion() {
		return countQuestion;
	}

	public void setCountQuestion(int countQuestion) {
		this.countQuestion = countQuestion;
	}

	@Override
	public String toString() {
		return "Question [no=" + no + ", comments=" + comments + ", createDate=" + createDate + ", user=" + user
				+ ", concert=" + concert + ", countQuestion=" + countQuestion + "]";
	}
	
	
}
