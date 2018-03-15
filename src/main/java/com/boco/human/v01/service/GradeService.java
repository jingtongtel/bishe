package com.boco.human.v01.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boco.human.v01.mapper.GradeMapper;
import com.boco.human.v01.mapper.ManagementMapper;
import com.boco.human.v01.model.User;
@Service
@Transactional
public class GradeService {
	
	@Resource
	private GradeMapper gradeMapper;

	public List<Map> queryGrade() {
		// TODO Auto-generated method stub
		
		return gradeMapper.queryGrade();
	}

	public List<Map> insertGrade(Map cityInfo) {
		// TODO Auto-generated method stub
		return gradeMapper.insertGrade(cityInfo);
	}

	public List<Map> deleteGrade(Map cityInfo) {
		// TODO Auto-generated method stub
		return gradeMapper.deleteGrade(cityInfo);
	}

	public List<Map> updateGrade(Map cityInfo) {
		// TODO Auto-generated method stub
		return gradeMapper.updateGrade(cityInfo);
	}

	public List<Map> queryGradeById(Map cityInfo) {
		// TODO Auto-generated method stub
		return gradeMapper.queryGradeById(cityInfo);
	}

	public List<Map> queryAvgGrade(Map cityInfo) {
		// TODO Auto-generated method stub
		return gradeMapper.queryAvgGrade(cityInfo);
	}

	public  Map queryByBanji(Map cityInfo) {
		// TODO Auto-generated method stub
		return gradeMapper.queryByBanji(cityInfo);
	}

	public List<Map> queryAll(Map paraMap) {
		// TODO Auto-generated method stub
		return gradeMapper.queryAll(paraMap);
	}
	

}
