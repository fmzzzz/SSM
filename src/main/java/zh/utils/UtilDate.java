package zh.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * @comment: 常用日期格式工具类
 * @author 傅里叶级数
 * @date 2018年5月27日上午10:31:31
 */
public class UtilDate {

	/**
	 * @comment:获取格式为:yyyy-MM-dd HH:mm:ss
	 * @author:傅里叶级数
	 * @date:2018年5月27日上午10:24:45
	 * @return
	 */
	public static String getYMdHms(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(new java.util.Date());
	}
	
	
	
	
	
	
	/**
	 * @comment:获取格式为:yyyy-MM-dd HH:mm:ss.SSS
	 * @author:傅里叶级数
	 * @date:2018年5月27日上午10:24:57
	 * @return
	 */
	public static String getYMdHmsS(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
		return sdf.format(new java.util.Date());
	}
	
	
	
	
	/**
	 * @comment:获取格式为:yyyy-MM-dd
	 * @author:傅里叶级数
	 * @date:2018年5月27日上午10:25:11
	 * @return
	 */
	public static String getYMd(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(new java.util.Date());
	}
	
	
	
	
	
	/**
	 * @comment:获取格式为:yyyy
	 * @author:傅里叶级数
	 * @date:2018年5月27日上午10:25:27
	 * @return
	 */
	public static String getY(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		return sdf.format(new java.util.Date());
	}


	
	
	
	/**
	 * @comment:获取指定日期的最后一天
	 * @author:傅里叶级数
	 * @date:2018年5月27日上午10:25:45
	 * @param specifiedDay
	 * @return
	 */
	public static String getSpecifiedDayAfter(String specifiedDay){
		Calendar c = Calendar.getInstance();
		Date date=null;
		try {
			date = new SimpleDateFormat("yy-MM-dd").parse(specifiedDay);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		c.setTime(date);
		int day=c.get(Calendar.DATE);
		c.set(Calendar.DATE,day+1);
		String dayAfter=new SimpleDateFormat("yyyy-MM-dd").format(c.getTime());
		return dayAfter;
	}





	
	
	/**
	 * @author 白梽炜
	 * @comments 获取指定日期的前一天
	 * @time 2016年6月23日 上午9:19:16
	 * @param specifiedDay
	 * @returnType String
	 * @modification
	 */
	public static String getSpecifiedDayBefore(String specifiedDay) {
		Calendar c = Calendar.getInstance();
		Date date=null;
		try {
			date = new SimpleDateFormat("yy-MM-dd").parse(specifiedDay);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		c.setTime(date);
		int day=c.get(Calendar.DATE);
		c.set(Calendar.DATE,day-1);
		String dayBefore=new SimpleDateFormat("yyyy-MM-dd").format(c.getTime());
		return dayBefore;
	}
	
	
	/**
	 * @comment:获取指定日期是星期几
	 * @author:傅里叶级数
	 * @date:2018年5月27日上午10:25:58
	 * @param date
	 * @return
	 */
	public static int getDay(String date) { 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar cal = Calendar.getInstance();    
        try {
			cal.setTime(sdf.parse(date+" 00:00:00"));    
			return cal.get(Calendar.DAY_OF_WEEK)-1;
		} catch (ParseException e) {
			e.printStackTrace();
		}
        return 0;
	}
	
	
	
	
	
	
	/**
	 * @comment:获取当前日期之前第n天的日期
	 * @author:傅里叶级数
	 * @date:2018年5月27日上午10:26:12
	 * @param past
	 * @param dateF
	 * @return
	 */
	public static String getPastDate(int past,String dateF) {  
		Calendar calendar = Calendar.getInstance();  
		calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) - past);  
		Date today = calendar.getTime();  
		SimpleDateFormat format = new SimpleDateFormat(dateF);  
		String result = format.format(today);  
		return result;  
	}  
	
	
	
