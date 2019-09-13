package world.festival.VO;

import java.sql.Date;

import lombok.Data;

@Data
public class SearchVO {
	
	private String searchItem;
	private String searchKeyword;
	private Date startEvent;
	private Date endEvent;
	
}
