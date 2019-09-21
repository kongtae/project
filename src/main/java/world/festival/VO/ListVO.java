package world.festival.VO;

import java.sql.Date;
import java.util.HashMap;

import lombok.Data;

@Data
public class ListVO {
	
	private String adminid;
	private String mainBoardNum;
	private String userid;
	private String title;
	private String country;
	private String adress;
	private String festival_intro;
	private String surround_place;
	private Date inputTime;
	private Date startEvent;
	private Date endEvent;
	private String originalFileName;  // originalFileName;
	private String saveFileName;
	private HashMap<String,String> hashmapList;
}
