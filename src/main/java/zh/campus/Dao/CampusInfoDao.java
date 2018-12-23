package zh.campus.Dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import zh.beans.CampusBean;

@Repository
public interface CampusInfoDao {

	/**
	 * @comment: 查询所有省数据
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月26日下午4:07:31
	 */
	List<Map<String, Object>> findAllProvince_campus();

	/**
	 * @comment: 根据省数据查询对应的市区数据
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月26日下午9:52:20
	 */
	List<Map<String, Object>> findCityByPccode_campus(String pccode);

	/**
	 * @comment: 根据市数据查询对应县区数据
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月26日下午10:05:41
	 */
	List<Map<String, Object>> findAreaByCtcode_campus(String ctcode);

	/**
	 * @comment:添加学校信息
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月27日下午1:42:08
	 */
	void addCampusData(CampusBean campusBean);

	/**
	 * @comment: 按照条件搜索导出学校信息
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月27日下午3:47:49
	 */
	List<Map<String, Object>> list_campusnew_exp(Map<String, Object> param);

	/**
	 * @comment: 查询是否存在省名称
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月29日下午3:46:54
	 */
	int countPccodeByPcname(String pcname);

	/**
	 * @comment: 查询当前省数据下是否存在该市名称
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月29日下午3:54:56
	 */
	int countCtcodeByPcname(@Param("pcname")String pcname, @Param("ctname")String ctname);

	/**
	 * @comment:查询是否存在对应县区
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月29日下午4:58:37
	 */
	int countAacodeByPcnameCtname(@Param("pcname")String pcname, @Param("ctname")String ctname, @Param("aaname")String aaname);

	/**
	 * @comment: 检查学校是否存在
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月29日下午5:08:39
	 */
	int checkCsnameIfExist(String csname);

	/**
	 * @comment: 校验学校标识码是否存在
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月29日下午5:15:27
	 */
	int checkCscodeIfExist(String string);

	/**
	 * @comment: 检查是否存在对应的学校类别
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月29日下午5:25:50
	 */
	int checkIfExistCsproerty(@Param("csproerty") String csproerty);

	/**
	 * @comment: 根据省名称查询省编码
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月29日下午5:46:15
	 */
	String findPccodeByPcname(String string);

	/**
	 * @comment: 查询市编码
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月29日下午5:48:21
	 */
	String findCtcodeByCtname(@Param("pccode")String pccode, @Param("ctname")String ctname);

	/**
	 * @comment: 查询县区编码
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月29日下午5:51:44
	 */
	String findAAcodeByAaname(@Param("pccode")String pccode, @Param("ctcode")String ctcode, @Param("aaname")String aaname);

	/**
	 * @comment:查询学校类别 
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月29日下午5:57:57
	 */
	String findTypeByCsproerty(@Param("csproerty")String csproerty);

}
