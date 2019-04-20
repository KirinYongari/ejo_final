package kr.co.jhta.service;

import kr.co.jhta.vo.Theme;
import kr.co.jhta.vo.User;

public interface ThemeService {
	
	void updateThemeImage(int themeNo, String filename);
	void updateThemePicture(int themeNo, String filename);
	void updateThemeByNo(int themeNo);
	Theme getThemeByNo(int themeNo);
}
