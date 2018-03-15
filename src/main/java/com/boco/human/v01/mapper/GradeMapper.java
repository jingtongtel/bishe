package com.boco.human.v01.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.boco.human.v01.model.User;
@Repository
public interface GradeMapper {

	public List<Map> queryGrade();

	

	public List<Map> insertGrade(Map cityInfo);




	public List<Map> deleteGrade(Map cityInfo);



	public List<Map> updateGrade(Map cityInfo);



	public List<Map> queryGradeById(Map cityInfo);



	public List<Map> queryAvgGrade(Map cityInfo);



	public Map queryByBanji(Map cityInfo);



	public List<Map> queryAll(Map paraMap);

	
}
