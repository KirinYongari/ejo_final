package kr.co.jhta.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class PlaylistBoard {
	private int no;
	private String comment;
	@JsonFormat(pattern="yyyy.MM.dd")
	private Date createDate;
	private User user;
	private Theme theme;
	private Playlist playlist;
	private int like;
	
	public PlaylistBoard() {}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Theme getTheme() {
		return theme;
	}

	public void setTheme(Theme theme) {
		this.theme = theme;
	}

	public Playlist getPlaylist() {
		return playlist;
	}

	public void setPlaylist(Playlist playlist) {
		this.playlist = playlist;
	}

	public void setLike(int like) {
		this.like = like;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Playlist getPlaylis_no() {
		return playlist;
	}
	public void setPlaylist_no(Playlist playlist_no) {
		this.playlist = playlist_no;
	}
	public int getLike() {
		return like;
	}
	public void setLikes(int like) {
		this.like = like;
	}
	
	
}
