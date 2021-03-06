package zh.login.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import zh.login.Service.LoginService;
import zh.utils.ReqUtils;

/**
 * @comment:用户登录控制层-----主要控制用户的登陆流程
 * @author 傅里叶级数
 * @date 2018年11月20日上午9:39:36
 */
@Controller
public class LoginController {
	
	/*
	 * 用户登录业务逻辑层接口
	 */
	@Resource
	private LoginService loginService;
	
	/*
	 * 日志
	 */
	private Logger logger = LogManager.getLogger(LoginController.class);
	
	
	@RequestMapping("/login")
	public void userLogin(HttpServletRequest req, HttpServletResponse res) {
		/*
		 * 从页面获取参数
		 */
		String username = req.getParameter("username");
		String pwd = req.getParameter("password");
		/*
		 * 定义返回值 
		 */
		String result = "";
		/**
		 * 登陆逻辑
		 */
		try {
			result = loginService.login(username,pwd,req);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			logger.error("LoginController---调用userLogin---loginService---login---系统异常");
			ReqUtils.backing_out_jsonArray("{result:'500',msg:'系统异常，请联系管理员'}", res);
			return;
		}
		ReqUtils.backing_out_jsonArray(result, res);
		return;
	}
	
	
	/**
	 * @comment:登录成功跳转到主界面
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月21日下午8:24:09
	 */
	@RequestMapping("/mainPage_show")
	public String mianPage_show(HttpServletRequest req, HttpServletResponse res) {
//		获取session
		HttpSession session = req.getSession(false);
//		判断session是否为空
		if(session ==null) {
			return "redirect:/index.jsp";
		}
//		若session不为空，取之前存入session中的usid来校验
		Object USID = session.getAttribute("USID");
//		判断usid是否存在，如果不存在，页面重定向到登录页面
		if(USID==null || StringUtils.isEmpty(USID)) {
			return "redirect:/index.jsp";
		}
		/**
		 * 判断完成之后取系统的基础数据
		 */
		//定义返回值
		Map<String,Object> resultMap = new HashMap<>();
		try {
//			执行查询
			resultMap =loginService.findSysData();
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			logger.error("LoginController---调用mianPage_show---loginService---findSysData---系统异常");
//			如果查询出现系统异常，页面重定向到404页面
			return "404";
		}
//		将系统基础数据存入这次请求中
		req.setAttribute("resultMap", resultMap);
		
		/**
		 * 查询系统一级菜单
		 */
		List<Map<String,Object>> menuOneList = new ArrayList<>();
		try {
			menuOneList = loginService.findSysMenuList();
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("LoginController---调用mianPage_show---loginService---findSysMenuList---系统异常");
			return "404";
		}
		req.setAttribute("menuOneList", menuOneList);
//		存完之后页面跳转到主页面
		return "mainPage";
	}
	
	
	/**
	 * @comment: 退出平台
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月22日上午10:37:02
	 */
	@RequestMapping("/exit_login_users")
	public String exit_login_users(HttpServletRequest req, HttpServletResponse res) {
		//需要注意的地方是request.getSession() 等同于 request.getSession(true)，除非我们确认session一定存在或者sesson不存在时明确有创建session的需要，否则尽量使用request.getSession(false)。在使用request.getSession()函数，通常在action中检查是否有某个变量/标记存放在session中
		HttpSession ses = req.getSession(false);
		if(ses == null) {
			return "redirect:/index.jsp";
		}
		Object USID = ses.getAttribute("USID");
		if(USID == null ) {
			return "redirect:/index.jsp";
		}
		ses.removeAttribute("USID");
		return "redirect:/index.jsp";
	}

	
	/**
	 * @comment: 修改密码
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月26日上午10:32:30
	 */
	@RequestMapping("/updatePwd_index")
	public void sysUserUpdatePwd(HttpServletRequest req, HttpServletResponse res){
		String result = "";
		/**
		 * 取参数
		 */
		String oldPwd = req.getParameter("oldpwd");
		String newpwd = req.getParameter("newpwd");
		String vfpwd = req.getParameter("vfpwd");
		//需要注意的地方是request.getSession() 等同于 request.getSession(true)，除非我们确认session一定存在或者sesson不存在时明确有创建session的需要，否则尽量使用request.getSession(false)。在使用request.getSession()函数，通常在action中检查是否有某个变量/标记存放在session中
		HttpSession ses = req.getSession(false);
		if(ses == null) {
			ReqUtils.backing_out_jsonArray("{result:'500',msg:'登录过期，请重新登录'}", res);
			return;
		}
		Object USID = ses.getAttribute("USID");
		if(USID == null ) {
			ReqUtils.backing_out_jsonArray("{result:'500',msg:'登录过期，请重新登录'}", res);
			return;
		}
		if(StringUtils.isEmpty(oldPwd)){
			ReqUtils.backing_out_jsonArray("{result:'500',msg:'请重新验证输入的密码'}", res);
			return;
		}
		if(StringUtils.isEmpty(newpwd)){
			ReqUtils.backing_out_jsonArray("{result:'500',msg:'请重新验证输入的密码'}", res);
			return;
		}
		if(StringUtils.isEmpty(vfpwd)){
			ReqUtils.backing_out_jsonArray("{result:'500',msg:'请重新验证输入的密码'}", res);
			return;
		}
		
		try {
			result = loginService.sysUserUpdatePwd(oldPwd.trim(), newpwd.trim(), vfpwd.trim(), USID.toString());
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("LoginController---调用sysUserUpdatePwd---loginService---sysUserUpdatePwd---系统异常");
			ReqUtils.backing_out_jsonArray("{result:'500',msg:'系统异常'}", res);
			return;
		}
		ReqUtils.backing_out_jsonArray(result, res);
		return;
	}
	
	
	
	
	
	/**
	 * @comment: 检查登录是否超时
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月26日上午10:57:38
	 */
	@RequestMapping("/checkSession_index")
	public void checkSession(HttpServletRequest req,HttpServletResponse res){
		//获取用户系统编号
		try {
			req.getSession().getAttribute("USID").toString();
		} catch (Exception e) {
			ReqUtils.backing_out_jsonArray("{result:'500',msg:'登录超时'}", res);
			return;
		}
		ReqUtils.backing_out_jsonArray("{result:'502',msg:'OK'}", res);
	}

	
	/**
	 * @comment: 查询子菜单
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月26日上午10:35:45
	 */
	@RequestMapping("/findSonMenuList")
	public void findSonMenuList(HttpServletRequest req, HttpServletResponse res) {
		/**
		 * 查看登录是否超时
		 */
		HttpSession session=req.getSession();
		if(session==null){
			ReqUtils.backing_out_jsonArray("{result:500,msg:'登录超时，请重新登录'}",res);
			return;
		}
		Object USID = session.getAttribute("USID");
		if(StringUtils.isEmpty(USID)) {
			ReqUtils.backing_out_jsonArray("{result:500,msg:'登录超时，请重新登录'}",res);
			return;
		}
		
		String mid = req.getParameter("id");
		/**
		 * 根据父级菜单查询其所有对应的子菜单
		 */
		List<Map<String,Object>> listMap = new ArrayList<>();
		try {
			listMap = loginService.findSonMenuList(mid);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("LoginController---调用findSonMenuList---loginService---findSonMenuList---系统异常");
			ReqUtils.backing_out_jsonArray("{result:'500',msg:'系统异常'}", res);
			return;
		}
		ReqUtils.backing_out_jsonArray(listMap, res);
		return;
	}
}
