package zh.campus.Controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import zh.beans.CampusBean;
import zh.campus.Service.CampusInfoService;
import zh.utils.ExcelUtils;
import zh.utils.ReqUtils;
import zh.utils.UtilDate;

/**
 * @comment:学校档案填写
 * @author 傅里叶级数
 * @date 2018年11月26日下午2:58:03
 */
@Controller
public class CampusInfoController {
	
	@Resource
	private CampusInfoService campusService;
	
	/*
	 * 日志
	 */
	private Logger logger = LogManager.getLogger(CampusInfoController.class);
	
	
	/**
	 * @comment: 学校信息填写
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月26日下午3:00:33
	 */
	@RequestMapping("/campusManager")
	public String campusManager(HttpServletRequest req, HttpServletResponse res) {
		return "campus/campusManage";
	}
	
	
	
	/**
	 * @comment: 查询所有省数据
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月26日下午3:28:52
	 */
	@RequestMapping("/findAllProvince_campus")
	public void findAllProvince_campus(HttpServletRequest req, HttpServletResponse res) {
		List<Map<String,Object>> pList = new ArrayList<>();
		try {
			pList = campusService.findAllProvince_campus();
		} catch (Exception e) {
			logger.error("CampusInfoController---调用findAllProvince_campus---campusService---findAllProvince_campus---系统异常");
			ReqUtils.backing_out_jsonArray("{result:'500',msg:'系统异常，请联系管理员'}", res);
			return;
		}
		ReqUtils.backing_out_jsonArray(pList, res);
		return;
	}
	
	
	
	
	
	/**
	 * @comment: 根据省数据查询所有市数据
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月26日下午9:49:27
	 */
	@RequestMapping("/findCityByPccode_campus")
	public void findCityByPccode_campus(HttpServletRequest req, HttpServletResponse res) {
		String pccode = req.getParameter("pccode");
		if(StringUtils.isEmpty(pccode)) {
			ReqUtils.backing_out_jsonArray(new ArrayList<>(), res);
			return;
		}
		List<Map<String,Object>> ctListMap = new ArrayList<>();
		try {
			ctListMap = campusService.findCityByPccode_campus(pccode);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("CampusInfoController---调用findCityByPccode_campus---campusService---findCityByPccode_campus---系统异常");
		}
		ReqUtils.backing_out_jsonArray(ctListMap, res);
		return;
	}
	
	
	
	
	
	
	
	/**
	 * @comment:根据市编码查询对应区县数据
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月26日下午10:02:22
	 */
	@RequestMapping("/findAreaByCtcode_campus")
	public void findAreaByCtcode_campus(HttpServletRequest req, HttpServletResponse res) {
		String ctcode = req.getParameter("ctcode");
		if(StringUtils.isEmpty(ctcode)) {
			ReqUtils.backing_out_jsonArray(new ArrayList<>(), res);
			return;
		}
		List<Map<String,Object>> aaListMap = new ArrayList<>();
		try {
			aaListMap = campusService.findAreaByCtcode_campus(ctcode);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("CampusInfoController---调用findCityByPccode_campus---campusService---findCityByPccode_campus---系统异常");
			ReqUtils.backing_out_jsonArray(new ArrayList<>(), res);
		}
		ReqUtils.backing_out_jsonArray(aaListMap, res);
		return;
	}
	
	
	
	
	
	
	
