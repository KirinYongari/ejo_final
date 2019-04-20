package kr.co.jhta.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Ticket {

	private int no;
	private int price;
	@JsonFormat(pattern="yyyy.MM.dd")
	private Date createDate;
	private Performance performance;
	private User user;
	private SeatInfo seatInfo;
	private DiscountEvent discountEvent;
	private Concert concert;
	private int totalPrice;
	private String cardApprovalNo;
	private String merchantId;
	private String properId;
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
	public Performance getPerformance() {
		return performance;
	}
	public void setPerformance(Performance performance) {
		this.performance = performance;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public SeatInfo getSeatInfo() {
		return seatInfo;
	}
	public void setSeatInfo(SeatInfo seatInfo) {
		this.seatInfo = seatInfo;
	}
	public DiscountEvent getDiscountEvent() {
		return discountEvent;
	}
	public void setDiscountEvent(DiscountEvent discountEvent) {
		this.discountEvent = discountEvent;
	}
	public Concert getConcert() {
		return concert;
	}
	public void setConcert(Concert concert) {
		this.concert = concert;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getCardApprovalNo() {
		return cardApprovalNo;
	}
	public void setCardApprovalNo(String cardApprovalNo) {
		this.cardApprovalNo = cardApprovalNo;
	}
	public String getMerchantId() {
		return merchantId;
	}
	public void setMerchantId(String merchantId) {
		this.merchantId = merchantId;
	}
	public String getProperId() {
		return properId;
	}
	public void setProperId(String properId) {
		this.properId = properId;
	}
	
	
	
	
	
	
	
	
}
