package zh.campus.Service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import zh.beans.CampusBean;
import zh.campus.Dao.CampusInfoListPageDao;
import zh.campus.Service.CampusInfoListPageService;

@Service
public class CampusInfoListPageServiceBean implements CampusInfoListPageService{

	@Resource
	private CampusInfoListPageDao caListPageDao;
	
	/*
	 * 日志
	 */
	private Logger logger = LogManager.getLogger(CampusInfoListPageServiceBean.class);

	/**
	 * @comment: 学校信息按照条件分页查询
	 * @author: 傅里叶级数
	 * @date: 2018年11月27日下午6:49:11
	 * @param pccode 省编码
	 * @param ctcode 市编码
	 * @param aacode 县区编码
	 * @param csname 学校名称
	 * @param rownum 起始行
	 * @param rows 数据量
	 * @return
	 */
	
	@Override
	public List<Map<String, Object>> findCampusListPage(String pccode, String ctcode, String aacode, String csname,
			int rownum, int rows) {
		Map<String, Object> param = new HashMap<>();
		param.put("pccode", pccode);
		param.put("ctcode", ctcode);
		param.put("aacode", aacode); 
		param.put("csname", csname);
		param.put("rownum", rownum);
		param.put("rows", rows);
		List<Map<String, Object>> listMap = new ArrayList<>();
		try {
			listMap = caListPageDao.findCampusListPage(param);
		} catch (Exception e) {
			logger.error("CampusInfoListPageServiceBean---调用findCampusListPage---caListPageDao---findCampusListPage---系统异常");
			return new ArrayList<>();
		}
		return listMap;
	}
/*	@Override
	public List<Map<String, Object>> findCampusListPage(String pccode, String ctcode, String aacode, String csname,
			int rownum, int rows) {
		*//**
		 * 组装参数
		 *//*
		Map<String,Object> param = new HashMap<>();
		param.put("pccode", pccode);
		param.put("ctcode", ctcode);
		param.put("aacode", aacode);
		param.put("csname", csname);
		param.put("rownum", rownum);
		param.put("rows", rows);
		
		List<Map<String,Object>> listMap = new ArrayList<>();
		try {
			listMap = caListPageDao.findCampusListPage(param);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("CampusInfoListPageServiceBean---调用findCampusListPage---caListPageDao---findCampusListPage---系统异常");
			return new ArrayList<>();
		}
		return listMap;
	}*/

	/**
	 * @comment: 
	 * @author: 傅里叶级数
	 * @date: 2018年11月27日下午6:50:41
	 * @param pccode 省编码
	 * @param ctcode 市编码
	 * @param aacode 县区编码
	 * @param csname 学校名称
	 * @return
	 */
	@Override
	public int countCampusListPage(String pccode, String ctcode, String aacode, String csname) {
		/**
		 * 组装参数
		 */
		Map<String,Object> param = new HashMap<>();
		param.put("pccode", pccode);
		param.put("ctcode", ctcode);
		param.put("aacode", aacode);
		param.put("csname", csname);
		
		int count = Integer.MIN_VALUE;
		try {
			count = caListPageDao.countCampusListPage(param);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("CampusInfoListPageServiceBean---调用countCampusListPage---caListPageDao---countCampusListPage---系统异常");
			return 0;
		}
		return count;
	}







	/**
	 * @comment: 根据csid删除单条学校信息
	 * @author: 傅里叶级数
	 * @date: 2018年11月28日上午11:49:06
	 * @param csid
	 * @return
	 */
	@Override
	public String deleteCampusByCsid(String csid) {
		try {
			caListPageDao.deleteCampusByCsid(csid);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("CampusInfoListPageServiceBean---调用deleteCampusByCsid---caListPageDao---deleteCampusByCsid---系统异常");
			return "{result:'500',msg:'系统异常，请联系管理员'}";
		}
		return "{result:'502',msg:'删除成功'}";
	}








	/**
	 * @comment:查询单个学校的详细信息
	 * @author: 傅里叶级数
	 * @date: 2018年11月28日下午4:17:08
	 * @param csid
	 * @return
	 */
	@Override
	public Map<String, Object> findCampusByCsid_campus(String csid) {
		Map<String,Object> csMap = new HashMap<>();
		try {
			csMap = caListPageDao.findCampusByCsid_campus(csid);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("CampusInfoListPageServiceBean---调用findCampusByCsid_campus---caListPageDao---findCampusByCsid_campus---系统异常");
			return new HashMap<>();
		}
		return csMap;
	}







	/**
	 * @comment: 学校信息编辑保存
	 * @author: 傅里叶级数
	 * @date: 2018年11月28日下午5:54:31
	 * @param campusBean
	 * @return
	 */
	@Override
	public String editCampus_campus(CampusBean campusBean) {
		try {
			caListPageDao.editCampus_campus_Save(campusBean);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("CampusInfoListPageServiceBean---调用editCampus_campus---caListPageDao---editCampus_campus_Save---系统异常");
			return "{result:'500',msg:'系统异常，请联系管理员'}";
		}
		return "{result:'502',msg:'修改成功'}";
	}







	/**
	 * @comment: 学校信息批量删除
	 * @author: 傅里叶级数
	 * @date: 2018年11月29日上午11:28:40
	 * @param csids
	 * @return
	 */
	@Override
	public String delBaths_campus(String csids) {
		//字符串拼接
		csids = "'"+csids.replaceAll(",", "','")+"'";
		String result = "";
		try {
			caListPageDao.delBaths_campus(csids);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("CampusInfoListPageServiceBean---调用delBaths_campus---caListPageDao---delBaths_campus---系统异常");
			return "{result:'500',msg:'系统异常，请联系管理员'}";
		}
		return "{result:'502',msg:'删除成功'}";
	}
	
	
	
	
}
