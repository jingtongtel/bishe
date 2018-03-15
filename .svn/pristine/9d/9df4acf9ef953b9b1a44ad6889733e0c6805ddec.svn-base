package com.boco.mybatissupport.interceptor;

import java.sql.Statement;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import org.apache.ibatis.executor.resultset.ResultSetHandler;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;

//handleResultSets
/**
 * 用于将结果集中的下划线字段转换为小驼峰的类
 * @author boco
 *
 */
@Intercepts({ @Signature(type = ResultSetHandler.class, method = "handleResultSets", args = { Statement.class }) })
public class CamelResultSetInterceptor implements Interceptor {
		
	
	 /**
	  * 网上抄的，临时用一下，需要重构。
	 * @param target
	 * @return
	 */
	public static String toCamel(String target) {  
	        StringBuilder result = new StringBuilder();  
	        if (target != null && target.length() > 0) { 
	        	target = target.toLowerCase();
	            boolean flag = false;  
	            for (int i = 0; i < target.length(); i++) {  
	                char ch = target.charAt(i);  
	                if ("_".charAt(0) == ch) {  
	                    flag = true;  
	                } else {  
	                    if (flag) {  
	                        result.append(Character.toUpperCase(ch));  
	                        flag = false;  
	                    } else {  
	                        result.append(ch);  
	                    }  
	                }  
	            }  
	        }  
	        return result.toString();  
	    }  
	 
	 public static void main(String[] args) {
		String s = CamelResultSetInterceptor.toCamel("A_c");
		System.out.println(s);
	}

	@Override
	public Object intercept(Invocation invocation) throws Throwable {
		// TODO Auto-generated method stub
		Object obj = invocation.proceed();
		//System.err.println(invocation.getTarget().getClass()+" "+invocation.getMethod().getName()+" "+obj.getClass()+" "+obj);
		if(obj instanceof List && ((List) obj).size()>0){
			List<Map<String,Object>> list = (List)obj;
			if(! (list.get(0) instanceof Map)){
				return obj;
				
			}
			Map map = (Map)list.get(0);
			Set<String> keyset = map.keySet();
			
			Map<String,String> keyMap = new HashMap();
			for(String key :keyset){
				String camelKey = toCamel(key);
				if(!key.equals(camelKey)){
					keyMap.put(key,camelKey);
				}
			}
			
			for(Map<String,Object>rowMap:list){
				for(String oldKey : keyMap.keySet()){
					rowMap.put(keyMap.get(oldKey),rowMap.get(oldKey));
					rowMap.remove(oldKey);
				}
			}
		}
		//System.err.println(invocation.getTarget().getClass()+" "+invocation.getMethod().getName()+" "+obj.getClass()+" "+obj);
		return obj;
	}

	@Override
	public Object plugin(Object target) {
		// TODO Auto-generated method stub
		return Plugin.wrap(target, this);
	}

	@Override
	public void setProperties(Properties properties) {
		// TODO Auto-generated method stub

	}

}
