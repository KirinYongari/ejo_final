package kr.co.jhta.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.dao.ThemeDao;
import kr.co.jhta.vo.Theme;
import kr.co.jhta.vo.User;

@Service
public class ThemeServiceImpl implements ThemeService{

	@Autowired
	ThemeDao themeDao;
	
	@Override
	public void updateThemeImage(int themeNo, String filename) {
		Theme theme = themeDao.getThemeByNo(themeNo);
		theme.setImg(filename);
		themeDao.updateTheme(theme);
	}

	@Override
	public void updateThemePicture(int themeNo, String filename) {
		Theme theme = themeDao.getThemeByNo(themeNo);
		theme.setPicture(filename);
		themeDao.updateTheme(theme);
	}
	
	@Override
	public Theme getThemeByNo(int themeNo) {
		return themeDao.getThemeByNo(themeNo);
	}

	@Override
	public void updateThemeByNo(int themeNo) {
		Theme theme = new Theme();
		theme.setNo(themeNo);
		theme.setImg("basic-profile.jpg");
		theme.setPicture("basic-profile.jpg");
		themeDao.updateTheme(theme);
	}
	
}
