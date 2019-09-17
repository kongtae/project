package world.festival.VO;

import lombok.Data;

@Data
public class ReplyVO {
	
	private int replynum;
	private int mainboardnum;
	private String userid;
	private String replytext;
	private String inputdate;
	private String originalFileName;  // originalFileName;
	private String saveFileName;
	
}
