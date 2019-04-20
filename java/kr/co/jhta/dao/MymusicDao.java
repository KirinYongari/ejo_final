package kr.co.jhta.dao;

import java.util.List;

import kr.co.jhta.vo.PlaylistBoard;
import kr.co.jhta.vo.User;

public interface MymusicDao {
	List<PlaylistBoard> getThreeRandomPlaylist();			// 메인에 보여줄 플레이리스트를 랜덤으로 3개 뽑음
	List<PlaylistBoard> getCommentPlaylist(int userNo);		// 방명록에 필요한 플레이리스트
	int getVisitor();										// 방명록에 댓글 세기
	void insertComment(PlaylistBoard playlistboard);		// 댓글 달기
}
