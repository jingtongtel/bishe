package com.boco.human.v01.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.boco.human.v01.DataViewManager;
import com.boco.human.v01.RESTRequst;
import com.boco.human.v01.handler.ViewHandler;

/**
 * “字典”主题的controller类。
 * @author 侯捷西
 * 
 */

//RESTful
@RestController

//处理浏览器跨域访问
@CrossOrigin

@RequestMapping("/v01/code")
public class DicController extends BaseController {
	
	
	/**
	 * @param paraMap 封装了客户端请求Map,具体属性需要参考相关文档
	 * @return 序列化为JSON对象，返回给客户端
	 */
	/*@PostMapping("/code/kvcode")
	public Object codeKvcode(@RequestBody(required = false) Map<String, Map<String, ?>> paraMap,
			@Value("#{rsconfig['dic.code.kvcode']}") String metricName) {
		return this.doHandle(paraMap, metricName);
	}*/
	
	@PostMapping("/region/level")
	public Object codeRegionLevel(@RequestBody(required = false) Map<String, Map<String, ?>> paraMap,
			@Value("#{rsconfig['dic.code.region.level']}") String metricName) {
		return this.doHandle(paraMap, metricName);
	}
	
	
	/**
	 * 根据字典类型返回字典数据
	 * @param paraMap
	 * @param metricName
	 * @return
	 */
	@PostMapping("/dict/type")
	public Object dictionaryByType(@RequestBody(required = false) Map<String, Map<String, ?>> paraMap,
			@Value("#{rsconfig['code.dictionary.type']}") String metricName) {
		return this.doHandle(paraMap, metricName);
	}
	
	
	/**
	 * 根据数据字典的业务类型，即逻辑组名称返回字典数据
	 * @param paraMap
	 * @param metricName
	 * @return
	 */
	@PostMapping("/dict/busi")
	public Object dictionaryByBusi(@RequestBody(required = false) Map<String, Map<String, ?>> paraMap,
			@Value("#{rsconfig['code.dictionary.busi']}") String metricName) {
		return this.doHandle(paraMap, metricName);
	}
	

	
	

}