	/**
	 * @comment:新增学校信息
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月27日上午11:28:11
	 */
	@RequestMapping("/addCampusData")
	public void addCampusData(HttpServletRequest req, HttpServletResponse res) {
		/**
		 * 获取参数
		 */
		String  pccode = req.getParameter("pccode");
		String  ctcode = req.getParameter("ctcode");
		String  aacode = req.getParameter("aacode");
		String  csname = req.getParameter("csname");
		String  cscode = req.getParameter("cscode");
		String  createyear = req.getParameter("createyear");
		String  csotname = req.getParameter("csotname");
		String  csproerty = req.getParameter("csproerty");
		String  csaddres = req.getParameter("csaddres");
		String  cstelnum = req.getParameter("cstelnum");
		String  principal = req.getParameter("principal");
		String  prnum = req.getParameter("prnum");
		String  charger = req.getParameter("charger");
		String  chagejob = req.getParameter("chagejob");
		String  chrgtelnum = req.getParameter("chrgtelnum");
		String  email = req.getParameter("email");
		String  postcode = req.getParameter("postcode");
		String  csintro = req.getParameter("csintro");
		/**
		 * 参数校验
		 */
		if(StringUtils.isEmpty(pccode)) {
			ReqUtils.backing_out_jsonArray("{result:'500',msg:'请选择省'}", res);
			return;
		}
		if(StringUtils.isEmpty(ctcode)) {
			ReqUtils.backing_out_jsonArray("{result:'500',msg:'请选择市'}", res);
			return;
		}
		if(StringUtils.isEmpty(aacode)) {
			ReqUtils.backing_out_jsonArray("{result:'500',msg:'请选择县/区'}", res);
			return;
		}
		if(StringUtils.isEmpty(csname)) {
			ReqUtils.backing_out_jsonArray("{result:'500',msg:'请填写学校名称'}", res);
			return;
		}
		if(StringUtils.isEmpty(cscode)) {
			ReqUtils.backing_out_jsonArray("{result:'500',msg:'请填写学校标识码'}", res);
			return;
		}
		if(StringUtils.isEmpty(createyear)) {
			ReqUtils.backing_out_jsonArray("{result:'500',msg:'请填写学校创办年份'}", res);
			return;
		}
		if(StringUtils.isEmpty(csotname)) {
			ReqUtils.backing_out_jsonArray("{result:'500',msg:'请填写学校别名'}", res);
			return;
		}
		if(StringUtils.isEmpty(csproerty)) {
			ReqUtils.backing_out_jsonArray("{result:'500',msg:'请选择学校性质'}", res);
			return;
		}
		if(StringUtils.isEmpty(csaddres)) {
			ReqUtils.backing_out_jsonArray("{result:'500',msg:'请填写学校地址'}", res);
			return;
		}
		if(StringUtils.isEmpty(cstelnum)) {
			ReqUtils.backing_out_jsonArray("{result:'500',msg:'请填写学校电话'}", res);
			return;
		}
		if(StringUtils.isEmpty(principal)) {
			ReqUtils.backing_out_jsonArray("{result:'500',msg:'请填写校长姓名'}", res);
			return;
		}
		if(StringUtils.isEmpty(prnum)) {
			ReqUtils.backing_out_jsonArray("{result:'500',msg:'请填写校长联系电话'}", res);
			return;
		}
		/**
		 * 参数封装
		 */
		CampusBean campusBean = new CampusBean();
		campusBean.setPccode(pccode);
		campusBean.setCtcode(ctcode);
		campusBean.setAacode(aacode);
		campusBean.setCsid(ReqUtils.uuid());
		campusBean.setCsname(csname);
		campusBean.setCscode(cscode);
		campusBean.setCreateyear(createyear);
		campusBean.setCsotname(csotname);
		campusBean.setCsproerty(Integer.parseInt(csproerty));
		campusBean.setCsaddres(csaddres);
		campusBean.setCstelnum(cstelnum);
		campusBean.setPrincipal(principal);
		campusBean.setPrnum(prnum);
		campusBean.setCharger(charger);
		campusBean.setChagejob(chagejob);
		campusBean.setChrgtelnum(chrgtelnum);
		campusBean.setEmail(email);
		campusBean.setPostcode(postcode);
		campusBean.setCsintro(csintro);
		campusBean.setAddtime(UtilDate.getYMdHms());
		
		// 结果
		String result ="";
		try {
			result = campusService.addCampusData(campusBean);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("CampusInfoController---调用addCampusData---campusService---addCampusData---系统异常");
			ReqUtils.backing_out_jsonArray("{result:'500',msg:'系统异常，请联系管理员'}", res);
			return;
		}
		ReqUtils.backing_out_jsonArray(result, res);
		return;
	}
	
	
	
	
	
