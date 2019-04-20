package kr.co.jhta.vo;

public class Theme {

	private int no;
	private String picture;		//배경 사진
	private String img;			//프로필 사진
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	@Override
	public String toString() {
		return "Theme [no=" + no + ", picture=" + picture + ", img=" + img + "]";
	}
	
	
}
