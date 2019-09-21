package world.festival.dao;

import java.util.ArrayList;
import java.util.HashMap;

import world.festival.VO.ListVO;
import world.festival.VO.ReplyVO;

public interface ReplyMapper {

	//댓글 입력
	public int replywrite(ReplyVO vo);
	//댓글 출력
	public ArrayList<ReplyVO> replyList(int boardnum);
	//댓글 삭제
	public boolean replyDelete(ReplyVO vo);
	//댓글 수정
	public void replyUpdate(ReplyVO vo);
	//자유게시판 댓글 입력
	public int replywriteBoard(ReplyVO vo);
	
}
