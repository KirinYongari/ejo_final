package kr.co.jhta.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.dao.MusicDao;
import kr.co.jhta.vo.Criteria;
import kr.co.jhta.vo.Music;
import kr.co.jhta.vo.Playlist;
import kr.co.jhta.vo.PlaylistItem;
import kr.co.jhta.vo.User;

@Service
public class MusicServiceImpl implements MusicService{

	@Autowired
	MusicDao musicDao;
	
	@Override
	public List<Music> getMusics(Criteria criteria) {
			
		return musicDao.getMusics(criteria);
	}

	@Override
	public int countMusic(Criteria criteria) {
		return musicDao.countMusic(criteria);
	}

	@Override
	public Music getMusicByNo(int musicNo) {
		return musicDao.getMusicByNo(musicNo);
	}

	@Override
	public List<Music> getMusicByAlbumNoAndUserNo(Map<String,Integer> map) {
		return musicDao.getMusicByAlbumNoAndUserNo(map);
	}

	@Override
	public void likeMusic(int musicNo) {
		Music music = musicDao.getMusicByNo(musicNo);
		int likes = music.getLikes();
		music.setLikes(likes+1);
		musicDao.updateMusic(music);
	}
	
	@Override
	public void updateMusic(Music music) {
		musicDao.updateMusic(music);
	}
	
	@Override
	public void addMusicList(PlaylistItem playlistItem,int musicNo) {
		//해당 음악 가져오기
		Music music = new Music();
		music.setNo(musicNo);
		playlistItem.setMusic(music);
		
		musicDao.addMusicList(playlistItem);
		
	}
	@Override
	public void deleteMusicList(PlaylistItem playlistItem, int musicNo) {
		Music music = new Music();
		music.setNo(musicNo);
		playlistItem.setMusic(music);
		
		musicDao.deleteMusicList(playlistItem);
		
	}
	
	@Override
	public Playlist getPlaylistByno(int userNo) {
		return musicDao.getPlaylistByno(userNo);
	}

	@Override
	public void addPlaylist(User user) {
		Playlist playlist = new Playlist();
		playlist.setUser(user);
		playlist.setTitle(user.getNickname());
		musicDao.addPlaylist(playlist);
		
	}

	@Override
	public List<PlaylistItem> getPlaylistItemByUserNo(int userNo) {
		return musicDao.getPlaylistItemByUserNo(userNo);
	}

	@Override
	public int countMusicByUserNo(int playlistItemNo) {
		return musicDao.countMusicByUserNo(playlistItemNo);
	}

}
