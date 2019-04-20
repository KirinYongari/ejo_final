package kr.co.jhta.vo;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Performance {

	private int no;
	@JsonFormat(pattern="yyyy.MM.dd")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date day;
	private String time;
	private Hall hall;
	private Concert concert;
	private int restSeatCount;
	private List<SeatInfo> seat;
	
	public Performance() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public Date getDay() {
		return day;
	}

	public void setDay(Date day) {
		this.day = day;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public Hall getHall() {
		return hall;
	}

	public void setHall(Hall hall) {
		this.hall = hall;
	}

	public Concert getConcert() {
		return concert;
	}

	public void setConcert(Concert concert) {
		this.concert = concert;
	}

	public int getRestSeatCount() {
		return restSeatCount;
	}

	public void setRestSeatCount(int restSeatCount) {
		this.restSeatCount = restSeatCount;
	}

	public List<SeatInfo> getSeat() {
		return seat;
	}

	public void setSeat(List<SeatInfo> seat) {
		this.seat = seat;
	}
	
	public String getDayString() {
		if (day == null) {
			return null;
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(day);
	}
}
