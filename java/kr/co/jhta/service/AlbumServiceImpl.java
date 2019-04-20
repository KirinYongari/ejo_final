package kr.co.jhta.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.dao.AlbumDao;
import kr.co.jhta.vo.Album;

@Service
public class AlbumServiceImpl implements AlbumService{
	
	@Autowired
	AlbumDao albumDao;

	@Override
	public List<Album> getAllAlbum() {
		List<Album> albums = albumDao.getAllAlbum();
		return albums;
	}

	@Override
	public List<Album> getSixAlbum() {
		List<Album> albums = albumDao.getSixAlbum();
		return albums;
	}

	@Override
	public List<Album> getFiveAlbum() {
		List<Album> albums = albumDao.getFiveAlbum();
		return albums;
	}
	
	@Override
	public Album getAlbumByNo(int albumNo) {
		return albumDao.getAlbumByNo(albumNo);
	}
	
	@Override
	public void likeAlbum(int albumNo) {
		Album album = albumDao.getAlbumByNo(albumNo);
		album.setLikes(album.getLikes()+1);
		albumDao.updateAlbum(album);
	}

	@Override
	public void updateAlbum(Album album) {
		albumDao.updateAlbum(album);
	}

}
