package world.festival.controller;


import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.cxf.helpers.IOUtils;
import org.apache.ibatis.jdbc.SQL;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import world.festival.VO.ListVO;
import world.festival.dao.CalendarDAO;
import world.festival.dao.tourAPIDAO;

@Controller
public class tourAPIController {
	
	@Autowired
	private tourAPIDAO dao;
	
	int mainBoardNum;
	
	@RequestMapping(value = "/tourAPI", method = RequestMethod.GET)
	public String tourAPI() {
		return "tourAPI/tourAPI1";
	}

	@RequestMapping(value = "/tourAPIselect", method = RequestMethod.GET)
	public void tourAPIselect(HttpServletRequest request, HttpServletResponse response, String startEvent, String endEvent) throws ServletException, IOException{
		String[] sa = startEvent.split("-");
		String start = sa[0] + sa[1] + sa[2];
		String[] ea = endEvent.split("-");
		String end = ea[0] + ea[1] + ea[2];
		System.out.println("start : "+start);
		System.out.println("end : "+end);
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/JpnService/searchFestival?ServiceKey=";
		String serviceKey = "wjn%2Fnwpg1YkdtXVp0wSFtiNqGn1WCDSVejgj1yp8geKpVbn4UJNJAx392w7bdIPmE9RSJBxl97WAp0fTN7182w%3D%3D";
		String parameter = "";
		//				serviceKey = URLEncoder.encode(serviceKey,"utf-8");
		PrintWriter out = response.getWriter();
		//				parameter = parameter + "&" + "areaCode=1";
		parameter = parameter + "&" + "eventStartDate="+start;
		parameter = parameter + "&" + "eventEndDate="+end;
		parameter = parameter + "&" + "pageNo=1&numOfRows=1000";
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=aa";
		parameter = parameter + "&" + "_type=json";
		
		
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		
		System.out.println(addr);
		
		//				BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
		
		InputStream in = url.openStream(); 
		//				CachedOutputStream bos = new CachedOutputStream();
		ByteArrayOutputStream  bos1 = new ByteArrayOutputStream();
		IOUtils.copy(in, bos1);
		in.close();
		bos1.close();
		
		String mbos = bos1.toString("UTF-8");
		System.out.println("mbos: "+mbos);
		
		byte[] b = mbos.getBytes("UTF-8");
		String s = new String(b, "UTF-8");
		out.println(s);
		
		JSONObject json = new JSONObject();
		json.put("data", s);
		//json.put("data", data);
		System.out.println("json: "+json);
	}
	
	@RequestMapping(value = "/mainBoardNumSelect", method = RequestMethod.POST)
	@ResponseBody
	public int mainBoardNumSelect() {		
		int result = dao.mainBoardNumSelect();
		System.out.println("result : "+result);
		mainBoardNum = result+1;
		return result;
	}

	@RequestMapping(value = "/tourAPIinsert", method = RequestMethod.POST)
	@ResponseBody
	public int tourAPIinsert(@RequestBody ArrayList<ListVO> list) {
		System.out.println("mainBoardNum : "+mainBoardNum);
		
		for (ListVO vo : list) {
			vo.setMainBoardNum(mainBoardNum);
			mainBoardNum++;
			vo.setCountry("大韓民国");
			vo.setFestival_intro(vo.getTitle());
		}
		int result = dao.tourAPIinsert(list);
		return result;
	}

}
