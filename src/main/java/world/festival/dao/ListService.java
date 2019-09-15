package world.festival.dao;

import java.io.File;
import java.util.ArrayList;
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

			vo.setUploadFileName(originalFilename);
			vo.setSaveFileName(savedFilename);

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
	//댓글 달기
//	public boolean replywrite(ReplyVO vo) {
//		int result = dao.replywrite(vo);
//		if(result!=1){return false;}
//		return true;
//	}
	
	//댓글 출력
	public ArrayList<ReplyVO> replyList(int boardnum) {
		return dao.replyList(boardnum);
	}
	
}
