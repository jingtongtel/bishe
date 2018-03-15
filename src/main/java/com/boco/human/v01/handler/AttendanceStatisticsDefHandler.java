package com.boco.human.v01.handler;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ws.rs.PUT;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.boco.human.v01.service.AttendanceService;
import com.boco.human.v01.service.GradeService;


@Component
public class AttendanceStatisticsDefHandler extends AbstractViewHandler {
	@Autowired
	private AttendanceService  attendanceservice;


	@Value("#{rsconfig['Attendance.attendance.banji']}")
	private String metricName;
	
	@Override
	protected String getMetricName() {
		
		return this.metricName;
	}

	@Override
	protected String getDataViewName() {
		// TODO Auto-generated method stub
		return DATAVIEW_DEF_NAME;
	}

	@Override
	protected Object formatData(Map paraMap) {
		// TODO Auto-generated method stub
		System.out.println("asdasdasd");
		Map tongji=(Map) attendanceservice.queryByBanji(paraMap);
		List<Map> allValue=(List<Map>) attendanceservice.queryBanjiAll(paraMap);
		List<Map> orderValue=(List<Map>) attendanceservice.queryBanjiAllOrder(paraMap);
		Map finalMap = new HashMap();
		
		finalMap.put("chidao", tongji.get("chidao"));
		finalMap.put("qingjia", tongji.get("qingjia"));
		finalMap.put("zaotui", tongji.get("zaotui"));
		finalMap.put("allValue", allValue);
		String i=(String) paraMap.get("banji");
		int o=Integer.parseInt(i);
		Object nSum  = allValue.get(o-1).get("zongjie");
		Object maxSum  = orderValue.get(0).get("zongjie");
		System.out.println(nSum+"   "+maxSum);
		int n=Integer.parseInt(nSum.toString());
		int max=Integer.parseInt(nSum.toString());
		
//		double n=(double) nSum;//获得userSum之一列中的最大值
//		double max=(double) maxSum;//获得选择的sum值
		double entropy=(double)n/max;//综合指数
		DecimalFormat    df   = new DecimalFormat("######0.00");   
		
		   
		finalMap.put("Integrated", df.format(entropy));
		return finalMap;
	}
	}
