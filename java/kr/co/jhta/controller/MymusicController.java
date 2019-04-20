package kr.co.jhta.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jhta.service.FriendService;
import kr.co.jhta.service.MusicService;
import kr.co.jhta.service.MymusicService;
import kr.co.jhta.service.ThemeService;
import kr.co.jhta.service.UserService;
import kr.co.jhta.utils.SessionUtils;
import kr.co.jhta.vo.Friend;
import kr.co.jhta.vo.Playlist;
import kr.co.jhta.vo.PlaylistBoard;
import kr.co.jhta.vo.PlaylistItem;
import kr.co.jhta.vo.Theme;
import kr.co.jhta.vo.User;

@Controller
@RequestMapping("/main")
public class MymusicController {
	
	@Autowired
	private ThemeService themeService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private MymusicService mymusicService;
	
	@Autowired
	private FriendService friendService;
	
	@Autowired
	private MusicService musicService;
	
	@RequestMapping(value="/mymusic.do")
	public String myMusic(@RequestParam("userNo") int friendUserNo, Model model) {
		
		// 유저의 태마 및 정보
		User friend = userService.getUserByNo(friendUserNo);
		Theme friendTheme = themeService.getThemeByNo(friend.getThemeNo());
		
		int count = friendService.getCountFriend(friendUserNo);
		Friend countFriend = new Friend();
		countFriend.setUser(friend);
		countFriend.setCountFriend(count);
		
		// 다른사람의 게시판을 들어갈 경우 친구 게시판 friendUserNo///댓글목록
		List<PlaylistBoard> commentList = mymusicService.getCommentPlaylist(friendUserNo);
		
		// 플레이리스트
		List<PlaylistItem> myAddPlayListItems = musicService.getPlaylistItemByUserNo(friendUserNo); 
		
		// 유저가 플레이리스트에 담은 노래 카운트
		int countPlaylistItemMusic = musicService.countMusicByUserNo(friendUserNo);
		PlaylistItem countPlaylistItem = new PlaylistItem();
		countPlaylistItem.setCountPlaylistItemMusic(countPlaylistItemMusic);
		
		
		
		// 친구목록 리스트 
		List<Friend> friendList = friendService.getListFriend(friendUserNo);	
		
		model.addAttribute("friend", friend);									// 다른 사람의 프사
		model.addAttribute("friendTheme", friendTheme);							// 다른 사람의 테마 사진
		model.addAttribute("countFriend", countFriend);							// 친구수 카운트
		model.addAttribute("commentList", commentList);							// 방명록에 댓글목록
		model.addAttribute("myAddPlayListItems", myAddPlayListItems);			// 유저가 담은 노래 리스트
		model.addAttribute("countPlaylistItemMusic", countPlaylistItem);	// 유저가 담은 노래 카운트
		model.addAttribute("friendList", friendList);							// 친구목록 
		
		return "main/mymusic";
	}
	
	// 방명록 댓글달기
	@RequestMapping(value="/visitor.do", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map<String, Object> visitor(PlaylistBoard playlistboard) {
		
		User user = (User)SessionUtils.getAttribute("LOGIN_USER");
		playlistboard.setUser(user);
		
		Playlist playlist = musicService.getPlaylistByno(playlistboard.getPlaylist().getUser().getNo());
		playlistboard.setPlaylist(playlist);
		mymusicService.insertComment(playlistboard);
				
		List<PlaylistBoard> playlistboards = mymusicService.getCommentPlaylist(playlistboard.getPlaylist().getUser().getNo());
		
		
		Map<String,Object> map = new HashMap<>();
		map.put("playlistboards", playlistboards);
		
		return map;
	}
	
	// 팔로우 맺기
	@RequestMapping(value="/follow.do")
	public String follow(@RequestParam("friendNo") int friendNo) {
		
		Friend friend = new Friend();
		User user = (User)SessionUtils.getAttribute("LOGIN_USER");
		friend.setUser(user);				// 로그인유저의 번호를 넣음
		
		User friendUser = new User();
		friendUser.setNo(friendNo);			
		friend.setFriendUser(friendUser);	// 친구유저의 번호를 넣음
		
		friendService.followFriend(friend);
		
		return "redirect:mymusic.do?userNo="+friendNo;
	}
	
	// 언팔하기
	@RequestMapping(value="/unfollow.do")
	public String unfollow(@RequestParam("friendNo") int friendNo) {
		
		Friend friend = new Friend();
		
		User user = (User)SessionUtils.getAttribute("LOGIN_USER");
		friend.setUser(user);
		
		User friendUser = new User();
		friendUser.setNo(friendNo);
		friend.setFriendUser(friendUser);
		
		friendService.unfollowFriend(friend);
		
		return "redirect:mymusic.do?userNo="+user.getNo();
	}
	
}
