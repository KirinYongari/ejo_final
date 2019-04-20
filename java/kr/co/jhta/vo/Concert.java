package kr.co.jhta.vo;

import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Concert {

	private int no;
	@NotEmpty(message="타이틀은 필수 입력값입니다.")
	private String title;
	@NotEmpty(message="아티스트는 필수 입력값입니다.")
	private String artist;
	@NotEmpty(message="기획사는 필수 입력값입니다.")
	private String agency;
	@NotEmpty(message="장르는 필수 입력값입니다.")
	private String genre;
	private String coverImg;
	private String content;
	private String contentImg;
	private String available;
	@NotNull(message="티켓판매시작일은 필수 입력값입니다.")
	@JsonFormat(pattern="yyyy.MM.dd")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date ticketOpenDate;
	@NotNull(message="티켓판매종료일은 필수 입력값입니다.")
	@JsonFormat(pattern="yyyy.MM.dd")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date ticketCloseDate;
	@NotNull(message="콘서트시작일은 필수 입력값입니다.")
	@JsonFormat(pattern="yyyy.MM.dd")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date openDate;
	@NotNull(message="콘서트종료일은 필수 입력값입니다.")
	@JsonFormat(pattern="yyyy.MM.dd")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date closeDate;
	@NotEmpty(message="가격은 필수입력값입니다.")
	private int price;
	@JsonFormat(pattern="yyyy.MM.dd")
	private Date createDate;
	private int likes;
	private Category category;
	private List<Hall> halls;

	public void setHalls(List<Hall> halls) {
		this.halls = halls;
	}

	public Concert() {}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getArtist() {
		return artist;
	}
	public void setArtist(String artist) {
		this.artist = artist;
	}
	public String getAgency() {
		return agency;
	}
	public void setAgency(String agency) {
		this.agency = agency;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getCoverImg() {
		return coverImg;
	}
	public void setCoverImg(String coverImg) {
		this.coverImg = coverImg;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getContentImg() {
		return contentImg;
	}
	public void setContentImg(String contentImg) {
		this.contentImg = contentImg;
	}
	public String getAvailable() {
		return available;
	}
	public void setAvailable(String available) {
		this.available = available;
	}
	public Date getTicketOpenDate() {
		return ticketOpenDate;
	}
	public void setTicketOpenDate(Date ticketOpenDate) {
		this.ticketOpenDate = ticketOpenDate;
	}
	public Date getTicketCloseDate() {
		return ticketCloseDate;
	}
	public void setTicketCloseDate(Date ticketCloseDate) {
		this.ticketCloseDate = ticketCloseDate;
	}
	public Date getOpenDate() {
		return openDate;
	}
	public void setOpenDate(Date openDate) {
		this.openDate = openDate;
	}
	public Date getCloseDate() {
		return closeDate;
	}
	public void setCloseDate(Date closeDate) {
		this.closeDate = closeDate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
	
	public List<Hall> getHalls() {
		return halls;
	}

	@Override
	public String toString() {
		return "Concert [no=" + no + ", title=" + title + ", artist=" + artist + ", agency=" + agency + ", genre="
				+ genre + ", coverImg=" + coverImg + ", content=" + content + ", contentImg=" + contentImg
				+ ", available=" + available + ", ticketOpenDate=" + ticketOpenDate + ", ticketCloseDate="
				+ ticketCloseDate + ", openDate=" + openDate + ", closeDate=" + closeDate + ", price=" + price
				+ ", createDate=" + createDate + ", likes=" + likes + ", category=" + category + ", halls=" + halls
				+ "]";
	}

	
	

	

}
