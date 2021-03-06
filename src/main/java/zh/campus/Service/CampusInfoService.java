package zh.campus.Service;

import java.util.List;
import java.util.Map;

import zh.beans.CampusBean;

public interface CampusInfoService {

	/**
	 * @comment: 查询所有省数据
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月26日下午3:53:38
	 */
	List<Map<String, Object>> findAllProvince_campus();

	
	
	
	
	/**
	 * @comment: 根据所有省数据查询市数据
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月26日下午9:49:58
	 */
	List<Map<String, Object>> findCityByPccode_campus(String pccode);





	/**
	 * @comment: 根据市数据查询对应的区县数据
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月26日下午10:03:34
	 */
	List<Map<String, Object>> findAreaByCtcode_campus(String ctcode);




	/**
	 * @comment:添加学校信息 
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月27日下午1:37:24
	 */
	String addCampusData(CampusBean campusBean);




	/**
	 * @comment: 按照搜索条件查询学校信息
	 * @param: 
	 * @author: 傅里叶级数
	 * @param param 
	 * @date 2018年11月27日下午3:44:57
	 */
	List<Map<String, Object>> list_campusnew_exp(Map<String, Object> param);





	/**
	 * @comment: 学校信息导入
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月29日下午2:41:56
	 */
	String importCampus(String fileUrl);

}
