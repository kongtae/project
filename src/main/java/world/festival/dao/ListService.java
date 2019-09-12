package world.festival.dao;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import world.festival.VO.ListVO;

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
		System.out.println("서비스에서의 리절트값"+result);
		return true;
	}
	
}
