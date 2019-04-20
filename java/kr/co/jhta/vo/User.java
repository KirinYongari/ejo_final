package kr.co.jhta.vo;

import java.util.Date;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class User {
	private int no;
	@NotEmpty(message="아이디는 필수입력값입니다.")
	@Size(min=4,  message="아이디는 4글자 이상 입력하세요")
	private String id;
	@JsonIgnore
	@NotEmpty(message="비밀번호는 필수입력값입니다.")
	@Size(min=8, max=16, message="(소문자,특수문자/숫자, 8~16자)로 구성해 주세요.")
	private String password;
	@NotEmpty(message="이름은 필수입력값입니다.")
	@Size(min=2, message="이름은 두 글자 이상입니다.")
	private String name;
	@NotEmpty(message="닉네임은 필수입력값입니다.")
	@Size(min=2, message="닉네임은 두 글자 이상입니다.")
	private String nickname;
	private String gender;
	@NotNull(message="생년월일은 필수 입력값입니다.")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private String birthday;
	private Date createDate;
	private String available;		// "Y"(기본): 사용가능 / "N": 사용불가(차단, 탈퇴) 
	private String grade;			// "M"(기본): Member 일반회원 / "A": Admin 관리자
	private int themeNo;			// 마이페이지의 테마 번호(배경, 글꼴 등)
	private Theme theme;
	private Date lastAccessDate;
	
	public User() {}
	
	public Theme getTheme() {
		return theme;
	}

	public void setTheme(Theme theme) {
		this.theme = theme;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public int getThemeNo() {
		return themeNo;
	}
	public void setThemeNo(int themeNo) {
		this.themeNo = themeNo;
	}
	
	public String getAvailable() {
		return available;
	}
	public void setAvailable(String available) {
		this.available = available;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public Date getLastAccessDate() {
		return lastAccessDate;
	}
	public void setLastAccessDate(Date lastAccessDate) {
		this.lastAccessDate = lastAccessDate;
	}

	@Override
	public String toString() {
		return "User [no=" + no + ", id=" + id + ", password=" + password + ", name=" + name + ", nickname=" + nickname
				+ ", gender=" + gender + ", birthday=" + birthday + ", createDate=" + createDate + ", available="
				+ available + ", grade=" + grade + ", themeNo=" + themeNo + ", theme=" + theme + ", lastAccessDate="
				+ lastAccessDate + "]";
	}
	
}
