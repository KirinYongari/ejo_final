package kr.co.jhta.dao;

import java.util.List;

import kr.co.jhta.vo.Album;
import kr.co.jhta.vo.Concert;

public interface SearchDao {
	List<Album> getAlbumBySearch(String keyword); 
	List<Concert> getConcertBySearch(String keyword);
}
