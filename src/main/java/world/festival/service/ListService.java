package world.festival.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import world.festival.VO.ListVO;
import world.festival.VO.ReplyVO;
import world.festival.dao.ListDAO;

@Service
public class ListService {

	@Autowired
	private ListDAO dao;
	

	public boolean writeFestival(ListVO vo, MultipartHttpServletRequest request) {
		String path = "C:/test/";
		
		File dir = new File(path);
		if(!dir.isDirectory()){
			dir.mkdir();
		}
		
		Iterator<String> files = request.getFileNames();
		System.out.println("files"+files);
		while(files.hasNext()){
			String uploadFile = files.next();
			MultipartFile mFile = request.getFile(uploadFile);
			String fileName = mFile.getOriginalFilename();
			System.out.println("실제파일이름"+fileName);
			vo.setOriginalFileName(fileName);
			try {
				mFile.transferTo(new File(path+fileName));
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
		}
		int result = dao.writeFestival(vo);
		if(result != 1){return false;}
		System.out.println("등록 결과 값: "+result);
		return true;
	}

	public boolean deleteFestival(ListVO vo) {
		int result = dao.deleteFestival(vo);
		if(result!=1){return false;}
		return true;
	}


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


	public ArrayList<ReplyVO> replyList(int boardnum) {
		return dao.replyList(boardnum);
	}
	
}
