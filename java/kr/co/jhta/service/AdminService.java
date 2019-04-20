package kr.co.jhta.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.co.jhta.vo.Album;
import kr.co.jhta.vo.Concert;
import kr.co.jhta.vo.Criteria;
import kr.co.jhta.vo.Hall;
import kr.co.jhta.vo.Music;
import kr.co.jhta.vo.Performance;
import kr.co.jhta.vo.User;

public interface AdminService {

	void deleteAlbum(int albumNo);

	Map<String, Object> getAlbumInfoByNo(int albumNo);

	void deleteMusic(int musicNo);

	Map<String, Object> getMusicInfoByNo(int musicNo);

	void updatePerformance(Performance performance);

	Performance getPerformanceByNo(int performanceNo);

	List<Hall> getHalls();

	Hall getHallByHallNo(int hallNo);

	Concert getConcertByNo(int concertNo);

	Concert getConcertByNoForAdmin(int no);

	void updateConcert(Concert concert);

	Map<String, Object> getConcertInfoByNo(int concertNo);

	User getUserByNo(int userNo);

	User changeuserAvailable(int userNo, String userAvail);

	Map<String, Object> getMusicList(Criteria criteria, int cp);

	Map<String, Object> getConcertList(Criteria criteria, int cp);

	Map<String, Object> getUserList(Criteria criteria, int cp);

	Map<String, Object> getAlbumList(Criteria criteria, int cp);

	void registerMusic(Music music, MultipartFile coverImage, MultipartFile musicFile, MultipartFile movie,
			int albumNo) throws IOException;

	void modifyPerformance(Performance performance, int concertNo, int hallNo);

	void registerPerformance(Performance performance, int concertNo, int hallNo);

	void modifyConcert(Concert concert, MultipartFile coverImageFile, MultipartFile descImageFile, int cateNo) throws IOException;

	void registerConcert(Concert concert, MultipartFile coverImageFile, MultipartFile descImageFile, int cateNo) throws IOException;

	void registerAlbum(Album album, MultipartFile coverImage) throws IOException;

	Map<String, Object> getCounts();

}
