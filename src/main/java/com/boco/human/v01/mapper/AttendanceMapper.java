package com.boco.human.v01.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;


@Repository
public interface AttendanceMapper {

	public List<Map> queryAll();
	
	public List<Map> insertAttendance(Map cityInfo);



	public List<Map> deleteAttendance(Map cityInfo);



	public List<Map> updateAttendance(Map cityInfo);

	public List<Map> AttendanceById(Map cityInfo);

	public Map queryByBanji(Map paraMap);

	public List<Map> queryBanjiAll(Map paraMap);

	public List<Map> queryBanjiAllOrder(Map paraMap);


}
