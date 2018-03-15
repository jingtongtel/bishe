package com.boco.human.v01.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boco.human.v01.mapper.GradeMapper;
import com.boco.human.v01.mapper.MigrateMapper;

@Service
@Transactional
public class MigrateService {
	
	@Resource
	private MigrateMapper migrateMapper;

	public List<Map> queryStuNum(Map stuSum) {
		// TODO Auto-generated method stub
		return migrateMapper.queryStuNum(stuSum);
	}

}
