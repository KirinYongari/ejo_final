package kr.co.jhta.vo;

import java.util.Date;

public class PlaylistItem {
	private int no;
	private int turn;
	private Date createDate;
	private Playlist playlist;
	private Music music;
	private Album album;
	private int like;
	private int countPlaylistItemMusic;			// 마이뮤직에 뿌려줄 노래리스트 카운트
	
	public PlaylistItem() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getTurn() {
		return turn;
	}

	public void setTurn(int turn) {
		this.turn = turn;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Playlist getPlaylist() {
		return playlist;
	}

	public void setPlaylist(Playlist playlist) {
		this.playlist = playlist;
	}

	public Music getMusic() {
		return music;
	}

	public void setMusic(Music music) {
		this.music = music;
	}

	public int getLike() {
		return like;
	}

	public void setLike(int like) {
		this.like = like;
	}

	public Album getAlbum() {
		return album;
	}

	public void setAlbum(Album album) {
		this.album = album;
	}

	public int getCountPlaylistItemMusic() {
		return countPlaylistItemMusic;
	}

	public void setCountPlaylistItemMusic(int countPlaylistItemMusic) {
		this.countPlaylistItemMusic = countPlaylistItemMusic;
	}
	
	
	
}
