package world.festival.VO;

import java.sql.Date;

import lombok.Data;

@Data
public class AdminBoardVO {
	
	private String adminid;
	private int admin_mainBoardNum;
	private int bul_boardnum;
	private String userid;
	private String title;
	private String contents;
	private String country;
	private String surround_place;
	private String adress;
	private Date inputdate;
	private int hit;
	private String originalFileName;  // originalFileName;
	private String savedFileName;
	private String datacheck;
	
}
