package world.festival.dao;

import java.util.ArrayList;
import java.util.HashMap;

import world.festival.VO.BoardVO;
import world.festival.VO.ListVO;
import world.festival.VO.ReplyVO;

public interface BoardMapper {

	public ArrayList<BoardVO> boardPrintAll();

	public int BoardWrite(BoardVO vo);

	public BoardVO readBoard(String bul_boardnum);

	public int BoardDelete(BoardVO vo);

	public ArrayList<ReplyVO> replyList(int mainboardnum);


	
}