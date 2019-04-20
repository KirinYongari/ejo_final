package kr.co.jhta.service;

import java.util.List;

import kr.co.jhta.vo.Album;

public interface AlbumService {
	List<Album> getAllAlbum();	// 모든 앨범을 가져오기
	List<Album> getSixAlbum();	// 메인에 보여줄 최신 앨범 6개 가져오기
	List<Album> getFiveAlbum();	// 메인에 보여줄 랜덤용 앨범 5개 페이징처리용 s
	
	//앨범
	Album getAlbumByNo(int albumNo);
	void updateAlbum(Album album);
	void likeAlbum(int albumNo);

}