	/**
	 * @comment:获取当前日期之后第n天的日期
	 * @author:傅里叶级数
	 * @date:2018年5月27日上午10:26:24
	 * @param past
	 * @param dateF
	 * @return
	 */
	public static String getFetureDate(int past,String dateF) {  
		Calendar calendar = Calendar.getInstance();  
		calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) + past);  
		Date today = calendar.getTime();  
		SimpleDateFormat format = new SimpleDateFormat(dateF);  
		String result = format.format(today);  
		return result;  
	} 
	
	
	
	
	
	
	
	
	/**
	 * @comment:获取当前日期之前n天所有日期
	 * @author:傅里叶级数
	 * @date:2018年5月27日上午10:26:39
	 * @param num
	 * @param dateF
	 * @return
	 */
	public static List<String> getBeforeDate(int num,String dateF) {  
		List<String> pastDaysList = new ArrayList<String>();  
		for (int i = num-1; i >=0; i--) {  
			pastDaysList.add(getPastDate(i,dateF));  
		}  
		return pastDaysList;  
	}  
	
	
	
	
	

	/**
	 * @comment:获取当前日期之后n天所有日期
	 * @author:傅里叶级数
	 * @date:2018年5月27日上午10:26:51
	 * @param num
	 * @param dateF
	 * @return
	 */
	public static List<String> getAfterDate(int num,String dateF) {  
		List<String> fetureDaysList = new ArrayList<String>();  
		for (int i = 0; i <num; i++) {  
			fetureDaysList.add(getFetureDate(i,dateF));  
		}  
		return fetureDaysList;  
	}  
	
	/**
	 * @comment:生成指定时间所在月的第一天零点时间,  参数为空 或 者空字符串 默认 获取当前时间
	 * @author:傅里叶级数
	 * @date:2018年5月27日上午10:27:03
	 * @param date
	 * @return
	 */
	public static String getStartDayTimeThisMonth(Date date){
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		//判断参数是否为空或空字符串，为true则赋予当前时间
		if(date == null){
			date = new Date();
		}
		Calendar calendar = Calendar.getInstance();  
        try {  
            calendar.setTime(date);  
            calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMinimum(Calendar.DAY_OF_MONTH));  
			calendar.set(Calendar.HOUR_OF_DAY, 0);
			calendar.set(Calendar.MINUTE, 0);
			calendar.set(Calendar.SECOND, 0);
            return dateFormat.format(calendar.getTime());  
        } catch (Exception e) {  
            e.printStackTrace();
            return null;
        }  
	}
	
	
	/**
	 * @comment:生成指定时间所在月的下个月第一天零点时间
	 * @author:傅里叶级数
	 * @date:2018年5月27日上午10:27:19
	 * @param date
	 * @return
	 */
	public static String getEndDayTimeThisMonth(Date date){
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//判断参数是否为空，为true则赋予当前时间
		if(date == null){
			date = new Date();
		}
		Calendar calendar = Calendar.getInstance();  
        try {
        	calendar.setTime(date);
        	calendar.set(Calendar.MONTH, calendar.get(Calendar.MONTH) + 1);
        	calendar.set(Calendar.DAY_OF_MONTH, 1);
			calendar.set(Calendar.HOUR_OF_DAY, 0);
			calendar.set(Calendar.MINUTE, 0);
			calendar.set(Calendar.SECOND, 0);
            return dateFormat.format(calendar.getTime());  
        }  catch (Exception e) {  
            e.printStackTrace();  
            return null;
        }  
		
	}
	
	/**
	 * @comment:生成本周第一天零点时间，第一天是星期天
	 * @author:傅里叶级数
	 * @date:2018年5月27日上午10:27:35
	 * @return
	 */
	public static String getStartDayTimeThisWeek(){
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			Calendar calendar = Calendar.getInstance();
			calendar.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY); 
			calendar.set(Calendar.HOUR_OF_DAY, 0);
			calendar.set(Calendar.MINUTE, 0);
			calendar.set(Calendar.SECOND, 0);
			return dateFormat.format(calendar.getTime());
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	

	/**
	 * @comment:生成今天零点时间
	 * @author:傅里叶级数
	 * @date:2018年5月27日上午10:27:48
	 * @return
	 */
	public static String getStartDayTimeThisDay(){
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			Calendar calendar = Calendar.getInstance();
			calendar.set(Calendar.HOUR_OF_DAY, 0);
			calendar.set(Calendar.MINUTE, 0);
			calendar.set(Calendar.SECOND, 0);
			return dateFormat.format(calendar.getTime());
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * @comment:生成指定过去天数的时间数组 ******必须为正数
	 * @author:傅里叶级数
	 * @date:2018年5月27日上午10:28:02
	 * @param num
	 * @return
	 */
	public static String[] getSevenDaysAwayTimes(int num){
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM月dd日");
		Calendar calendar = Calendar.getInstance();
		//返回数组
		String[] time = new String[num];
		try {
			calendar.setTime(new Date()); 
			for (int i = 0; i < time.length; i++) {
				time[time.length - 1 - i] = dateFormat.format(calendar.getTime());
				calendar.add(Calendar.DAY_OF_MONTH, -1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return time;
	}
	
	
	
	
	
	
	/**
	 * @author 焦越
	 * @comments 获取当前时间一小时前的时间
	 * @time 2017年7月25日 下午4:04:00
	 * @return 
	 * @returnType String
	 * @modification
	 */
	public static String beforeOneHourTime() {  
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date=new Date();
	    Calendar calendar = Calendar.getInstance();    
	    calendar.setTime(date);    
	    calendar.add(Calendar.HOUR, -1);    
	    return sdf.format(calendar.getTime());    
	}
	
	
	
	
	
	
	/**
	 * @comment:获取当前时间一小时后的时间
	 * @author:傅里叶级数
	 * @date:2018年5月27日上午10:28:16
	 * @return
	 */
	public static String afterOneHourTime() {  
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date=new Date();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.HOUR, 1);
		return sdf.format(calendar.getTime());
	}
	
	
	
	
	
	
	/**
	 * @comment:获取指定日期之后第n天的日期
	 * @author:傅里叶级数
	 * @date:2018年5月27日上午10:28:29
	 * @param date
	 * @param past
	 * @param dateF
	 * @return
	 */
	public static String getFetureDate(String date,int past,String dateF) { 
		Calendar c = Calendar.getInstance();
		SimpleDateFormat format = new SimpleDateFormat(dateF);  
		try {
			c.setTime(format.parse(date));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Calendar calendar = Calendar.getInstance();  
		calendar.set(Calendar.DAY_OF_YEAR, c.get(Calendar.DAY_OF_YEAR) + past);  
		Date today = calendar.getTime();  
		
		String result = format.format(today);  
		return result;  
	} 
	
	
	
	
	

	/**
	 * @comment:获取指定日期之前第n天的日期
	 * @author:傅里叶级数
	 * @date:2018年5月27日上午10:28:44
	 * @param date
	 * @param past
	 * @param dateF
	 * @return
	 */
	public static String getPastDate(String date,int past,String dateF) {  
		Calendar c = Calendar.getInstance();
		SimpleDateFormat format = new SimpleDateFormat(dateF);  
		try {
			c.setTime(format.parse(date));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Calendar calendar = Calendar.getInstance();  
		calendar.set(Calendar.DAY_OF_YEAR, c.get(Calendar.DAY_OF_YEAR) - past);  
		Date today = calendar.getTime();  
		String result = format.format(today);  
		return result;  
	}  
	
	
	
	
	
	
	/**
	 * @comment:判断两个日期中的第一个日期是否会大于后一个日期
	 * @author:傅里叶级数
	 * @date:2018年5月27日上午10:29:02
	 * @param DATE1
	 * @param DATE2
	 * @return
	 */
	public static boolean compare_date(String DATE1, String DATE2) {
		boolean result=true;
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date dt1 =df.parse(DATE1);
            Date dt2 =df.parse(DATE2);
            if (dt1.getTime() >= dt2.getTime()) {
               result=true;
            } else if(dt1.getTime() < dt2.getTime()) {
               result=false;
            }
        } catch (Exception exception) {
           exception.printStackTrace();
        }
        return  result;
	}
	
	
	
	
	
	
	
	
	
	/**
	 * @comment:获取两个日期之间相差的天数
	 * @author:傅里叶级数
	 * @date:2018年5月27日上午10:29:14
	 * @param starttime
	 * @param endtime
	 * @return
	 */
	public static Long getTwotime(String starttime,String endtime){
		long day=0l;
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 可以方便地修改日期格式
		try {
			Date d1= dateFormat.parse(starttime+" 00:00:00");
			Date d2 = dateFormat.parse(endtime+" 00:00:00");
			long diff = d1.getTime() - d2.getTime(); // 毫秒
			day= diff / (24 * 60 * 60 * 1000); // 天
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return day;
	}
	
	
	
	
	
	/**
	 * @comment:计算两个时间之间相差分钟数
	 * @author:傅里叶级数
	 * @date:2018年5月27日上午10:29:27
	 * @param starttime
	 * @param endtime
	 * @return
	 */
	public static Long getChaByMin(String starttime,String endtime){
		long min=0l;
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 可以方便地修改日期格式
		try {
			Date d1= dateFormat.parse(starttime);
			Date d2 = dateFormat.parse(endtime);
			long diff = d2.getTime() - d1.getTime(); // 毫秒
			min= diff / (60 * 1000); // 天
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return min;
	}
}