	/**
	 * @comment:学校按照条件搜索导出
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月27日下午2:42:58
	 */
	@RequestMapping("/list_campusnew_exp")
	public void list_campusnew_exp(HttpServletRequest req, HttpServletResponse res) {
		/**
		 * 取参数
		 */
		String pccode = req.getParameter("pccode");
		String ctcode = req.getParameter("ctcode");
		String aacode = req.getParameter("aacode");
		String csname = req.getParameter("csname");
		Map<String, Object> param = new HashMap<String, Object>();
		if(!StringUtils.isEmpty(csname)){
			 try {
				 // 汉字转码
				 csname=new String(csname.getBytes("ISO8859-1"),"UTF-8");
			} catch (UnsupportedEncodingException e) {
			}
		}
		param.put("pccode", pccode);
		param.put("ctcode", ctcode);
		param.put("aacode", aacode);
		param.put("csname", csname);
		
		/**
		 * 按照条件查询
		 */
		List<Map<String,Object>> listCampus = new ArrayList<>();
		listCampus = campusService.list_campusnew_exp(param);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("list", listCampus);
		
		String setTime = UtilDate.getYMd();
		Long id=ReqUtils.nanoNum();
		
		ExcelUtils.export(map,"campus/campuslist.xls", "campuslist_"+setTime+"_"+id+".xls", req);
		ReqUtils.download(req.getRealPath("dload/campuslist_"+setTime+"_"+id+".xls"), req, res);
		String path=req.getRealPath("dload/campuslist_"+setTime+"_"+id+".xls");
		File file=new File(path);
		if(file.exists()){
			file.delete();
		}
	}
	
	
	
	
	/**
	 * @comment: 学校信息批量导入
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月29日下午2:33:14
	 */
	@RequestMapping("/importCampus_campus")
	public void importCampus_campus(HttpServletRequest req, HttpServletResponse res) {
		//查看登录是否超时
		try {
			req.getSession().getAttribute("USID").toString();
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("CampusInfoController---调用importCampus_campus---campusService---importCampus_campus---系统异常");
			ReqUtils.backing_out_jsonArray("{result:'500',msg:'登录超时,请重新登录'}", res);
			return;
		}
		
		// 将req转换为SpringMVC的文件上传请求
		MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest) req;
		// 采用默认临界值和系统临时文件夹构造文件项工厂对象。
		DiskFileItemFactory fac = new DiskFileItemFactory();
		// 创建文件上传对象
		ServletFileUpload upload = new ServletFileUpload(fac);
		// 设置列名编码
		upload.setHeaderEncoding("utf-8");
		try {
			// 设置文件的编码格式
			mhsr.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		String se = File.separator;
		String fileUrl="";
		String savePath = mhsr.getSession().getServletContext().getRealPath("upload");
		File f1 = new File(savePath);
		if (!f1.exists()) {
			f1.mkdirs();
		}
		try {
			Map<String, MultipartFile> files = mhsr.getFileMap();
			for (String key : files.keySet()) {
				MultipartFile mf = mhsr.getFile(key);
				String name = mf.getOriginalFilename();
				String extName = "";
				String encryptName = UUID.randomUUID().toString();
				//提取Excel
				if(key.equals("csfile")){
					if(name!=null&&!"".equals(name)){
						extName = name.substring(name.lastIndexOf("."));
						File file = new File(savePath + se + encryptName + extName);
						fileUrl=savePath + se + encryptName + extName;
						if (!file.exists()) {
							file.createNewFile();
						}
						mf.transferTo(file);
						continue;
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			ReqUtils.backing_out_jsonArray("{result:'500',msg:'系统异常，请联系管理员'}", res);
			return;
		}
		
		//定义result返回值
		String result ="";
		try {
			result=campusService.importCampus(fileUrl);
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("CampusInfoController---调用importCampus_campus---campusService---importCampus---系统异常");
			//删除上传文件
			File fi=new File(fileUrl);
			fi.delete();
			ReqUtils.backing_out_jsonArray("{result:'500',msg:'系统异常，请联系管理员'}", res);
			return;
		}
		
		//删除上传文件
		File fi=new File(fileUrl);
		fi.delete();
		ReqUtils.backing_out_jsonArray(result,res);
	}
	
	
	
	
	/**
	 * @comment: 学校导入模板下载
	 * @param: 
	 * @author: 傅里叶级数
	 * @date 2018年11月29日下午7:33:05
	 */
	@RequestMapping("/down_campus_imp_mode")
	public void  downCampusImpMode(HttpServletRequest req, HttpServletResponse res) {
		ReqUtils.download(req.getSession().getServletContext().getRealPath("WEB-INF/xls/campus/campusImp.xls"), req, res);
	}
}
