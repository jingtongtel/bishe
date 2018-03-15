package com.boco.human.v01.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.boco.human.v01.mapper.ManagementMapper;
import com.boco.human.v01.model.User;

@Service
@Transactional
public class ManagementService {
	
	@Resource
	private ManagementMapper managementMapper;

	

	public List<Map> login(User cityInfo) {
		// TODO Auto-generated method stub
		
		return managementMapper.querylogin(cityInfo);
	}



	public List<Map> register(User cityInfo) {
		// TODO Auto-generated method stub
		return managementMapper.register(cityInfo);
	}

}
