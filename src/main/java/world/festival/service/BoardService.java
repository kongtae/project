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

import world.festival.VO.BoardVO;
import world.festival.VO.ListVO;
import world.festival.VO.ReplyVO;
import world.festival.dao.BoardDAO;
import world.festival.dao.ListDAO;
import world.festival.dao.ReplyMapper;

@Service
public class BoardService {

	@Autowired
	private BoardDAO dao;

	public boolean BoardWrite(BoardVO vo, MultipartHttpServletRequest request) {
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
			vo.setSavedFileName(savedFilename);
			vo.setOriginalFileName(fileName);
		}
		int result = dao.BoardWrite(vo);
		if(result != 1){return false;}
		System.out.println("등록 결과 값: "+result);

		return true;


	}

	public ArrayList<ReplyVO> replyList(int mainboardnum) {
		return dao.replyList(mainboardnum);
	}
	


}
