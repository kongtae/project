package world.festival.dao;

import java.io.File;
import java.util.ArrayList;
<<<<<<< HEAD:src/main/java/world/festival/dao/ListService.java
=======
import java.util.HashMap;
>>>>>>> f0486a337f5e5d62e0625d1e68bc044fb12a5559:dao/ListService.java
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


import world.festival.VO.ListVO;
import world.festival.VO.ReplyVO;

@Service
public class ListService {

	@Autowired
	private ListDAO dao;
	

	public boolean writeFestival(ListVO vo, MultipartFile uploadFileName) {
		if(!uploadFileName.isEmpty()){
			String savedFilename = UUID.randomUUID().toString();
			String originalFilename = uploadFileName.getOriginalFilename();

			vo.setOriginalFileName(originalFilename);
			vo.setSaveFileName(savedFilename);
			System.out.println("¼­ºñ½º´ÜÀÇ  vo°ª "+vo);

			try {
				uploadFileName.transferTo(new File("C:/test/"+savedFilename));
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		int result = dao.writeFestival(vo);
		if(result != 1){return false;}
		System.out.println("ï¿½ï¿½ï¿½ñ½º¿ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½Æ®ï¿½ï¿½"+result);
		return true;
	}

	public boolean deleteFestival(ListVO vo) {
		int result = dao.deleteFestival(vo);
		if(result!=1){return false;}
		return true;
	}
<<<<<<< HEAD:src/main/java/world/festival/dao/ListService.java
	//ëŒ“ê¸€ ë‹¬ê¸°
//	public boolean replywrite(ReplyVO vo) {
//		int result = dao.replywrite(vo);
//		if(result!=1){return false;}
//		return true;
//	}
	
	//ëŒ“ê¸€ ì¶œë ¥
	public ArrayList<ReplyVO> replyList(int boardnum) {
		return dao.replyList(boardnum);
=======


	public ArrayList<ListVO> selectOne(ListVO vo, String searchItem, String searchKeyword) {
		HashMap<String, String> map = new HashMap<>();
		map.put("searchItem", searchItem);
		map.put("searchKeyword", searchKeyword);
		map.put("endEvent", vo.getEndEvent());
		return dao.selectOne(map);
	}

	public ArrayList<ListVO> selectOne2(String searchItem, String searchKeyword) {
		HashMap<String, String> map = new HashMap<>();
		map.put("searchItem", searchItem);
		map.put("searchKeyword", searchKeyword);
		return dao.selectOne2(map);
	}

	public ArrayList<ListVO> printAll() {
		return dao.printAll();
>>>>>>> f0486a337f5e5d62e0625d1e68bc044fb12a5559:dao/ListService.java
	}
	
}
