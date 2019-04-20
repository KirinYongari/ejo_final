package kr.co.jhta.service;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.co.jhta.dao.AlbumDao;
import kr.co.jhta.dao.ConcertDao;
import kr.co.jhta.dao.HallDao;
import kr.co.jhta.dao.MusicDao;
import kr.co.jhta.dao.PerformanceDao;
import kr.co.jhta.dao.UserDao;
import kr.co.jhta.vo.Album;
import kr.co.jhta.vo.Category;
import kr.co.jhta.vo.Concert;
import kr.co.jhta.vo.Criteria;
import kr.co.jhta.vo.Hall;
import kr.co.jhta.vo.Music;
import kr.co.jhta.vo.Pagination;
import kr.co.jhta.vo.Performance;
import kr.co.jhta.vo.User;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AlbumDao albumDao;
	
	@Autowired
	MusicDao musicDao;
	
	@Autowired
	PerformanceDao performanceDao;
	
	@Autowired
	ConcertDao concertDao;
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	HallDao hallDao;

	@Value("${directory.images.concerts}")
	private String imageDirectory;
	
	@Override
	public void deleteAlbum(int albumNo) {
		albumDao.deleteAlbum(albumNo);
	}

	@Override
	public Map<String, Object> getAlbumInfoByNo(int albumNo) {
		Map<String, Object> map = new HashMap<>();
		Album album = albumDao.getAlbumByNoForAdmin(albumNo);
		List<Music> musics = musicDao.getMusicByAlbumNo(albumNo);
		map.put("music", musics);
		map.put("album", album);
		return map;
	}

	@Override
	public void deleteMusic(int musicNo) {
		musicDao.deleteMusic(musicNo);
	}

	@Override
	public Map<String, Object> getMusicInfoByNo(int musicNo) {
		Map<String, Object> map = new HashMap<>();
		Music music = musicDao.getMusicByNo(musicNo);
		Album album = albumDao.getAlbumByNo(music.getAlbum().getNo());
		map.put("music", music);
		map.put("album", album);
		return map;
	}

	@Override
	public void updatePerformance(Performance performance) {
		performanceDao.updatePerformance(performance);
	}

	@Override
	public Performance getPerformanceByNo(int performanceNo) {
		return performanceDao.getPerformanceByNo(performanceNo);
	}

	@Override
	public List<Hall> getHalls() {
		return hallDao.getHalls();
	}

	@Override
	public Hall getHallByHallNo(int hallNo) {
		return hallDao.getHallByHallNo(hallNo);
	}

	@Override
	public Concert getConcertByNo(int concertNo) {
		Concert concert = concertDao.getConcertByNo(concertNo);
		List<Hall> halls = hallDao.getHallByConcertNo(concert.getNo());
		concert.setHalls(halls);
		return concert;
	}

	@Override
	public Concert getConcertByNoForAdmin(int no) {
		return concertDao.getConcertByNoForAdmin(no);
	}

	@Override
	public void updateConcert(Concert concert) {
		concertDao.updateConcert(concert);
		
	}

	@Override
	public Map<String, Object> getConcertInfoByNo(int concertNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("concert", concertDao.getConcertByNoForAdmin(concertNo));
		map.put("performances", performanceDao.getPerfByConNo(concertNo));
		return map;
	}

	@Override
	public User getUserByNo(int userNo) {
		return userDao.getUserByNo(userNo);
	}

	@Override
	public User changeuserAvailable(int userNo, String userAvail) {
		
		User user = userDao.getUserByNo(userNo);
		if ("N".equals(userAvail)) {
			user.setAvailable("N");
		} else if ("Y".equals(userAvail)) {
			user.setAvailable("Y");
		}
		
		userDao.updateUser(user);
		user = userDao.getUserByNo(userNo);
		
		return user;
	}

	@Override
	public Map<String, Object> getMusicList(Criteria criteria, int cp) {
		int totalRows = musicDao.countMusic(criteria);
		Pagination pagination = new Pagination(totalRows, cp, 5, 10);
		criteria.setBeginIndex(pagination.getBeginIndex());
		criteria.setEndIndex(pagination.getEndIndex());

		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pagination);
		map.put("musics", musicDao.getMusicsForAdmin(criteria));
		return map;
	}

	@Override
	public Map<String, Object> getConcertList(Criteria criteria, int cp) {
		
		int totalRows = concertDao.getTotalConcertRows(criteria);
		Pagination pagination = new Pagination(totalRows, cp, 5, 10);
		criteria.setBeginIndex(pagination.getBeginIndex());
		criteria.setEndIndex(pagination.getEndIndex());
		
		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pagination);
		map.put("concerts", concertDao.getConcertsByCriteria(criteria));
		return map;
	}

	@Override
	public Map<String, Object> getUserList(Criteria criteria, int cp) {
		int totalRows = userDao.getTotalUserRows(criteria);
		Pagination pagination = new Pagination(totalRows, cp, 5, 10);
		criteria.setBeginIndex(pagination.getBeginIndex());
		criteria.setEndIndex(pagination.getEndIndex());
		
		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pagination);
		map.put("users", userDao.getUsers(criteria));
		return map;
	}

	@Override
	public Map<String, Object> getAlbumList(Criteria criteria, int cp) {
		int totalRows = albumDao.getTotalAlbumRows(criteria);
		Pagination pagination = new Pagination(totalRows, cp, 5, 10);
		criteria.setBeginIndex(pagination.getBeginIndex());
		criteria.setEndIndex(pagination.getEndIndex());
		
		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pagination);
		map.put("albums", albumDao.getAlbums(criteria));
		return map;
	}

	@Override
	public void registerMusic(Music music, MultipartFile coverImage, MultipartFile musicFile, MultipartFile movie,
			int albumNo) throws IOException {
		
		if (!coverImage.isEmpty()) {
			String filename = coverImage.getOriginalFilename();
			FileCopyUtils.copy(coverImage.getBytes(), new File(imageDirectory, filename));
			music.setImg(filename);
		} else {
			music.setImg("back.jpg");
		}
		
		if (!musicFile.isEmpty()) {
			String filename = musicFile.getOriginalFilename();
			FileCopyUtils.copy(musicFile.getBytes(), new File(imageDirectory, filename));
			music.setFilename(filename);
		} else {
			music.setImg("back.jpg");
		}
		
		if (!movie.isEmpty()) {
			String filename = movie.getOriginalFilename();
			FileCopyUtils.copy(movie.getBytes(), new File(imageDirectory, filename));
			music.setVideo(filename);
		} else {
			music.setImg("back.jpg");
		}
		
		Album album = new Album();
		album.setNo(albumNo);
		music.setAlbum(album);
		musicDao.addMusic(music);
	}

	@Override
	public void modifyPerformance(Performance performance, int concertNo, int hallNo) {
		
		Concert concert = new Concert();
		concert.setNo(concertNo);
		Hall hall = new Hall();
		hall.setNo(hallNo);
		performance.setConcert(concert);
		performance.setHall(hall);
		performanceDao.updatePerformance(performance);
	}

	@Override
	public void registerPerformance(Performance performance, int concertNo, int hallNo) {
		
		Concert concert = new Concert();
		concert.setNo(concertNo);
		Hall hall = new Hall();
		hall.setNo(hallNo);
		performance.setConcert(concert);
		performance.setHall(hall);
		performanceDao.addPerformance(performance);
	}

	@Override
	public void modifyConcert(Concert concert, MultipartFile coverImageFile, MultipartFile descImageFile, int cateNo) throws IOException {
		
		if (!coverImageFile.isEmpty()) {
			String filename = coverImageFile.getOriginalFilename();
			FileCopyUtils.copy(coverImageFile.getBytes(), new File(imageDirectory, filename));
			concert.setCoverImg(filename);
		} else {
			concert.setCoverImg(concertDao.getConcertByNoForAdmin(concert.getNo()).getCoverImg());
		}
		
		if (!descImageFile.isEmpty()) {
			String filename = descImageFile.getOriginalFilename();
			FileCopyUtils.copy(descImageFile.getBytes(), new File(imageDirectory, filename));
			concert.setContentImg(filename);
		} else {
			concert.setContentImg(concertDao.getConcertByNoForAdmin(concert.getNo()).getContentImg());
		}
		
		Category category = new Category();
		category.setNo(cateNo);
		concert.setCategory(category);
		concertDao.updateConcert(concert);
	}

	@SuppressWarnings("deprecation")
	@Override
	public void registerConcert(Concert concert, MultipartFile coverImageFile, MultipartFile descImageFile, int cateNo)
			throws IOException {

		if (!coverImageFile.isEmpty()) {
			String filename = coverImageFile.getOriginalFilename();
			FileCopyUtils.copy(coverImageFile.getBytes(), new File(imageDirectory, filename));
			concert.setCoverImg(filename);
		}
		
		if (!descImageFile.isEmpty()) {
			String filename = descImageFile.getOriginalFilename();
			FileCopyUtils.copy(descImageFile.getBytes(), new File(imageDirectory, filename));
			concert.setContentImg(filename);
		}
		
		Category category = new Category();
		category.setNo(cateNo);
		concert.setCategory(category);
		Date closeDate = concert.getCloseDate();
		closeDate.setSeconds(86399);
		Date ticketCloseDate = concert.getTicketCloseDate();
		ticketCloseDate.setSeconds(86399);
		concert.setCloseDate(closeDate);
		concert.setTicketCloseDate(ticketCloseDate);
		concertDao.addConcert(concert);
	}

	@Override
	public void registerAlbum(Album album, MultipartFile coverImage) throws IOException {

		if (!coverImage.isEmpty()) {
			String filename = coverImage.getOriginalFilename();
			FileCopyUtils.copy(coverImage.getBytes(), new File(imageDirectory, filename));
			album.setCoverImg(filename);
		} else {
			album.setCoverImg("back.jpg");
		}
		
		albumDao.addAlbum(album);
		
	}

	@Override
	public Map<String, Object> getCounts() {
		
		Map<String, Object> map = new HashMap<>();
		map.put("concertCount", concertDao.getConcertCount());
		map.put("albumCount", albumDao.getAlbumCount());
		map.put("userCount", userDao.getUserCount());
		
		return map;
	}

}
