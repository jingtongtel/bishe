package com.boco.human.v01.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.boco.human.v01.model.User;

@Repository
public interface ManagementMapper {

	

	public List<Map> querylogin(User cityInfo);

	public List<Map> register(User cityInfo);

}
