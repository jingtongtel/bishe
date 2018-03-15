package com.boco.human.v01.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boco.human.v01.service.MigrateService;




@Controller
@RequestMapping("/migrate")
public class MigrateController {
	
	    @Autowired
		private MigrateService migrateService;//自动注入业务逻辑层service

		/**
		 * 查询全量qianxi信息
		 * @param request
		 * @param response
		 * @return 全量qianxi数据
		 */
	   
		@RequestMapping("queryAllqianxi.do")
		public @ResponseBody void queryAllqianxi(HttpServletRequest request,
				HttpServletResponse response) {
			response.setHeader("Access-Control-Allow-Origin", "*");

			
		
			
			//List<Migrate> migrateList = migrateService.queryAll();


			return ;
			//return retMap;
		}

		
		@SuppressWarnings({ "rawtypes", "unchecked" })
		@RequestMapping("queryAllVallue.do")
		public @ResponseBody HashMap queryAllVallue(@RequestBody(required = false) Map stuSum,HttpServletRequest request,
				HttpServletResponse response) {
			response.setHeader("Access-Control-Allow-Origin", "*");
			HashMap retMap = new HashMap<String, String>();

			//接收客户端传入的参数
			

			//构造查询参数map
			//HashMap paramap = new HashMap<String, String>();
			//paramap.put("cityParName", cityInfo.getCityCheck());
			
			//调用service层方法
			
			List<Map> migrateValuueList = (List<Map>) migrateService.queryStuNum(stuSum);
			


			//自定义返回结果结构
			retMap.put("data", migrateValuueList);
			

			//return JSON.toJSONString(retMap);
			return retMap;
		}
	
}
