package kr.co.jhta.dao;

import kr.co.jhta.vo.Theme;

public interface ThemeDao {
	void addTheme(Theme theme);
	void updateTheme(Theme theme);
	Theme getThemeByNo(int themeNo);
}
