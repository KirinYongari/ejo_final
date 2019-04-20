package kr.co.jhta.vo;

public class Friend {
	private int no;
	private User user;
	private User friendUser;
	private int countFriend;
	private String same;
	
	public Friend() {}

	public int getCountFriend() {
		return countFriend;
	}
	
	public void setCountFriend(int countFriend) {
		this.countFriend = countFriend;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public User getFriendUser() {
		return friendUser;
	}

	public void setFriendUser(User friendUser) {
		this.friendUser = friendUser;
	}

	public String getSame() {
		return same;
	}

	public void setSame(String same) {
		this.same = same;
	}
	
}
