package com.boco.mbd.common;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

/**
 * 动态多数据源工厂类
 * @author liangpeng
 * @date 2017-02-07
 */
public class DynamicDataSource extends AbstractRoutingDataSource {
	
	public static final String DS_1 = "ds_1";
	public static final String DS_2 = "ds_2";
	
	private static Logger logger = LoggerFactory
			.getLogger(DynamicDataSource.class);
	private static final ThreadLocal<String> contextHolder = new ThreadLocal<String>();

	@Override
	protected Object determineCurrentLookupKey() {
		return contextHolder.get();
	}

	public static void setDataSourceKey(String dataSourceKey) {
		contextHolder.set(dataSourceKey);
	}

	public static String getDataSourceKey() {
		String key = contextHolder.get();
		logger.info("Thread:" + Thread.currentThread().getName()
				+ "dataSource key is " + key);
		return key;
	}

	public static void clearDataSourceKey() {
		contextHolder.remove();
	}
}
