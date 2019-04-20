package kr.co.jhta.service;

import java.util.List;

import kr.co.jhta.vo.Album;
import kr.co.jhta.vo.Concert;

public interface SearchService {
	List<Album> getAlbumBySearch(String keyword); 
	List<Concert> getConcertBySearch(String keyword);
}
