package com.boco.human.v01.service;

import java.util.List;
import java.util.Map;



import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boco.human.v01.mapper.AttendanceMapper;


@Service
@Transactional
public class AttendanceService {
	
	@Resource
	private AttendanceMapper attendanceMapper;


	public List<Map> queryAll() {
		// TODO Auto-generated method stub
		return attendanceMapper.queryAll();
	}
	
	public List<Map> insertAttendance(Map cityInfo) {
		// TODO Auto-generated method stub
		return attendanceMapper.insertAttendance(cityInfo);
	}

	public List<Map> deleteAttendance(Map cityInfo) {
		// TODO Auto-generated method stub
		
		return attendanceMapper.deleteAttendance(cityInfo);
	}

	public List<Map> updateAttendance(Map cityInfo) {
		// TODO Auto-generated method stub
		return attendanceMapper.updateAttendance(cityInfo);
	}

	public List<Map> AttendanceById(Map cityInfo) {
		// TODO Auto-generated method stub
		return attendanceMapper.AttendanceById(cityInfo);
	}

	public Map queryByBanji(Map paraMap) {
		// TODO Auto-generated method stub
		return attendanceMapper.queryByBanji(paraMap);
	}

	public List<Map> queryBanjiAll(Map paraMap) {
		// TODO Auto-generated method stub
		return attendanceMapper.queryBanjiAll(paraMap);
	}

	public List<Map> queryBanjiAllOrder(Map paraMap) {
		// TODO Auto-generated method stub
		return attendanceMapper.queryBanjiAllOrder(paraMap);
	}

}
