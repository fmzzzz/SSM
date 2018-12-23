package zh.utils;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.support.RequestContext;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;


/**
 * @comment: 数据传输工具类
 * @author 傅里叶级数
 * @date 2018年5月27日上午10:21:05
 */
public class ReqUtils {

	/**
	 * @comment:传递json数据
	 * @author:傅里叶级数
	 * @date:2018年5月27日上午10:11:55
	 * @param jsonArray
	 * @param response
	 */
	public static void backing_out_jsonArray(Object jsonArray,HttpServletResponse response) {
		response.reset();
		response.setContentType("text/html;charset=utf-8");
		try {
			if (jsonArray instanceof String){
				response.getWriter().write(JSON.parse(jsonArray.toString()).toString());
			}else{
				response.getWriter().write(JSONArray.toJSONString(jsonArray));
			}
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @comment:分页json
	 * @author:傅里叶级数
	 * @date:2018年5月27日上午10:12:34
	 * @param count
	 * @param lstPage
	 * @param response
	 */
	public static void backing_out_jsonArray_page(int count, List lstPage,HttpServletResponse response) {
		response.reset();
		response.setContentType("text/html;charset=utf-8");
		try {
			String paging = "{\"total\":" + count + ",\"rows\":"+ JSONArray.toJSONString(lstPage) + "}";
			paging = paging.replaceAll("\\s", " ");
			response.getWriter().write(JSON.parse(paging).toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
		
	/**
	 * @comment: 获取uuid主键
	 * @author:傅里叶级数
	 * @date:2018年5月27日上午10:13:11
	 * @return
	 */
	public static String uuid(){
		String s=UUID.randomUUID().toString();
		return s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
	}
	
	/**
	 * @comment: 获取系统System.nanoTime随机数
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年5月27日上午10:09:32
	 */
	public static long nanoNum(){
		return System.nanoTime();
	}

	/**
	 * @comment: 获取项目物理根路径
	 * @author:傅里叶级数
	 * @date:2018年5月27日上午10:14:14
	 * @return
	 */
	public static String getWebRoot() {
		String webroot = RequestContext.class.getResource("/../../").getPath();
		return webroot;
	}
	
	/**
	 * @comment: 下载文件
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年5月27日上午10:25:45
	 */
	public static void download(String path, HttpServletRequest request,HttpServletResponse response) {
		try {
			File file = new File(path);
			if (!file.exists()) {
				System.out.println("文件不存在");
				return;
			}
			String filename = file.getName();
			InputStream fis = new BufferedInputStream(new FileInputStream(file));
			byte[] buffer = new byte[fis.available()];
			fis.read(buffer);
			fis.close();
			response.reset();
			response.addHeader("Content-Disposition", "attachment;filename="+new String(filename.getBytes("utf-8"), "ISO-8859-1"));
			response.addHeader("Content-Length", "" + file.length());
			OutputStream toClient = new BufferedOutputStream(response.getOutputStream());
			response.setContentType("application/octet-stream");
			toClient.write(buffer);
			toClient.flush();
			toClient.close();
		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}
}
