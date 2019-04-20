package kr.co.jhta.service;

import java.util.List;


import kr.co.jhta.vo.Friend;

public interface FriendService {
	int getCountFriend(int userNo);			// 친구 수 카운트
	List<Friend> getListFriend(int userNo);	// 친구 리스트 가져오기
	void followFriend(Friend friend);		// 팔로우하기
	void unfollowFriend(Friend friend);		// 언팔하기
}