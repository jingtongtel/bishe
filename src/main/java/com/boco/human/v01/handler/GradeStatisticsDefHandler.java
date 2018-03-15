package com.boco.human.v01.handler;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.boco.human.v01.service.GradeService;

@Component
public class GradeStatisticsDefHandler  extends AbstractViewHandler {
	@Autowired
	private GradeService gradeservice;


	@Value("#{rsconfig['Grade.statistics.banji']}")
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
		System.out.println(paraMap);
		Map tongji=(Map) gradeservice.queryByBanji(paraMap);
		List<Map> allValue=(List<Map>) gradeservice.queryAll(paraMap);
		Map finalMap = new HashMap();
		finalMap.put("failed", tongji.get("failed"));
		finalMap.put("good", tongji.get("good"));
		finalMap.put("excellent", tongji.get("excellent"));
		finalMap.put("allValue", allValue);
		String i=(String) paraMap.get("banji");
		int o=Integer.parseInt(i);
		Object nSum  = allValue.get(o).get("pingjun");
		Object maxSum  = allValue.get(0).get("pingjun");
		System.out.println(nSum+"     "+maxSum);
		int max=Integer.parseInt(maxSum.toString());//获得userSum之一列中的最大值
		int n=Integer.parseInt(nSum.toString());//获得选择的sum值
		double entropy=(double)n/max;//综合指数
		DecimalFormat    df   = new DecimalFormat("######0.00");   
		//生成range每一组的上限和下限
		finalMap.put("Integrated", df.format(entropy));
		System.out.println(gradeservice.queryByBanji(paraMap));
		return finalMap;
	}
	}
