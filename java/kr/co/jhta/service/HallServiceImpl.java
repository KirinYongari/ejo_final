package kr.co.jhta.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.dao.HallDao;
import kr.co.jhta.vo.Hall;

@Service
public class HallServiceImpl implements HallService {
	
	@Autowired
	private HallDao hallDao;

	@Override
	public List<Hall> getHallByConcertNo(int no) {
		return hallDao.getHallByConcertNo(no);
	}

	@Override
	public List<Hall> getHalls() {
		return hallDao.getHalls();
	}

	@Override
	public Hall getHallByHallNo(int no) {
		return hallDao.getHallByHallNo(no);
	}
	
}
