package kr.co.jhta.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jhta.service.AlbumService;
import kr.co.jhta.service.ConcertService;
import kr.co.jhta.service.MymusicService;
import kr.co.jhta.vo.Album;
import kr.co.jhta.vo.Concert;
import kr.co.jhta.vo.Playlist;
import kr.co.jhta.vo.PlaylistBoard;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private AlbumService albumService;
	@Autowired
	private ConcertService concertService;
	@Autowired
	private MymusicService mymusicService;
	
	// 메인화면에 뿌려주기
	@RequestMapping(value = "/home.do")
	public String home(Model model) {
		List<Album> sixAlbums = albumService.getSixAlbum();
		List<Album> fiveAlbums = albumService.getFiveAlbum();
		List<Concert> fiveConcerts = concertService.getNewConcerts();
		//List<Concert> sixConcerts = concertService.getLikeFiveConcerts();
		List<Concert> fiveActs = concertService.getNewFiveActing();
		List<PlaylistBoard> playlistsBoard = mymusicService.getThreeRandomPlaylist();
		model.addAttribute("sixAlbums", sixAlbums);
		model.addAttribute("fiveAlbums", fiveAlbums);
		model.addAttribute("fiveConcerts", fiveConcerts);
		model.addAttribute("fiveActs", fiveActs);
		model.addAttribute("playlistsBoard", playlistsBoard);
		
		return "home";
	}
	
	// 메인하단에 인기 콘서트 ajax로 뿌려주기
	@RequestMapping(value="/home-concert-popular.do", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Concert> concertpopular() {		
		List<Concert> concerts = concertService.getLikeFiveConcerts();
		
		return concerts;
	}

	// 메인하단에 최신 콘서트 ajax로 뿌려주기
	@RequestMapping(value="/home-concert-lastest.do", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Concert> concertlastest() {
		List<Concert> concerts = concertService.getNewConcerts();
		return concerts;
	}
	
	// 메인하단에 인기 연극 ajax로 뿌려주기
	@RequestMapping(value="/home-act-popular.do", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Concert> actpopular() {		
		List<Concert> concerts = concertService.getPopularFiveActing();
		
		return concerts;
	}
	
	// 메인하단에 최신 연극 ajax로 뿌려주기
	@RequestMapping(value="/home-act-lastest.do", produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Concert> actlastest() {
		List<Concert> concerts = concertService.getNewFiveActing();
		return concerts;
	}
	
}
