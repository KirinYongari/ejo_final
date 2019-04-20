package kr.co.jhta.controller;

import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.jhta.service.AdminService;
import kr.co.jhta.vo.Album;
import kr.co.jhta.vo.Concert;
import kr.co.jhta.vo.Criteria;
import kr.co.jhta.vo.Hall;
import kr.co.jhta.vo.Music;
import kr.co.jhta.vo.Performance;
import kr.co.jhta.vo.User;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@Value("${directory.images.concerts}")
	private String imageDirectory;
	
	@RequestMapping("/admin/deletealbum.do")
	public @ResponseBody void deleteAlbum(@RequestParam("albumNo") int albumNo) {
		adminService.deleteAlbum(albumNo);
	}
	
	@RequestMapping("/admin/showalbuminfo.do")
	public @ResponseBody Map<String, Object> showAlbumInfo(@RequestParam("albumNo") int albumNo) {
		return adminService.getAlbumInfoByNo(albumNo);
	}
	
	@RequestMapping(value="admin/regalbum.do", method=RequestMethod.POST)
	public String registerAlbum(Album album, @RequestParam(name="coverImage", required=false) MultipartFile coverImage) throws IOException {
		
		adminService.registerAlbum(album, coverImage);
		
		return "redirect:managealbum.do";
	}
	
	@RequestMapping(value="admin/regalbum.do", method=RequestMethod.GET)
	public String albumForm(Model model) {
		return "admin/albumform";
	}
	
	@RequestMapping(value="admin/managealbum.do")
	public String manageAlbum(Criteria criteria, @RequestParam(name="cp", required=false, defaultValue="1") int cp, Model model) {
		
		Map <String, Object> map = adminService.getAlbumList(criteria, cp);
		
		model.addAttribute("albums", map.get("albums"));
		model.addAttribute("pagination", map.get("pagination"));
		
		return "admin/managealbum";
	}
	
	@RequestMapping("/admin/deletemusic.do")
	public @ResponseBody void deleteMusic(@RequestParam("musicNo") int musicNo) {
		adminService.deleteMusic(musicNo);
	}
	
	@RequestMapping("/admin/showmusicinfo.do")
	public @ResponseBody Map<String, Object> showMusicInfo(@RequestParam("musicNo") int musicNo) {
		return adminService.getMusicInfoByNo(musicNo);
	}
	
	@RequestMapping(value="admin/regmusic.do", method=RequestMethod.POST)
	public String registerMusic(Music music, @RequestParam(name="coverImage") MultipartFile coverImage, 
			@RequestParam(name="musicfile") MultipartFile musicFile, @RequestParam(name="movie") MultipartFile movie, 
			@RequestParam("albumNo") int albumNo) throws IOException {
		
		adminService.registerMusic(music, coverImage, musicFile, movie, albumNo);
		
		return "redirect:managemusic.do";
	}
	
	@RequestMapping(value="admin/regmusic.do", method=RequestMethod.GET)
	public String musicForm(Model model, @RequestParam(name="albumNo", required=false, defaultValue="0") int albumNo) {
		if (albumNo != 0) {
			model.addAttribute("albumNo", albumNo);
		}
		return "admin/musicform";
	}
	
	@RequestMapping(value="admin/managemusic.do")
	public String manageMusic(Criteria criteria, @RequestParam(name="cp", required=false, defaultValue="1") int cp, Model model) {
		
		Map <String, Object> map = adminService.getMusicList(criteria, cp);
		
		model.addAttribute("musics", map.get("musics"));
		model.addAttribute("pagination", map.get("pagination"));

		return "admin/managemusic";
	}
	
	@RequestMapping(value="admin/modifyperf.do", method=RequestMethod.POST)
	public String modifyPerformance(Performance performance, @RequestParam("concNo") int concertNo, @RequestParam("hallNo") int hallNo) {
		
		adminService.modifyPerformance(performance, concertNo, hallNo);
		
		return "redirect:managecon.do";
	}
	
	@RequestMapping(value="admin/modifyperf.do", method=RequestMethod.GET)
	public String modifyPerformanceForm(@RequestParam("no") int performanceNo, Model model) {
		
		model.addAttribute("performance", adminService.getPerformanceByNo(performanceNo));
		model.addAttribute("halls", adminService.getHalls());
		return "admin/modifyperformance";
	}
	
	@RequestMapping("/admin/showseatnumber.do")
	public @ResponseBody Hall showSeatNumber(@RequestParam("hallNo") int hallNo) {
		return adminService.getHallByHallNo(hallNo);
	}
	
	@RequestMapping(value="admin/regperf.do", method=RequestMethod.POST)
	public String registerPerformance(Performance performance, @RequestParam("concNo") int concertNo, @RequestParam("hallNo") int hallNo) {
		
		adminService.registerPerformance(performance, concertNo, hallNo);
		
		return "redirect:managecon.do";
	}
	
	@RequestMapping(value="admin/regperf.do", method=RequestMethod.GET)
	public String performanceForm(@RequestParam("no") int concertNo, Model model) {
		model.addAttribute("concert", adminService.getConcertByNo(concertNo));
		model.addAttribute("halls", adminService.getHalls());
		return "admin/performanceform";
	}
	
	@RequestMapping(value="admin/modifycon.do", method=RequestMethod.POST)
	public String modifyConcert(Concert concert, @RequestParam(name="coverImageFile") MultipartFile coverImageFile, 
			@RequestParam(name="descImageFile") MultipartFile descImageFile, @RequestParam("cateNo") int cateNo) throws IOException {
		
		adminService.modifyConcert(concert, coverImageFile, descImageFile, cateNo);
		
		return "redirect:managecon.do";
	}
	
	@RequestMapping(value="admin/modifycon.do", method=RequestMethod.GET)
	public String modifyConcertForm(@RequestParam("no") int concertNo, Model model) {
		model.addAttribute("concert", adminService.getConcertByNoForAdmin(concertNo));
		return "admin/modifyconcert";
	}
	
	@RequestMapping(value="admin/regconcert.do")
	public String registerConcert(Concert concert, @RequestParam("coverImageFile") MultipartFile coverImageFile, 
			@RequestParam(name="descImageFile") MultipartFile descImageFile, @RequestParam("cateNo") int cateNo) throws IOException {
		
		adminService.registerConcert(concert, coverImageFile, descImageFile, cateNo);
		
		return "redirect:managecon.do";
	}
	
	@RequestMapping(value="admin/concertform.do")
	public String concertForm(Model model) {
		return "admin/concertform";
	}
	
	@RequestMapping("/admin/managecon.do")
	public String manageConcert(Criteria criteria, @RequestParam(name="cp", required=false, defaultValue="1") int cp, Model model) {
		
		Map <String, Object> map = adminService.getConcertList(criteria, cp);
		
		model.addAttribute("concerts", map.get("concerts"));
		model.addAttribute("pagination", map.get("pagination"));
		
		return "admin/manageconcert";
	}
	
	@RequestMapping("/admin/showconcertinfo.do")
	public @ResponseBody Map<String, Object> showConcertInfo(@RequestParam("concertNo") int concertNo) {
		return adminService.getConcertInfoByNo(concertNo);
	}
	
	@RequestMapping("/admin/showuserinfo.do")
	public @ResponseBody User showUserInfo(@RequestParam("userNo") int userNo) {
		return adminService.getUserByNo(userNo);
	}
	
	@RequestMapping("/admin/changeuseravabl.do")
	public @ResponseBody User changeUserAvailable(@RequestParam("userNo") int userNo, @RequestParam("userAvail") String userAvail) {

		return adminService.changeuserAvailable(userNo, userAvail);
	}
	
	@RequestMapping(value="admin/manageuser.do")
	public String manageUser(Criteria criteria, @RequestParam(name="cp", required=false, defaultValue="1") int cp, Model model) {
		
		Map <String, Object> map = adminService.getUserList(criteria, cp);
		
		model.addAttribute("users", map.get("users"));
		model.addAttribute("pagination", map.get("pagination"));
		
		return "admin/manageuser";
	}
	
	@RequestMapping(value="admin/main.do")
	public String manageMain(Model model) {
		
		Map <String, Object> map = adminService.getCounts();
		
		model.addAttribute("concertCount", map.get("concertCount"));
		model.addAttribute("albumCount", map.get("albumCount"));
		model.addAttribute("userCount", map.get("userCount"));
		
		return "admin/main";
	}
	
}
