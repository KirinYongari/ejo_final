package kr.co.jhta.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.dao.FriendDao;
import kr.co.jhta.vo.Friend;

@Service
public class FriendServiceImpl implements FriendService {

	@Autowired
	private FriendDao friendDao;
	
	@Override
	public int getCountFriend(int userNo) {
		return friendDao.getCountFriend(userNo);
	}

	@Override
	public List<Friend> getListFriend(int userNo) {
		return friendDao.getListFriend(userNo);
	}

	@Override
	public void followFriend(Friend friend) {
		friendDao.followFriend(friend);
	}

	@Override
	public void unfollowFriend(Friend friend) {
		friendDao.unfollowFriend(friend);
	}
	
}
