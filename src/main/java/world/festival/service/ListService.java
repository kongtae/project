package world.festival.service;

import java.io.File;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.UUID;

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
		
		String path = "C:/Users/kita/Desktop/conduct/gitfolder/gitworkspace/project/src/main/webapp/resources/images/userimage/";
		
		File dir = new File(path);
		if(!dir.isDirectory()){
			dir.mkdir();
		}
		
		Iterator<String> files = request.getFileNames();
		String savedFilename = UUID.randomUUID().toString();
		System.out.println("files"+files);
		String fileName = "";
		String fileName1 = "";
		while(files.hasNext()){
			String uploadFile = files.next();
			MultipartFile mFile = request.getFile(uploadFile);
			fileName1 = mFile.getOriginalFilename();
			fileName += mFile.getOriginalFilename()+",";
			System.out.println("실제파일이름"+fileName);
			try {
				mFile.transferTo(new File(path+fileName1));
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			vo.setSaveFileName(savedFilename);
			vo.setOriginalFileName(fileName);
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


	public ArrayList<ListVO> selectOne(String endEvent, String searchItem, String searchKeyword) {
		HashMap<String, String> map = new HashMap<>();
		map.put("searchItem", searchItem);
		map.put("searchKeyword", searchKeyword);
		map.put("endEvent", endEvent);
		System.out.println(endEvent);
		System.out.println("서비스의 맵이 다 처리 되었나 ? 셀렉원1map : "+map);
		return dao.selectOne(map);
	}

	public ArrayList<ListVO> selectOne2(String searchItem, String searchKeyword) {
		HashMap<String, String> map = new HashMap<>();
		map.put("searchItem", searchItem);
		map.put("searchKeyword", searchKeyword);
		System.out.println("서비스의 맵이 다 처리 되었나 ? 셀렉원2map : "+map);
		return dao.selectOne2(map);
	}


	public ArrayList<ReplyVO> replyList(int boardnum) {
		return dao.replyList(boardnum);
	}

	public boolean updateFestival(ListVO vo, MultipartHttpServletRequest request) {

		String oldSaveFileName = vo.getSaveFileName();
		String path = "C:/Users/kita/Desktop/conduct/gitfolder/gitworkspace/project/src/main/webapp/resources/images/userimage/";
		int result;

		File dir = new File(path);
		if(!dir.isDirectory()){
			dir.mkdir();
		}
		
		Iterator<String> files = request.getFileNames();
		String savedFilename = UUID.randomUUID().toString();
		System.out.println("files"+files);
		String fileName1="";
		String fileName="";
		while(files.hasNext()){
			String uploadFile = files.next();
			MultipartFile mFile = request.getFile(uploadFile);
			fileName1 = mFile.getOriginalFilename();
			fileName += mFile.getOriginalFilename()+",";
			System.out.println("실제파일이름"+fileName);
			try {
				mFile.transferTo(new File(path+fileName1));
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		
			vo.setSaveFileName(savedFilename);
			vo.setOriginalFileName(fileName);
		}
		result = dao.updateFestival(vo);
		if(result != 1){return false;}
		System.out.println("등록 결과 값: "+result);
		
		File file = new File(path + oldSaveFileName);
		if(file.exists()){
			file.delete();
		}
		
		return true;
	}
	
}
