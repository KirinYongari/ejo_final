package kr.co.jhta.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;



import kr.co.jhta.service.SearchService;
import kr.co.jhta.vo.Album;
import kr.co.jhta.vo.Concert;

@Controller
public class SearchController {
	
	@Autowired
	private SearchService searchService;
	
	@RequestMapping("/main/search.do")
	public String search() {
		
		return "main/search";
	}
	
	@RequestMapping(value="/search/modalSearch.do" , produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map<String, Object> modalSearch(@RequestParam("keyword") String keyword) {
		List<Concert> concerts = searchService.getConcertBySearch(keyword);
		List<Album> albums = searchService.getAlbumBySearch(keyword);
		
		Map<String, Object> map = new HashMap<>();
		map.put("concerts", concerts);
		map.put("albums", albums);
		return map;	
	}

	
}
