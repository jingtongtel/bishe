package com.boco.human.v01.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boco.human.v01.model.User;
import com.boco.human.v01.service.ManagementService;

@Controller
@RequestMapping("/management")
public class ManagementControler {
	
	@Autowired
	private ManagementService managemenservice;
	
	@RequestMapping("/index.do")
	public @ResponseBody Object codeRegionLevel( User cityInfo, HttpSession session) {
		System.out.println(cityInfo+"asdasd");
		User name = new User();
		List<Map> map = (List<Map>) managemenservice.login(cityInfo);
		System.out.println(map);
		session.setAttribute("login_user", map);
		if (map.size()==1) {
			return "1";
		}
		return "0";
		
	}
	

	@RequestMapping("/register.do")
	public @ResponseBody Object register( User cityInfo, HttpSession session) {
		System.out.println(cityInfo+"asdasd");
		User name = new User();
		List<Map> map = (List<Map>) managemenservice.register(cityInfo);
		System.out.println(map);
		session.setAttribute("login_user", map);
		if (map.size()==1) {
			return "1";
		}
		return "0";
		
	}

}
