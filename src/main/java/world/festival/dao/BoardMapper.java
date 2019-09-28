package world.festival.dao;

import java.util.ArrayList;
import java.util.HashMap;

import world.festival.VO.BoardVO;
import world.festival.VO.ListVO;
import world.festival.VO.ReplyVO;

public interface BoardMapper {

	public ArrayList<BoardVO> boardPrintAll();

	public int BoardWrite(BoardVO vo);

	public BoardVO readBoard(BoardVO vo1);

	public int BoardDelete(BoardVO vo);

	public ArrayList<ReplyVO> replyList(ReplyVO vo);

	public int boardUpdate(BoardVO vo);

	public ArrayList<BoardVO> BoardSelectOne1(HashMap<String, String> map);

	public ArrayList<BoardVO> BoardSelectOne2(HashMap<String, String> map);

	public void hitcount(BoardVO vo1);

	public BoardVO imagePrintBoard(BoardVO vo);

	public void RewriteBoard(BoardVO vo1);

	public void ReupdateBoard(BoardVO vo1);

	
}
