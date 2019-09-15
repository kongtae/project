package world.festival.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import world.festival.VO.UserVO;
import world.festival.dao.UserDAO;

@Service
public class UserService {

	@Autowired
	private UserDAO dao;

	public Boolean updateMember(UserVO vo, MultipartFile uploadFile) {
		String oldSavedFilename = vo.getSavedFileName();	//원래 저장파일 변수에다가 저장된 파일명을 담아둔다.
		//수정내용에 첨부파일이 등록되어 있을 경우
		if(!uploadFile.isEmpty()){
			//vo객체에 새로운 첨부파일명을 set
			vo.setOriginalFileName(uploadFile.getOriginalFilename());
			//vo객체에 새롭게 서버에 저장돌 파일명을 set
			vo.setSavedFileName(UUID.randomUUID().toString());

			File file = new File("/Users⁩/⁨mac/⁨Desktop/" + oldSavedFilename);

			try {
				System.out.println();
				uploadFile.transferTo(new File("/Users⁩/⁨mac/⁨Desktop/" + vo.getSavedFileName()));	
				//업로드파일에 트랜스퍼투라는 메소드를 호출해서 서버에 저장을 한다. 인자값으로는 파일객체를 전달하는데 파일 객체는 
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
				System.out.println("에러");
			}
			//update querry 가 실패했을 경우
			if(dao.updateMember(vo) != 1) { 
				file.delete();
				return false;
			}
			//update querry가 성공할 경우
			File oldFile = new File("/Users⁩/⁨mac/⁨Desktop/" + oldSavedFilename);
			//수정전 게시글에 첨부파일이 존재할 경우 삭제
			if(oldFile.exists()) oldFile.delete();
			return true;
		}
		//수정내용에 첨부파일이 등록되어 있지 않은 경우
		if(dao.updateMember(vo) != 1) return false;
		return true;
	}

}
