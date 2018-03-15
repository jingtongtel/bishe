package com.boco.human.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 时间工具类
 * @author 张晨
 *
 */
public  class DateUtil {
	/**
	 * 时期转换工具方法，将字符串代表的日期值 转换成为目标格式的日期值字符串</br>
	 * DateUtil.parseFormat("2017-01-21 14:32:59", "yyyy-MM-dd HH:mm:ss", "yyMMdd HH:mm:ss"));
	 * </br>
	 * 结果：170121 14:32:59
	 * @param timeStr 原时间字符串
	 * @param fromFormat 原时间格式
	 * @param toFormat 目标格式
	 * @return 使用目标格式表示的时间字符串
	 * @throws ParseException
	 */
	public static String parseFormat(String timeStr,String fromFormat,String toFormat) throws ParseException{
		SimpleDateFormat informat = new SimpleDateFormat(fromFormat);
		Date date = informat.parse(timeStr);
		return new SimpleDateFormat(toFormat).format(date);
	}
	
	
	/**
	 * 根据传入的时间字符串及格式，给出时间点所在的季度数值
	 * @param timeStr 时间数值字符串
	 * @param format 时间格式
	 * @return 所在季度 1、2、3、4
	 * @throws ParseException
	 */
	public static int getQuarter(String timeStr,String format) throws ParseException{
		SimpleDateFormat informat = new SimpleDateFormat(format);
		Date date = informat.parse(timeStr);
		int mon = date.getMonth()+1;
		if(mon<=3){
			return 1;
		}
		if(mon<=6){
			return 2;
		}
		if(mon<=9){
			return 3;
		}
		if(mon<=12){
			return 4;
		}
		return 1;
		//return new SimpleDateFormat(toFormat).format(date);
	}
	
	public static void main(String args[]){
		try {
			System.out.println(DateUtil.parseFormat("2017-01-21 14:32:59", "yyyy-MM-dd HH:mm:ss", "yyMMdd HH:mm:ss"));
			System.out.println(DateUtil.parseFormat("2017-01-21 14:32:59", "yyyy-MM-dd HH:mm:ss", "yyMMdd HH:mm:ss"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
