package com.boco.human.v01.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boco.human.v01.model.User;
import com.boco.human.v01.service.GradeService;
import com.boco.human.v01.service.ManagementService;

@Controller
@RequestMapping("/Grade")
public class GradeController extends BaseController {

	
	@Autowired
	private GradeService gradeservice;
	
	@RequestMapping("/grade.do")
	public @ResponseBody Object codeRegionLevel(  HttpSession session) {
		List<Map> map = (List<Map>) gradeservice.queryGrade();
		System.out.println(map);
		
		if (map.size()==1) {
			return "1";
		}
		return map;
		
	}
	
	@RequestMapping("/insert.do")
	public @ResponseBody Object insertGrade(@RequestBody(required = false) Map cityInfo, HttpSession session) {
		System.out.println(cityInfo+"2");
		List<Map> map = (List<Map>) gradeservice.insertGrade(cityInfo);
		System.out.println(map);
		
		if (map.size()==1) {
			return "1";
		}
		return map;
		
	}
	
	@RequestMapping("/delete.do")
	public @ResponseBody Object deleteGrade(@RequestBody(required = false) Map cityInfo, HttpSession session) {
		System.out.println(cityInfo+"3");
		List<Map> map = (List<Map>) gradeservice.deleteGrade(cityInfo);
		
		
		if (map.size()==1) {
			return "1";
		}
		return map;
		
	}
	
	@RequestMapping("/update.do")
	public @ResponseBody Object update(@RequestBody(required = false) Map cityInfo, HttpSession session) {
		System.out.println(cityInfo+"4");
		List<Map> map = (List<Map>) gradeservice.updateGrade(cityInfo);
		
		
		if (map.size()==1) {
			return "1";
		}
		return map;
		
	}
	
	@RequestMapping("/leida.do")
	public @ResponseBody Object leida(@RequestBody(required = false) Map cityInfo, HttpSession session) {
		System.out.println(cityInfo+"4");
		List<Map> map = (List<Map>) gradeservice.queryGradeById(cityInfo);
		List<Map> avgmap = (List<Map>) gradeservice.queryAvgGrade(cityInfo);
		Map itemMap = new HashMap();
		itemMap.put("avggrade", avgmap);
		itemMap.put("grade", map);
		return itemMap;
		
	}
	
	@RequestMapping("/statistics.do")
	public @ResponseBody Object travelCorridor(@RequestBody(required = false) Map<String, Map<String, ?>> paraMap,
			@Value("#{rsconfig['Grade.statistics.banji']}") String metricName) {
		System.out.println(paraMap+metricName);
		return this.doHandle(paraMap, metricName);
	}





}
