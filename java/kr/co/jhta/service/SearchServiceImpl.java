package kr.co.jhta.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.dao.SearchDao;
import kr.co.jhta.vo.Album;
import kr.co.jhta.vo.Concert;

@Service
public class SearchServiceImpl implements SearchService{

	@Autowired
	SearchDao searchDao;
	
	@Override
	public List<Concert> getConcertBySearch(String keyword) {
		return searchDao.getConcertBySearch(keyword);
	}

	@Override
	public List<Album> getAlbumBySearch(String keyword) {
		return searchDao.getAlbumBySearch(keyword);
	}
	
	
}
