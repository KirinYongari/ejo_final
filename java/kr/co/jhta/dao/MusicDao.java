package kr.co.jhta.dao;

import java.util.List;
import java.util.Map;

import kr.co.jhta.vo.Album;
import kr.co.jhta.vo.Criteria;
import kr.co.jhta.vo.Music;
import kr.co.jhta.vo.Playlist;
import kr.co.jhta.vo.PlaylistItem;

public interface MusicDao {
	List<Music> getMusics(Criteria criteria);
	List<Music> getMusicsForAdmin(Criteria criteria);
	int countMusic(Criteria criteria);					// 모든 음악 카운트
	
	Music getMusicByNo(int musicNo);
	List<Music> getMusicByAlbumNoAndUserNo(Map<String,Integer> map);
	List<Music> getMusicByAlbumNo(int albumNo);
	
	void updateMusic(Music music);
	
	void addMusicList(PlaylistItem playlistItem);
	void deleteMusicList(PlaylistItem playlistItem);
	Playlist getPlaylistByno(int userNo);
	
	void addPlaylist(Playlist playlist);
	List<PlaylistItem> getPlaylistItemByUserNo(int userNo);
	void deleteMusic(int musicNo);
	void addMusic(Music music);
	
	int countMusicByUserNo(int playlistItemNo);	// 유저가 담은 노래 카운트
}

