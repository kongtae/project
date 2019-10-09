package world.festival.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import world.festival.VO.AdminBoardVO;
import world.festival.VO.AdminListVO;
import world.festival.VO.BoardVO;
import world.festival.VO.ListVO;
import world.festival.VO.UserVO;
import world.festival.VO.WishVO;
import world.festival.dao.AdminDAO;
import world.festival.dao.UserDAO;

@Service
public class AdminService {

	@Autowired
	private AdminDAO admindao;


	public boolean AdminwriteFestival(AdminListVO adminvo, MultipartHttpServletRequest request) {
	//	String path = "C:/Users/kita/Desktop/conduct/gitfolder/gitworkspace/project/src/main/webapp/resources/images/userimage/";
		String path = "C:/Users/김성민/git/project/src/main/webapp/resources/images/userimage/";
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
			if(fileName1.equals("")) {
				System.out.println("어드민 나가");
				break;
			}
			try {
				mFile.transferTo(new File(path+fileName1));
			} catch (Exception e) {
				e.printStackTrace();
			}
			adminvo.setSaveFileName(savedFilename);
			adminvo.setOriginalFileName(fileName);
		}
		int result = admindao.AdminwriteFestival(adminvo);
		if(result != 1){return false;}
		System.out.println("등록 결과 값: "+result);
		return true;
	}

	public AdminListVO selectList() {
		// TODO Auto-generated method stub
		AdminListVO adminvo = admindao.selectList();
		return adminvo;
	}

	public AdminBoardVO selectBul() {
		AdminBoardVO adminvo = admindao.selectBul();
		return adminvo;
	}

	public boolean AdminBoardWrite(AdminBoardVO adminvo, MultipartHttpServletRequest request) {
	//	String path = "C:/Users/kita/Desktop/conduct/gitfolder/gitworkspace/project/src/main/webapp/resources/images/userimage/";
		String path = "C:/Users/김성민/git/project/src/main/webapp/resources/images/userimage/";
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
			adminvo.setSavedFileName(savedFilename);
			adminvo.setOriginalFileName(fileName);
		}
		int result = admindao.AdminBoardWrite(adminvo);
		if(result != 1){return false;}
		System.out.println("등록 결과 값: "+result);
		return true;
	}

	public AdminListVO selectupList(int parseInt) {
		AdminListVO adminvo = admindao.selectupList(parseInt);
		return adminvo;
	}

	public void AdminwriteFestival(AdminListVO adminvo) {
		admindao.AdminwriteFestival(adminvo);
		
		
	}
	//update및 delete 할때 값 가져오기
	public AdminBoardVO selectupBoard(int bul_boardnum) {
		AdminBoardVO adminvo = admindao.selectupBoard(bul_boardnum);
		return adminvo;
	}
	//delete시 값 넣기
	public void AdminBoardWrite(AdminBoardVO adminlist) {
		admindao.AdminBoardWrite(adminlist);
	}

	public ArrayList<AdminListVO> selectListAll() {
		ArrayList<AdminListVO> adminlistvo = admindao.selectListAll();
		return adminlistvo;
	}

	public ArrayList<AdminBoardVO> selectBulAll() {
		ArrayList<AdminBoardVO> adminbulvo = admindao.selectBulAll();
		return adminbulvo;
	}

	public ArrayList<AdminBoardVO> AdminBoardSelectOne1(String searchItem, String searchKeyword) {
		HashMap<String, String> map = new HashMap<>();
		map.put("searchItem", searchItem);
		map.put("searchKeyword", searchKeyword);
		System.out.println("보드 서비스 맵  :  "+map);
		return admindao.AdminBoardSelectOne1(map);
	}

	public ArrayList<AdminBoardVO> AdminBoardSelectOne2(String searchItem, String searchKeyword) {
		HashMap<String, String> map = new HashMap<>();
		map.put("searchItem", searchItem);
		map.put("searchKeyword", searchKeyword);
		System.out.println("보드 서비스 맵  : "+map);
		return admindao.AdminBoardSelectOne2(map);
	}

	public ArrayList<AdminListVO> AdminListSelectOne1(String endEvent, String searchItem, String searchKeyword) {
		HashMap<String, String> map = new HashMap<>();
		map.put("searchItem", searchItem);
		map.put("searchKeyword", searchKeyword);
		map.put("endEvent", endEvent);
		System.out.println(endEvent);
		System.out.println("서비스의 맵이 다 처리 되었나 ? 셀렉원1map : "+map);
		return admindao.AdminListSelectOne1(map);
	}

	public ArrayList<AdminListVO> AdminListSelectOne2(String searchItem, String searchKeyword) {
		HashMap<String, String> map = new HashMap<>();
		map.put("searchItem", searchItem);
		map.put("searchKeyword", searchKeyword);
		System.out.println("서비스의 맵이 다 처리 되었나 ? 셀렉원2map : "+map);
		return admindao.AdminListSelectOne2(map);
	}

	public ListVO RecoveryRead(ListVO vo) {
		ListVO listvo = admindao.RecoveryRead(vo);
		return listvo;
	}

	public void AdminDeleteList(ListVO vo1) {
		admindao.AdminDeleteList(vo1);
	}

	public BoardVO RecoveryReadBul(BoardVO vo) {
		BoardVO listvo = admindao.RecoveryReadBul(vo);
		return listvo;
	}

	public void AdminDeleteBul(BoardVO vo1) {
		admindao.AdminDeleteBul(vo1);
	}

}
