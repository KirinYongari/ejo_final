package kr.co.jhta.dao;

import java.util.List;

import kr.co.jhta.vo.Album;
import kr.co.jhta.vo.Criteria;

public interface AlbumDao {
	List<Album> getAllAlbum();	// 모든 앨범을 가져오기
	List<Album> getSixAlbum();	// 메인에 보여줄 최신 앨범 6개 가져오기
	List<Album> getFiveAlbum();	// 메인에 보여줄 랜덤용 앨범 5개 페이징처리용 
	
	//앨범
	Album getAlbumByNo(int albumNo);
	Album getAlbumByNoForAdmin(int albumNo);
	int getTotalAlbumRows(Criteria criteria);
	List<Album> getAlbums(Criteria criteria);
	
	void updateAlbum(Album album);
	void deleteAlbum(int albumNo);
	void addAlbum(Album album);
	int getAlbumCount();
	
}
