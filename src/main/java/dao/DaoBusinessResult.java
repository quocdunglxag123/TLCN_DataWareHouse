package dao;

import java.util.List;

import dto.FactBusinessResultDto;
import model.FactBusinessResult;

public interface DaoBusinessResult {
	List<FactBusinessResultDto> getFactBusinessResultByPage(String page,String search);
	int getEndPageFactBusinessResult(String search);
	void deleteFactBusinessResult(String ids);
	FactBusinessResult getFactBusinessResultById(String id);
	void editFactBusinessResult(FactBusinessResult factBusinessResult);
	void addFactBusinessResult(FactBusinessResult factBusinessResult);
}
