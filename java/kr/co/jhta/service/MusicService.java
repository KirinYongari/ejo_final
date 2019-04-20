package kr.co.jhta.service;

import java.util.List;
import java.util.Map;

import kr.co.jhta.vo.Criteria;
import kr.co.jhta.vo.Music;
import kr.co.jhta.vo.Playlist;
import kr.co.jhta.vo.PlaylistItem;
import kr.co.jhta.vo.User;

public interface MusicService {
	List<Music> getMusics(Criteria criteria);

	int countMusic(Criteria criteria);					// 모든 음악 카운트
	Music getMusicByNo(int musicNo);
	List<Music> getMusicByAlbumNoAndUserNo(Map<String,Integer> map);
	void likeMusic(int musicNo);
	void updateMusic(Music music);

	void addMusicList(PlaylistItem playlistItem,int musicNo);
	void deleteMusicList(PlaylistItem playlistItem,int musicNo);
	Playlist getPlaylistByno(int userNo);
	
	void addPlaylist(User user);
	List<PlaylistItem> getPlaylistItemByUserNo(int userNo);
	
	int countMusicByUserNo(int playlistItemNo);	// 유저가 담은 노래 카운트
}
