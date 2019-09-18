package world.festival.VO;

import java.sql.Date;

import lombok.Data;

@Data
public class CalendarVO {
	
	private int	mainboardNum;
	private String title;
	private Date startEvent;
	private Date endEvent;
	
}
