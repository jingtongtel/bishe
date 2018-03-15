package com.boco.human.v01.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boco.human.v01.service.AttendanceService;
import com.boco.human.v01.service.GradeService;

@Controller
@RequestMapping("/Attendance")
public class AttendanceController extends BaseController{
	
	@Autowired
	private AttendanceService attendancervice;
	
	@RequestMapping("/queryAll.do")
	public @ResponseBody Object queryAll(  HttpSession session) {
		List<Map> map = (List<Map>) attendancervice.queryAll();
		System.out.println(map);
		return map;
		
	}
	@RequestMapping("/insert.do")
	public @ResponseBody Object insertGrade(@RequestBody(required = false) Map cityInfo, HttpSession session) {
	
		List<Map> map = (List<Map>) attendancervice.insertAttendance(cityInfo);
		System.out.println(map);
		
		
		return 1;
		
	}
	
	@RequestMapping("/delete.do")
	public @ResponseBody Object deleteGrade(@RequestBody(required = false) Map cityInfo, HttpSession session) {
		List<Map> map = (List<Map>) attendancervice.deleteAttendance(cityInfo);
		
		
		if (map.size()==1) {
			return "1";
		}
		return map;
		
	}
	
	@RequestMapping("/update.do")
	public @ResponseBody Object update(@RequestBody(required = false) Map cityInfo, HttpSession session) {
		System.out.println(cityInfo);
		List<Map> map = (List<Map>) attendancervice.updateAttendance(cityInfo);
		
		
		if (map.size()==1) {
			return "1";
		}
		return map;
		
	}
	
	@RequestMapping("/zhexian.do")
	public @ResponseBody Object leida(@RequestBody(required = false) Map cityInfo, HttpSession session) {
		System.out.println(cityInfo+"4");
		List<Map> map = (List<Map>) attendancervice.AttendanceById(cityInfo);
		
		Map itemMap = new HashMap();
		
		itemMap.put("grade", map);
		return itemMap;
		
	}
	
	@RequestMapping("/statistics.do")
	public @ResponseBody Object travelCorridor(@RequestBody(required = false) Map<String, Map<String, ?>> paraMap,
			@Value("#{rsconfig['Attendance.attendance.banji']}") String metricName) {
		System.out.println(paraMap+metricName);
		return this.doHandle(paraMap, metricName);
	}

}
