package world.festival.service;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.swing.plaf.synth.SynthSpinnerUI;

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
		/*if(!uploadFileName.isEmpty()){
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
<<<<<<< HEAD
=======
		return true;*/
		
		
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
>>>>>>> d31b45e75883f7dc6a29c929e35a11af33ad1612
		return true;
		
/*		String path = "C:/test/";
		String fileName="";
		File dir = new File(path);
		if(!dir.isDirectory()){
			dir.mkdir();
		}
		Iterator<String> files = request.getFileNames();
		MultipartFile mpf = request.getFile(files.next());
		System.out.println("files "+files);
		System.out.println("mpf  "+mpf);
		if(mpf==null||mpf.getSize()<=0){
			System.out.println("파일용량xxx" );
			return false;
		}
		List<MultipartFile>fileList = request.getFiles("file");
		System.out.println("fileList  "+fileList);
		for(MultipartFile filePart:fileList){
			fileName = filePart.getOriginalFilename();
			System.out.println("실제파일 이름 " + fileName );
			long fileSize = filePart.getSize();
			System.out.println("파일사이즈 : "+fileSize);
		if(!fileName.equals("")){
			try {
				FileOutputStream fs = new FileOutputStream(path+fileName);
				fs.write(filePart.getBytes());
				fs.close();
			} 
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		}
		int result = dao.writeFestival(vo);
		if(result != 1){return false;}
		System.out.println("등록 결과 값: "+result);
		return true;*/
		
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
