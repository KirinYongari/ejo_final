package kr.co.jhta.service;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.CookieValue;

import kr.co.jhta.dao.ForUDao;
import kr.co.jhta.vo.Concert;
import kr.co.jhta.vo.LikesPlanner;
import kr.co.jhta.vo.User;

@Service
public class ForUServiceImpl implements ForUService {
	
	@Autowired
	ForUDao forUDao;

	@Override
	public List<LikesPlanner> getConcertPlanner(User user)  {
		
			return forUDao.getConcertPlanner(user.getNo());
			
	
	}

	@Override
	public void addPlanner(int userNo,int concertNo) {
		
		LikesPlanner likesPlanner = new LikesPlanner();
		Concert concert = new Concert();
		concert.setNo(concertNo);
		User user = new User();
		user.setNo(userNo);
		
		likesPlanner.setConcert(concert);
		likesPlanner.setUser(user);
		
		forUDao.addPlanner(likesPlanner);
	}

	@Override
	public LikesPlanner getLikePlannerByuserNoandConcertNo(int userNo, int concertNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("concertNo", concertNo);
		
		return forUDao.getLikePlannerByuserNoandConcertNo(map);
	}

	@Override
	public void deletePlanner(int userNo, int concertNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("concertNo", concertNo);
		
		forUDao.deletePlanner(map);
		
	}

	@Override
	public List<LikesPlanner> sessionPlanners(int userNo, String recentConcert) {
		String[] cocnert = recentConcert.split(":");
		Map<String, Object> map = new HashMap<>();
		
		List<Integer> concertsNo = new ArrayList<>();
		for(String concertNo : cocnert){
			concertsNo.add(Integer.parseInt(concertNo));
		}
		map.put("userNo", userNo);
		map.put("concertsNo",concertsNo);
		return forUDao.sessionPlanners(map);
	}

	@Override
	public String plannerByUserNo(int userNo, String cookieValue) {
		List<LikesPlanner> concerts = forUDao.plannerByUserNo(userNo);
		
		System.out.println("현재 플래너 : " + Arrays.toString(concerts.stream().mapToInt(item-> item.getConcert().getNo()).toArray()));
		
		if (!cookieValue.isEmpty()) {
			List<Integer> concertlist = new ArrayList<>();
			String[] recentConcertsNo  = cookieValue.split(":");
			for(String concertNo : recentConcertsNo) {
				concertlist.add(Integer.parseInt(concertNo));
			}
			System.out.println("현재 쿠키 : " + cookieValue);
			
			
			Iterator<Integer> cookieIter = concertlist.iterator();
			
			while (cookieIter.hasNext()) {
				int cookieNo = cookieIter.next();
				if(existPlanner(concerts,cookieNo)) {
					cookieIter.remove();				
				}
			} 
			
			String concertNumbersStr = StringUtils.collectionToDelimitedString(concertlist, ":");
			System.out.println("처리 후 쿠키 : " + concertNumbersStr);
			
			return concertNumbersStr;		
		} else {
			return "";		
		}
	}
	
	private boolean existPlanner(List<LikesPlanner> concerts, int concertNo) {
		Iterator<LikesPlanner> pannersIter = concerts.iterator();
		while (pannersIter.hasNext()) {
			if (pannersIter.next().getConcert().getNo() == concertNo) {
				return true;
			}
		}
		return false;
	}
	

	
}
