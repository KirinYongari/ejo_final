package kr.co.jhta.service;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.dao.MusicDao;
import kr.co.jhta.dao.ThemeDao;
import kr.co.jhta.dao.UserAccessDao;
import kr.co.jhta.dao.UserDao;
import kr.co.jhta.vo.Criteria;
import kr.co.jhta.vo.Playlist;
import kr.co.jhta.vo.Theme;
import kr.co.jhta.vo.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	@Autowired
	private ThemeDao themeDao;
	
	@Autowired
	private UserAccessDao userAccessDao;
	
	@Autowired
	private MusicDao musicDao;
	
	@Override
	public User getUserById(String id) {
		User user = userDao.getUserById(id);
		if  (user != null) {
			Theme theme = themeDao.getThemeByNo(user.getThemeNo());
			user.setTheme(theme);
		}
		return user;
	}

	@Override
	public void addUser(User user) {
		Theme theme = new Theme();
		theme.setImg("basic-profile.jpg");
		theme.setPicture("basic-profile.jpg");
		themeDao.addTheme(theme);
		
		user.setThemeNo(theme.getNo());
		
		userDao.addUser(user);
		
		Playlist playList = new Playlist();
		playList.setTitle(user.getNickname());
		playList.setUser(user);
		musicDao.addPlaylist(playList);
	}

	// 유저 수정하기
	@Override
	public void updateUser(User modifyUser) {
		//수정할 유저를 얻기
		User user = userDao.getUserByNo(modifyUser.getNo());
		// 바꿀값만 set해서 넣어준다
		user.setPassword(modifyUser.getPassword());
		user.setName(modifyUser.getName());
		user.setNickname(modifyUser.getNickname());
		user.setGender(modifyUser.getGender());
		user.setBirthday(modifyUser.getBirthday());
		userDao.updateUser(user);
	}

	@Override
	public User getUserByNo(int no) {
		return userDao.getUserByNo(no);
	}

	@Override
	public int getTotalUserRows(Criteria criteria) {
		return userDao.getTotalUserRows(criteria);
	}

	@Override
	public List<User> getUsers(Criteria criteria) {
		return userDao.getUsers(criteria);
	}

	@Override
	public void addLoginDate(int userNo) {
		userAccessDao.addUserAccess(userNo);
		
	}

}
