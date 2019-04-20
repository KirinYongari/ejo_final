package kr.co.jhta.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;


import kr.co.jhta.service.ThemeService;
import kr.co.jhta.vo.User;

@Controller
public class UploadController {
	
	@Autowired
	ThemeService themeServise;
	
	// 프로필 사진 저장될 경로 
	@Value("${directory.images.profile}")
	private String photoImageDirectory;
	
	// 프로필뒤에 배경 사진 저장될 경로
	@Value("${directory.images.theme}")
	private String photoImageDirectory2;
	
	/*@RequestMapping(value="/mypage/mypage.do")
	public String mypage() {
		return "mypage/mypage";
	}*/
	
	// 마이페이지에서 프로필 사진 바꿀때 사용
	@RequestMapping(value="/mypage/fileUpload.do")
	public String fileUp(MultipartFile photofile, HttpSession session) throws IOException {
		
		User user = (User)session.getAttribute("LOGIN_USER");
		
		if (!photofile.isEmpty()) {
			String filename = photofile.getOriginalFilename();
			FileCopyUtils.copy(photofile.getBytes(), new File(photoImageDirectory, filename));
			
			themeServise.updateThemeImage(user.getThemeNo(), filename);
		} 
		
		/*else if (photofile.isEmpty()) {
			themeServise.updateTheme(user.getThemeNo(), "basic-profile.jpg");
		}*/
		return "redirect:mypage.do";
	}

	// 마이페이지에서 테마 사진 바꿀때 사용
	@RequestMapping(value="/mypage/fileUpload2.do")
	public String fileUp2(MultipartFile photothemefile, HttpSession session) throws IOException {
		
		User user = (User)session.getAttribute("LOGIN_USER");
		
		if (!photothemefile.isEmpty()) {
			System.out.println("테마사진 출력");
			String filename = photothemefile.getOriginalFilename();
			FileCopyUtils.copy(photothemefile.getBytes(), new File(photoImageDirectory2, filename));
			
			themeServise.updateThemePicture(user.getThemeNo(), filename);
		} 
		/*else if (photothemefile.isEmpty()) {
			themeServise.updateTheme(user.getThemeNo(), "basic-theme.jpg");
		}*/
		return "redirect:mypage.do";
	}


}
