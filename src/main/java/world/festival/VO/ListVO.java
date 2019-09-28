package world.festival.VO;

import java.sql.Date;

import lombok.Data;

@Data	
public class ListVO {
	
	private String adminid;
	private int mainBoardNum;
	private int admin_mainBoardNum;
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
	private String hashtag;
<<<<<<< HEAD
	private String datacheck;
=======
>>>>>>> 1748880f3c494f54a3c946f9c5036b94a937e0e1
}
