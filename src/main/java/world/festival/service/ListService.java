package world.festival.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


import world.festival.VO.ListVO;
import world.festival.dao.ListDAO;

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
			System.out.println("���񽺴���  vo�� "+vo);

			try {
				uploadFileName.transferTo(new File("C:/test/"+savedFilename));
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		int result = dao.writeFestival(vo);
		if(result != 1){return false;}
		System.out.println("���񽺿����� ����Ʈ��"+result);
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

	public ArrayList<ListVO> printAll() {
		return dao.printAll();
	}
	
}
