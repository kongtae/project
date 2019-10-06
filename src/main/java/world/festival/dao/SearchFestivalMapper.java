package world.festival.dao;

import java.util.ArrayList;

import world.festival.VO.ListVO;
import world.festival.VO.SearchFestivalVO;

public interface SearchFestivalMapper {

	public Integer CheckSearch(String key);

	public ArrayList<ListVO> result();

	public Integer reset();

	public ArrayList<SearchFestivalVO> pushImage();

	public String keySearch(String key);

}
