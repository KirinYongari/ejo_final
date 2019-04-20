package kr.co.jhta.controller;

import java.io.InputStream;
import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jhta.service.AlbumService;
import kr.co.jhta.service.MusicService;
import kr.co.jhta.service.ThemeService;
import kr.co.jhta.utils.SessionUtils;
import kr.co.jhta.vo.Album;
import kr.co.jhta.vo.Criteria;
import kr.co.jhta.vo.Music;
import kr.co.jhta.vo.Pagination;
import kr.co.jhta.vo.Playlist;
import kr.co.jhta.vo.PlaylistItem;
import kr.co.jhta.vo.User;

@Controller
public class MusicController {
	
	@Autowired
	MusicService musicService;
	
	@Autowired
	AlbumService albumService;
	
	@Autowired
	ThemeService themeService;
	
	@RequestMapping(value="/music/form.do")
	public String MusicsList(Model model, HttpSession session
							,@RequestParam(value="cp", required=false, defaultValue="1") int cp,
							Criteria criteria) {
		User user = (User)session.getAttribute("LOGIN_USER");
		int totalRows = musicService.countMusic(criteria);
		if(user != null){
		criteria.setNo(user.getNo());
		}
		Pagination pagination = new Pagination(totalRows, cp,5,5);
		criteria.setBeginIndex(pagination.getBeginIndex());
		criteria.setEndIndex(pagination.getEndIndex());
		
		List<Music> musics = musicService.getMusics(criteria);
		if(user != null){
			List<PlaylistItem> playlistItems = musicService.getPlaylistItemByUserNo(user.getNo());
			model.addAttribute("playlistItems",playlistItems);
		}
		
		model.addAttribute("user",user);
		model.addAttribute("musics",musics);
		model.addAttribute("pagination",pagination);
		
		return "musics/list";
	}
	
	@RequestMapping(value="/music/albumModal.do", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map<String, Object> albumModal(@RequestParam("albumNo") int albumNo){
		System.out.println("도착");
		
		User user = (User)SessionUtils.getAttribute("LOGIN_USER");
		if(user == null) {
			user = new User();
			user.setNo(0);
		}
		Album album = albumService.getAlbumByNo(albumNo);
		Map<String,Integer> musicMap = new HashMap<>();
		musicMap.put("albumNo", albumNo);
		musicMap.put("userNo", user.getNo());
		List<Music> musics = musicService.getMusicByAlbumNoAndUserNo(musicMap);
		Map<String, Object> map = new HashMap<>();
		map.put("album", album);
		map.put("musics", musics);
		return map;
		
	}
	
	@RequestMapping(value="/music/musicModal.do", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Music musicModal(@RequestParam("musicNo") int musicNo){
		System.out.println("도착");
		Music music = musicService.getMusicByNo(musicNo);
		return music;
		
	}
	
	@RequestMapping(value="/music/likeMusic.do")
	public String likeMusic(@RequestParam("musicNo")int musicNo, @RequestParam("url")String url){
		musicService.likeMusic(musicNo);
		
		return "redirect:/music/"+url+".do";
	}
	
	@RequestMapping(value="/music/likeAlbum.do")
	public String likeAlbum(@RequestParam("albumNo")int albumNo, @RequestParam("url")String url){
		albumService.likeAlbum(albumNo);
		
		return "redirect:/music/"+url+".do";
	}
	
	@RequestMapping(value="/music/musicListen.do", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Music musicListen(@RequestParam("musicNo")int musicNo){
		
		Music music = musicService.getMusicByNo(musicNo);
		
		return music;
		
	}
	
	@RequestMapping(value="/music/putMusicList.do", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<PlaylistItem> putMusicList(@RequestParam("musicNo")int musicNo, HttpSession session) {
		User user = (User)session.getAttribute("LOGIN_USER");
		List<PlaylistItem> playlistItems = new ArrayList<>();
		if(user == null) {
			return playlistItems;
		}
		Playlist playlist =  musicService.getPlaylistByno(user.getNo());
		
		PlaylistItem playlistItem = new PlaylistItem();
		playlistItem.setPlaylist(playlist);
		musicService.addMusicList(playlistItem,musicNo);
		
		playlistItems = musicService.getPlaylistItemByUserNo(user.getNo());
		
		
		return playlistItems;
		
	}
	
	@RequestMapping(value="/music/outMusicList.do", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<PlaylistItem> outMusicList(@RequestParam("musicNo")int musicNo, HttpSession session) {
		User user = (User)session.getAttribute("LOGIN_USER");
		List<PlaylistItem> playlistItems = new ArrayList<>();
		if(user == null) {
			return playlistItems;
		}
		Playlist playlist =  musicService.getPlaylistByno(user.getNo());
		
		PlaylistItem playlistItem = new PlaylistItem();
		playlistItem.setPlaylist(playlist);
		musicService.deleteMusicList(playlistItem,musicNo);
		playlistItems = musicService.getPlaylistItemByUserNo(user.getNo());

		
		return playlistItems;
		
	}
}
