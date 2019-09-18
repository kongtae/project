package world.festival.controller;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import world.festival.VO.ListVO;
import world.festival.dao.CalendarDAO;

@Controller
public class CalendarController {
	
	@Autowired
	private CalendarDAO dao;

	@RequestMapping(value = "/calendar", method = RequestMethod.GET)
	public String calendar() {

		return "calendar/calendar";
	}

	@RequestMapping(value = "/selectCalendar", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<ListVO> selectCalendar() {
		ArrayList<ListVO> list = dao.selectCalendar();
		return list;
	}

}
