package kr.co.jhta.service;

import java.util.List;

import kr.co.jhta.vo.PlaylistBoard;
import kr.co.jhta.vo.User;

public interface MymusicService {
	List<PlaylistBoard> getThreeRandomPlaylist();			// 메인에 보여줄 플레이리스트를 랜덤으로 3개 뽑음
	List<PlaylistBoard> getCommentPlaylist(int userNo);		// 플레이리스트에 방명록(댓글) 리스트
	int getVisitor();										// 방명록에 댓글 세기
	void insertComment(PlaylistBoard playlistboard);		// 댓글 달기
	
}
