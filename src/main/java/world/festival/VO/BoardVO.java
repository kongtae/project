package world.festival.VO;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	   private String adminid;
	   private String bul_boardnum;
	   private String userid;
	   private String title;
	   private String contents;
	   private String country;
	   private String adress;
	   private Date inputTime;
	   private int hit;
	   private String originalFileName;  // originalFileName;
	   private String saveFileName;
	
}
