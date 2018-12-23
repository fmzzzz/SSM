package zh.login.Dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import zh.beans.SysUsersBean;

/**
 * @comment:用户登录数据库连接层
 * @author 傅里叶级数
 * @date 2018年11月20日上午9:43:39
 */
@Repository
public interface LoginDao {

	/**
	 * @comment: 查询是否存在该用户
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月20日上午11:05:21
	 */
	int countNumByUsname(String usname);
	
	/**
	 * @comment: 根据用户名查询对应密码
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月20日上午11:13:04
	 */
	String findPwdInDbByUsername(String usname);

	/**
	 * @comment: 查询usid
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月20日下午4:17:33
	 */
	String findUsidByUsnamePwd(SysUsersBean usersBean);

	/**
	 * @comment: 跳转到主界面的时候附带查询系统的基础信息
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月21日下午8:21:18
	 */
	Map<String, Object> findSysData();

	/**
	 * @comment: 查询系统的一级菜单
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月23日上午12:05:41
	 */
	List<Map<String, Object>> findSysMenuList();

	/**
	 * @comment: 修改密码
	 * @param: 
	 * @author: 凡宇
	 * @date 2018年11月23日上午9:38:31
	 */
	void updateUserPwd(@Param("usid")String usid, @Param("newPwd")String newPwd);
	
	/**
	 * @comment: 查询原密码是否正确
	 * @param: 
	 * @author: 凡宇
	 * @date 2018年11月23日上午9:40:05
	 */
	int countSysDb(@Param("usid")String usid, @Param("oldPwd")String oldPwd);

	/**
	 * @comment: 根据父级菜单查询子菜单列表
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月26日上午10:42:41
	 */
	List<Map<String, Object>> findSonMenuList(String mid);
	
}
