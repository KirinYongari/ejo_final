package kr.co.jhta.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.dao.MymusicDao;
import kr.co.jhta.vo.PlaylistBoard;
import kr.co.jhta.vo.User;

@Service
public class MymusicServiceImpl implements MymusicService {

	@Autowired
	MymusicDao mymusicDao;
	
	@Override
	public List<PlaylistBoard> getThreeRandomPlaylist() {
		List<PlaylistBoard> playlistboards = mymusicDao.getThreeRandomPlaylist();
		return playlistboards;
	}

	@Override
	public List<PlaylistBoard> getCommentPlaylist(int userNo) {
		return mymusicDao.getCommentPlaylist(userNo);
	}

	@Override
	public int getVisitor() {
		return mymusicDao.getVisitor();
	}

	@Override
	public void insertComment(PlaylistBoard playlistboard) {
		mymusicDao.insertComment(playlistboard);
	}

}
