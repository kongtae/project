package world.festival.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import world.festival.VO.AdminListVO;
import world.festival.VO.ListVO;
import world.festival.VO.UserVO;
import world.festival.VO.WishVO;
import world.festival.dao.AdminDAO;
import world.festival.dao.UserDAO;

@Service
public class AdminService {

	@Autowired
	private AdminDAO admindao;

//	public Boolean updateMember(UserVO vo, MultipartFile uploadFile) {
//		String oldSavedFilename = vo.getSavedFileName();	//�썝�옒 ���옣�뙆�씪 蹂��닔�뿉�떎媛� ���옣�맂 �뙆�씪紐낆쓣 �떞�븘�몦�떎.
//		//�닔�젙�궡�슜�뿉 泥⑤��뙆�씪�씠 �벑濡앸릺�뼱 �엳�쓣 寃쎌슦
//		if(!uploadFile.isEmpty()){
//			//vo媛앹껜�뿉 �깉濡쒖슫 泥⑤��뙆�씪紐낆쓣 set
//			vo.setOriginalFileName(uploadFile.getOriginalFilename());
//			//vo媛앹껜�뿉 �깉濡�寃� �꽌踰꾩뿉 ���옣�룎 �뙆�씪紐낆쓣 set
//			vo.setSavedFileName(UUID.randomUUID().toString());
//			
//			//성민 경로
////			C:/Users///uAE40/uC131/uBBFC//git//project/src/main/webapp/resources/images/userimage/
////			C\:\\Users\\\uAE40\uC131\uBBFC\\git\\project
////			새암이형 경로
////			File file = new File("C:/Users/kita/Desktop/conduct/gitfolder/gitworkspace/project/src/main/webapp/resources/images/userimage/" + oldSavedFilename);
////			성민 경로
//			File file = new File("C:/Users/김성민/git/project/src/main/webapp/resources/images/userimage/"+oldSavedFilename);
//			try {
////				새암이형 경로
////				uploadFile.transferTo(new File("C:/Users/kita/Desktop/conduct/gitfolder/gitworkspace/project/src/main/webapp/resources/images/userimage/" + vo.getOriginalFileName()));
//				uploadFile.transferTo(new File("C:/Users/김성민/git/project/src/main/webapp/resources/images/userimage/"+vo.getOriginalFileName()));
//				//�뾽濡쒕뱶�뙆�씪�뿉 �듃�옖�뒪�띁�닾�씪�뒗 硫붿냼�뱶瑜� �샇異쒗빐�꽌 �꽌踰꾩뿉 ���옣�쓣 �븳�떎. �씤�옄媛믪쑝濡쒕뒗 �뙆�씪媛앹껜瑜� �쟾�떖�븯�뒗�뜲 �뙆�씪 媛앹껜�뒗 
//			} catch (IllegalStateException | IOException e) {
//				e.printStackTrace();
//			}
//			//update querry 媛� �떎�뙣�뻽�쓣 寃쎌슦
//			if(dao.updateMember(vo) != 1) { 
//				file.delete();
//				return false;
//			}
//			//update querry媛� �꽦怨듯븷 寃쎌슦
//			//새암이형 경로
////			File oldFile = new File("C:/Users/kita/Desktop/conduct/gitfolder/gitworkspace/project/src/main/webapp/resources/images/userimage/" + oldSavedFilename);
//			File oldFile = new File("C:/Users/김성민/git/project/src/main/webapp/resources/images/userimage/"+oldSavedFilename);
//			//�닔�젙�쟾 寃뚯떆湲��뿉 泥⑤��뙆�씪�씠 議댁옱�븷 寃쎌슦 �궘�젣
//			if(oldFile.exists()) oldFile.delete();
//			return true;
//		}
//		//�닔�젙�궡�슜�뿉 泥⑤��뙆�씪�씠 �벑濡앸릺�뼱 �엳吏� �븡�� 寃쎌슦
//		if(dao.updateMember(vo) != 1) return false;
//		return true;
//	}
//	
//	public Boolean updateReply(UserVO vo, MultipartFile uploadFile) {
//		String oldSavedFilename = vo.getSavedFileName();	//�썝�옒 ���옣�뙆�씪 蹂��닔�뿉�떎媛� ���옣�맂 �뙆�씪紐낆쓣 �떞�븘�몦�떎.
//		//�닔�젙�궡�슜�뿉 泥⑤��뙆�씪�씠 �벑濡앸릺�뼱 �엳�쓣 寃쎌슦
//		if(!uploadFile.isEmpty()){
//			//vo媛앹껜�뿉 �깉濡쒖슫 泥⑤��뙆�씪紐낆쓣 set
//			vo.setOriginalFileName(uploadFile.getOriginalFilename());
//			//vo媛앹껜�뿉 �깉濡�寃� �꽌踰꾩뿉 ���옣�룎 �뙆�씪紐낆쓣 set
//			vo.setSavedFileName(UUID.randomUUID().toString());
//			
//			//성민 경로
////			C:/Users///uAE40/uC131/uBBFC//git//project/src/main/webapp/resources/images/userimage/
////			C\:\\Users\\\uAE40\uC131\uBBFC\\git\\project
////			새암이형 경로
////			File file = new File("C:/Users/kita/Desktop/conduct/gitfolder/gitworkspace/project/src/main/webapp/resources/images/userimage/" + oldSavedFilename);
////			성민 경로
//			File file = new File("C:/Users/김성민/git/project/src/main/webapp/resources/images/userimage/"+oldSavedFilename);
//			try {
////				새암이형 경로
////				uploadFile.transferTo(new File("C:/Users/kita/Desktop/conduct/gitfolder/gitworkspace/project/src/main/webapp/resources/images/userimage/" + vo.getOriginalFileName()));
//				uploadFile.transferTo(new File("C:/Users/김성민/git/project/src/main/webapp/resources/images/userimage/"+vo.getOriginalFileName()));
//				//�뾽濡쒕뱶�뙆�씪�뿉 �듃�옖�뒪�띁�닾�씪�뒗 硫붿냼�뱶瑜� �샇異쒗빐�꽌 �꽌踰꾩뿉 ���옣�쓣 �븳�떎. �씤�옄媛믪쑝濡쒕뒗 �뙆�씪媛앹껜瑜� �쟾�떖�븯�뒗�뜲 �뙆�씪 媛앹껜�뒗 
//			} catch (IllegalStateException | IOException e) {
//				e.printStackTrace();
//			}
//			//update querry 媛� �떎�뙣�뻽�쓣 寃쎌슦
//			if(dao.updateReply(vo) != 1) { 
//				file.delete();
//				return false;
//			}
//			//update querry媛� �꽦怨듯븷 寃쎌슦
//			//새암이형 경로
////			File oldFile = new File("C:/Users/kita/Desktop/conduct/gitfolder/gitworkspace/project/src/main/webapp/resources/images/userimage/" + oldSavedFilename);
//			File oldFile = new File("C:/Users/김성민/git/project/src/main/webapp/resources/images/userimage/"+oldSavedFilename);
//			//�닔�젙�쟾 寃뚯떆湲��뿉 泥⑤��뙆�씪�씠 議댁옱�븷 寃쎌슦 �궘�젣
//			if(oldFile.exists()) oldFile.delete();
//			return true;
//		}
//		//�닔�젙�궡�슜�뿉 泥⑤��뙆�씪�씠 �벑濡앸릺�뼱 �엳吏� �븡�� 寃쎌슦
//		if(dao.updateReply(vo) != 1) return false;
//		return true;
//	}
//
//	public UserVO selectpot(String loginid) {
//		UserVO pot= dao.selectpot(loginid);
//		return pot;
//	}
//
//	public ArrayList<WishVO> selectwish(String userid) {
//		ArrayList<WishVO> wvo= dao.selectwish(userid);
//		return wvo;
//	}
//
//	public ArrayList<ListVO> selectlist(String userid) {
//		ArrayList<ListVO> lvo= dao.selectlist(userid);
//		return lvo;
//	}
//
//	public ArrayList<ListVO> selectlistAll(String userid) {
//		ArrayList<ListVO> listall= dao.selectlistAll(userid);
//		return listall;
//	}

	public boolean AdminwriteFestival(AdminListVO adminvo, MultipartHttpServletRequest request) {
//		String path = "C:/Users/kita/Desktop/conduct/gitfolder/gitworkspace/project/src/main/webapp/resources/images/userimage/";
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

//	public ListVO selectlistAll(ListVO listvo, ArrayList<WishVO> wvo) {
//		ArrayList<ListVO> listall= dao.selectlist(userid);
//		return listall;
//	}




}
