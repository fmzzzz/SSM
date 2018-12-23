package zh.campus.Dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import zh.beans.CampusBean;

@Repository
public interface CampusInfoListPageDao {

	/**
	 * @comment: 根据条件分页查询学校信息
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月27日下午7:01:17
	 */
	List<Map<String, Object>> findCampusListPage(Map<String, Object> param);

	/**
	 * @comment:查询对应条件下的数据总条数
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月27日下午7:01:46
	 */
	int countCampusListPage(Map<String, Object> param);

	/**
	 * @comment: 根据csid删除单条学校信息
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月28日上午11:51:55
	 */
	void deleteCampusByCsid(String csid);

	/**
	 * @comment:查询但各学校的详细信息
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月28日下午4:19:03
	 */
	Map<String, Object> findCampusByCsid_campus(String csid);

	/**
	 * @comment: 学校信息编辑保存
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月28日下午5:55:44
	 */
	void editCampus_campus_Save(CampusBean campusBean);

	/**
	 * @comment: 学校信息批量删除
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月29日上午11:35:26
	 */
	void delBaths_campus(@Param("csids")String csids);
}
