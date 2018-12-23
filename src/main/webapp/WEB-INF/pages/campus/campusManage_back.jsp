<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>学校管理</title>
  </head>
  
  <body>
  		<div fit="true" class="easyui-panel" border="false">
  		
  			<!-- 学校新增 -->
		 	<div id="campus_add" class="easyui-dialog" title="新增学校" closed="true" modal="true" style="width:850px;height:auto;padding-top:20px;" iconCls="icon-building">
				<table id="campus_add_table" align="center" cellpadding="0"cellspacing="0" style="width: 90%;">
					<tr>
						<td colspan="6">
							<label style="font-size: 12px;color: #999d9c;">请先选择学校所在地区：</label>
						</td>
					</tr>
					<tr>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">省:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<select name="pccode" style="width: 150px;" onchange="selectCityByPeidCampusManage(this.value,'campus_add_table','请选择');">
								<option value="">--请选择--</option>
							</select>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">市:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<select name="ctcode" style="width: 150px;" onchange="selectAreaByCyidCampusManage(this.value,'campus_add_table','请选择');">
								<option value="">--请选择--</option>
							</select>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">县/区:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<select name="aacode" style="width: 150px;" onchange="selectTownByAaidCampusManage(this.value,'campus_add_table','请选择');">
								<option value="">--请选择--</option>
							</select>
						</td>
					</tr>
					<tr>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">学校名称:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="csname"/>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">学校标识码:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="csschid"/>
						</td>
						
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">创办年份:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
						<select name="year" style="width: 150px;">
							<option value="">--全部--</option>
							<c:forEach items="${yearList}" var="yearListVar" varStatus="status">
								<!-- 如果等于当前年默认选中 -->
								<c:if test="${yearListVar.year eq nowyear}">
									<option value="${yearListVar.year}" selected="selected">${yearListVar.year}</option>
								</c:if>
								<!-- 如果不等于当前年不选中 -->
								<c:if test="${yearListVar.year ne nowyear}">
									<option value="${yearListVar.year}">${yearListVar.year}</option>
								</c:if>
			  				</c:forEach>
						  </select>
						</td>
					</tr>
					<tr>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">学校别名:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="csalias"/>
						</td>
						
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">学校性质:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<select name="csxztype" style="width: 150px;" onchange="addCsxztypeOnchange(this.value,'add');">
								<option value="">--请选择--</option>
								<option value="1">公办学校</option>
								<option value="2">民办学校</option>
							</select>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">学校地址:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="cssite" value=""/>
						</td>
					</tr>
					<tr>
						
					</tr>
					
					<tr>
						<td style="padding: 10px 0px 0px 0px;" colspan="6">
							<label style="font-size: 12px;color: #999d9c;">(学校标识码是指由教育部按照国家标准及编码规则编制，赋予每一个学校（机构）在全国范围内唯一的、始终不变的识别标识码)</label>
						</td>
					</tr>
					<tr>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">学校电话:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="csphone"/>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">校长姓名:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="csxz"/>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">校长联系电话:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="csxzphone"/>
						</td>
					</tr>
					<tr>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="font-size: 12px;">分管领导姓名:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="csfgxm"/>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="font-size: 12px;">分管领导职务:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="csfgzw"/>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="font-size: 12px;">分管领导电话:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="csfgdh"/>
						</td>
					</tr>
					
					<tr>
						
					</tr>
					<tr>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="font-size: 12px;">电子邮箱:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="csemail" value=""/>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="font-size: 12px;">邮政编码:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="cszip" value=""/>
						</td>
					</tr>
					<tr>
						<td>
							<label style="font-size: 12px;">学校简介:</label>
						</td>
						<td colspan="5" style="padding: 10px 0px 0px 0px;" align="center">
							<textarea name="csjj" style="font-size: 12px;width: 550px;height: 100px;resize: none;"></textarea>
						</td>
					</tr>
					<tr>
						<td style="padding: 10px 0px 0px 0px;" colspan="6" align="center">
							<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-save" onclick="campus_add();">保存</a>
							<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-cancel" style="margin-left: 10px;" onclick="dialog_close('campus_add');">关闭</a>
						</td>
					</tr>
					<tr style="height: 10px;">
					</tr>
				</table>
			</div>
			
			
			
			<!-- 学校查看 -->
		 	<div id="campus_select_dialog" class="easyui-dialog" title="查看学校" closed="true" modal="true" style="width:860px;height:640px;padding-top:20px;" iconCls="icon-building">
				<table id="campus_select_table" align="center" cellpadding="0"cellspacing="0" style="width: 90%;border-left: 1px solid #0478B5;border-top:  1px solid #0478B5;">
					<thead>
						<tr style="height:40px;">
							<td style="border-bottom: 1px solid #000;border-right: 1px solid #0478B5;background-color: #0478B5;" align="center" colspan="7">
								 <label style="font-size: 16px;margin-left: 15px;color:#fff;">
								 	<img src="images/campus/csinfo.png" style="width: 17px;vertical-align:middle;padding-bottom: 5px;"> 学校基本情况
								 </label>
							</td>
						</tr>
						<tr>
							<td style="padding: 10px 0px 10px 10px;border-bottom: 1px solid #000;border-right: 1px solid #000;" rowspan="3">
								<img src="images/campus/xuexiao.png" name="logo" style="width:80;height:80px;"/>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;width: 100px;">
								<label style="font-size: 12px;">&nbsp;学校名称:</label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;" name="csname"></label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;width: 100px;">
								<label style="font-size: 12px;">&nbsp;学校标识码:</label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;" name="csschid"></label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;width: 100px;">
								<label style="font-size: 12px;">&nbsp;学校类别:</label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #0478B5;">
								<label style="font-size: 12px;" name="cstype"></label>
							</td>
						</tr>
						<tr>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;width: 100px;">
								<label style="font-size: 12px;">&nbsp;学校别名:</label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;" name="csalias"></label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;width: 100px;">
								<label style="font-size: 12px;">&nbsp;学校性质:</label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;" name="csxztype"></label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;width: 100px;">
								<label style="font-size: 12px;">&nbsp;是否附设幼儿班:</label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #0478B5;">
								<label style="font-size: 12px;" name="csyesornonursery"></label>
							</td>
						</tr>
						<tr>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;width: 100px;">
								<label style="font-size: 12px;">&nbsp;创办年份:</label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;" name="year"></label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;">&nbsp;学校地址:</label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #0478B5;" colspan="3">
								<label style="font-size: 12px;" name="cssite"></label>
							</td>
						</tr>
					</thead>
					<tbody>
						<tr style="height:40px;">
							<td style="border-bottom: 1px solid #000;border-right: 1px solid #0478B5;background-color: #0478B5;" align="center" colspan="7">
								 <label style="font-size: 16px;margin-left: 15px;color:#fff;">
								 	<img src="images/campus/cstel.png" style="width: 17px;vertical-align:middle;padding-bottom: 5px;"> 学校联系方式
								 </label>
							</td>
						</tr>
						<tr>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;">&nbsp;学校电话:</label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;" name="csphone"></label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;">&nbsp;校长姓名:</label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;" name="csxz"></label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;">&nbsp;校长联系电话:</label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #0478B5;" colspan="2">
								<label style="font-size: 12px;" name="csxzphone"></label>
							</td>
						</tr>
						<tr>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;">&nbsp;分管领导姓名:</label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;" name="csfgxm"></label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;">&nbsp;分管领导职务:</label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;" name="csfgzw"></label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;">&nbsp;分管领导电话:</label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #0478B5;" colspan="2">
								<label style="font-size: 12px;" name="csfgdh"></label>
							</td>
						</tr>
						<tr>
						   <td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;width: 100px;">
								<label style="font-size: 12px;">&nbsp;法人姓名:</label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;" name="cslegalperson"></label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;width: 100px;">
								<label style="font-size: 12px;">&nbsp;法人电话:</label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;" name="cslegalphone"></label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;width: 100px;">
								<label style="font-size: 12px;">&nbsp;联系QQ:</label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #0478B5;" colspan="2">
								<label style="font-size: 12px;" name="cslegalqq"></label>
							</td>
						</tr>
						<tr>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;">&nbsp;业务人员姓名:</label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;" name="csglxm"></label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;">&nbsp;业务人员职务:</label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;" name="csglzw"></label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;">&nbsp;业务人员电话:</label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #0478B5;" colspan="2">
								<label style="font-size: 12px;" name="csgldh"></label>
							</td>
						</tr>
						<tr>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;">&nbsp;电子邮箱:</label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;" name="csemail"></label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;">&nbsp;邮政编码:</label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;" name="cszip"></label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #0478B5;" colspan="3">
								
							</td>
						</tr>
						<tr>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;">&nbsp;纬度:</label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;" name="cswd"></label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;">&nbsp;经度:</label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;" name="csjd"></label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #0478B5;" colspan="3">
								
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr style="height:40px;">
							<td style="border-bottom: 1px solid #0478B5;border-right: 1px solid #0478B5;background-color: #0478B5;" align="center" colspan="7">
								 <label style="font-size: 16px;margin-left: 15px;color:#fff;">
								 	<img src="images/campus/csinfo.png" style="width: 17px;vertical-align:middle;padding-bottom: 5px;"> 学校简介
								 </label>
							</td>
						</tr>
						<tr style="height:40px;">
							<td colspan="7" style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #0478B5;border-right: 1px solid #0478B5;">
								<label style="font-size: 12px;" name="csjj"></label>
							</td>
						</tr>
					</tfoot>
				</table>
				<table align="center" cellpadding="0"cellspacing="0">
					<tr>
						<td style="padding: 10px 0px;" colspan="4" align="center">
						<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-cancel" style="margin-left: 10px;" onclick="dialog_close('campus_select_dialog');">关闭</a>
						</td>
					</tr>
				</table>
			</div>
  		
  		
  		
  			<!-- 搜索及数据展示 -->
			<div id="campus_search_div" style="height:auto;min-height:1px;float: left;line-height: 35px;width: 100%;">
			
				<!-- 超级管理员搜索框 -->
					<div style="float: left;padding: 5px 5px;height: 35px;">
						<label style="font-size: 12px;">省:</label>
						<select name="pccode" style="width: 150px;" onchange="selectCityByPeidCampusManage(this.value,'campus_search_div','全部');">
							<option value="">--全部--</option>
						</select>
					</div>
					<div style="float: left;padding: 5px 5px;height: 35px;">
						<label style="font-size: 12px;">市:</label>
						<select name="ccode" style="width: 150px;" onchange="selectAreaByCyidCampusManage(this.value,'campus_search_div','全部');">
							<option value="">--全部--</option>
						</select>
					</div>
					<div style="float: left;padding: 5px 5px;height: 35px;">
						<label style="font-size: 12px;">县/区:</label>
						<select name="aacode" style="width: 150px;" onchange="selectTownByAaidCampusManage(this.value,'campus_search_div','全部');">
							<option value="">--全部--</option>
						</select>
					</div>
					<div style="float: left;padding: 5px 5px;height: 35px;">
						<label style="font-size: 12px;">学校名称:</label>
						<input type="text" name ="csname"/>
					</div>
					<div style="float: left;padding: 8px 5px;">
						<a href="javascript:void(0);" title="快捷键(Enter)" class="easyui-linkbutton" iconCls="icon-search" onclick="campus_search();">搜索</a>
					</div>
					<div style="float: left;padding: 8px 5px;">
						<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-add" onclick="campus_add_dialog_open();">新增</a>
					</div>
					<div style="float: left;padding: 8px 5px;">
						<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-cancel" onclick="campus_delBat();">批量删除</a>
					</div>
					<div style="float: left;padding: 8px 5px;">
						<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-page_excel" onclick="campus_search_exp();">搜索导出</a>
					</div>
					<div style="float: left;padding: 8px 5px;">
						<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-building_add" onclick="open_campus_imp();">学校导入</a>
					</div>
			</div>
			<table id="campus_datagrid_table"></table>
			
			
			
			<!-- 学校编辑 -->
		 	<div id="campus_edit_dialog" class="easyui-dialog" title="编辑学校" closed="true" modal="true" style="width:840px;height:780px;padding-top:20px;" iconCls="icon-building_edit">
				<table id="campus_edit_table" align="center" cellpadding="0"cellspacing="0" style="width: 90%;">
					<tr>
						<td colspan="6">
							<label style="font-size: 12px;color: #999d9c;">请先选择学校所在地区：</label>
						</td>
					</tr>
					<tr>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">省:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<select name="peid" style="width: 150px;" onchange="selectCityByPeidCampusManage(this.value,'campus_edit_table','请选择');">
								<option value="">--请选择--</option>
							</select>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">市:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<select name="cyid" style="width: 150px;" onchange="selectAreaByCyidCampusManage(this.value,'campus_edit_table','请选择');">
								<option value="">--请选择--</option>
							</select>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">县/区:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<select name="aaid" style="width: 150px;" onchange="selectTownByAaidCampusManage(this.value,'campus_edit_table','请选择');">
								<option value="">--请选择--</option>
							</select>
						</td>
					</tr>
					<tr>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">&nbsp;</label>
							<label style="font-size: 12px;">镇:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<select name="tnid" style="width: 150px;">
								<option value="">--请选择--</option>
							</select>
						</td>
					</tr>
					<tr>
						<td style="padding: 10px 0px 0px 0px;" colspan="6">
							<label style="font-size: 12px;color: #999d9c;">(选择学校类别如果选择幼儿班时，不显示是否附属幼儿班)</label>
						</td>
					</tr>
					<tr>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">学校名称:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="csname"/>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">学校标识码:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="csschid"/>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-help" title="学校类别年级对照表" onclick="down_campus_table();"></a>
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">学校类别:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<select name="cstype" style="width: 150px;" onchange="addCstypeOnchange(this.value,'edit');">
								<option value="">--请选择--</option>
								<option value="0">幼儿园</option>
								<option value="10">小学教学点</option>
								<option value="1">小学(完全小学)</option>
								<option value="2">初中(初级中学)</option>
								<option value="3">高中(高级中学)</option>
								<option value="4">小学初中(九年一贯制)</option>
								<option value="5">小学高中</option>
								<option value="6">初中高中(完全中学)</option>
								<option value="7">小学初中高中(十二年一贯制)</option>
								<option value="8">中职</option>
								<option value="9">特殊教育</option>
								<option value="12">幼儿园小学教学点</option>
								<option value="13">幼儿园小学</option>
								<option value="14">幼儿园初中</option>
								<option value="15">幼儿园高中</option>
								<option value="16">幼儿园小学初中</option>
								<option value="17">幼儿园小学高中</option>
								<option value="18">幼儿园初中高中</option>
								<option value="19">幼儿园小学初中高中</option>
							</select>
						</td>
					</tr>
					<tr>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">学校别名:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="csalias"/>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">学校性质:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<select name="csxztype" style="width: 150px;" onchange="addCsxztypeOnchange(this.value,'edit');">
								<option value="">--请选择--</option>
								<option value="1">公办学校</option>
								<option value="2">民办学校</option>
							</select>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">是否附设幼儿班:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<select name="csyesornonursery" style="width: 150px;">
								<option value="">--请选择--</option>
								<option value="1">是</option>
								<option value="2">否</option>
							</select>
						</td>
					</tr>
					<tr>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">创办年份</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<select name="year" style="width: 150px;">
								<option value="">--请选择--</option>
								<c:forEach items="${yearList}" var="yearListVar" varStatus="status">
									<!-- 如果等于当前年默认选中 -->
									<c:if test="${yearListVar.year eq nowyear}">
										<option value="${yearListVar.year}" selected="selected">${yearListVar.year}</option>
									</c:if>
									<!-- 如果不等于当前年不选中 -->
									<c:if test="${yearListVar.year ne nowyear}">
										<option value="${yearListVar.year}">${yearListVar.year}</option>
									</c:if>
				  				</c:forEach>
							</select>
						</td>
						<td style="padding: 10px 0px 0px 0px;" align="right">
							<label style="font-size: 12px;">学校logo:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input name="logo" type="file" accept=".jpg,.png,.jpeg,.bmp,.gif" onchange="assemblyEncryptionPathVampusManage(this,'edit');" style="width:150px;"/>
							<input name="nurl" type="hidden"/>
						</td>
					</tr>
					<tr>
						<td style="padding: 10px 0px 0px 0px;" colspan="6">
							<label style="font-size: 12px;color: #999d9c;">(学校标识码是指由教育部按照国家标准及编码规则编制，赋予每一个学校（机构）在全国范围内唯一的、始终不变的识别标识码)</label>
						</td>
					</tr>
					<tr>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">学校电话:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="csphone"/>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">校长姓名:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="csxz"/>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">校长联系电话:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="csxzphone"/>
						</td>
					</tr>
					<tr>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="font-size: 12px;">分管领导姓名:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="csfgxm"/>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="font-size: 12px;">分管领导职务:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="csfgzw"/>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="font-size: 12px;">分管领导电话:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="csfgdh"/>
						</td>
					</tr>
					
					
					
					<tr>
						<td style="padding: 10px 0px 0px 0px;" colspan="6">
							<label style="font-size: 12px;color: #999d9c;">(选择学校性质的民办学校和选择学校类别的幼儿班时，显示法人,电话,联系QQ)</label>
						</td>
					</tr>
					
					<tr>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">法人姓名:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="cslegalperson"/>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">法人电话:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="cslegalphone"/>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">联系QQ:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="cslegalqq"/>
						</td>
					</tr>
					
					
					<tr>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="font-size: 12px;">业务人员姓名:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="csglxm"/>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="font-size: 12px;">业务人员职务:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="csglzw"/>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="font-size: 12px;">业务人员电话:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="csgldh"/>
						</td>
					</tr>
					<tr>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">学校地址:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="cssite" value=""/>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="font-size: 12px;">纬度:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="cswd" value=""/>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="font-size: 12px;">经度:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="csjd" value=""/>
						</td>
					</tr>
					<tr>
						<td style="padding: 10px 0px 0px 0px;" colspan="6">
							<label style="font-size: 12px;color: red;">(纬度，经度主要用于和扶贫云平台对接。实现在地图上进行标记)</label>
						</td>
					</tr>
					<tr>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="font-size: 12px;">电子邮箱:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="csemail" value=""/>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="font-size: 12px;">邮政编码:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="cszip" value=""/>
						</td>
					</tr>
					<tr>
						<td>
							<label style="font-size: 12px;">学校简介:</label>
						</td>
						<td colspan="5" style="padding: 10px 0px 0px 0px;" align="center">
							<textarea name="csjj" style="font-size: 12px;width: 550px;height: 100px;resize: none;"></textarea>
						</td>
					</tr>
					<tr>
						<td style="padding: 10px 0px 0px 0px;" colspan="6" align="center">
							<input type="hidden" name="csid" />
							<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-save" onclick="campus_edit_submit();">保存</a>
							<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-cancel" style="margin-left: 10px;" onclick="dialog_close('campus_edit_dialog');">关闭</a>
						</td>
					</tr>
				</table>
			</div>
			
			
			
			
			
			<!-- 学校帐号 -->
			<div id="campus_users" class="easyui-dialog" title="学校帐号" closed="true" modal="true" style="width:550px;height:280px;" iconCls="icon-user">
				<input name="csid" type="hidden" value="" />
				<div id="campus_users_search_div" style="height:auto;min-height:35px;float: left;line-height: 35px;width: 100%;">
					<div style="float: left;padding: 8px 5px;">
						<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-user-add" onclick="campus_users_add_open();">新增帐号</a>
						<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-cancel" style="margin-left: 10px;" onclick="dialog_close('campus_users');">关闭</a>
					</div>
				</div>
				<table id="campus_users_datagrid"></table>
			</div>
			
			
			
			<!-- 新增校区帐号 -->
			<div id="campus_users_add" class="easyui-dialog" title="新增校区帐号" closed="true" modal="true" style="width:300px;height:270px;" iconCls="icon-user-add">
				<input type="hidden" name="csid" />
				<table style="width: 100%;padding: 20px 0px 0px 0px;">
					<tr>
						<td style="padding: 10px 0px;" align="right">
							<label style="font-size: 12px;">用户名:</label>
						</td>
						<td style="padding: 10px 0px;">
							<input type="text" name="usname"/>
						</td>
					</tr>
					<tr>
						<td style="padding: 10px 0px;" align="right">
							<label style="font-size: 12px;">密码:</label>
						</td>
						<td style="padding: 10px 0px;">
							<input type="password" name="pwd" value="000000"/>
						</td>
					</tr>
					<tr>
						<td style="padding: 10px 0px;" colspan="2" align="center">
							<label style="font-size: 12px;">(默认密码:000000)</label>
						</td>
					</tr>
					<tr>
						<td style="padding: 10px 0px;" colspan="2" align="center">
							<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-save" onclick="submit_campus_users_add();">保存</a>
						</td>
					</tr>
				</table>
			</div>
  		
  		
  			
  			
  			<!-- 学校导入 -->
  			<div id="campus_imp_dialog" class="easyui-dialog" title="学校导入" closed="true" modal="true" style="width:500px;height:290px;" iconCls="icon-building_add">
  				<form id="campus_imp_form" method="post" enctype="multipart/form-data">
	  				<table style="width: 100%;padding: 20px 0px 0px 0px;">
	  					<tr>
							<td style="padding: 10px 0px 0px 5px;" align="left" colspan="2">
								<label style="font-size: 12px;font-weight: bold;">注意:</label>&nbsp;&nbsp;
							</td>
						</tr>
						<tr>
							<td style="padding: 5px 0px 0px 10px;" align="left" colspan="2">
								<label style="font-size: 12px;">[1]请严格按照导入模版进行操作。</label>
								<a href="javascript:void(0);" onclick="down_campus_imp_mode();" style="font-size: 12px;text-decoration: none;">>>点击下载导入模版</a>
							</td>
						</tr>
						<tr>
							<td style="padding: 5px 0px 0px 10px;" align="left" colspan="2">
								<label style="font-size: 12px;">[2]在EXCEL导入模版中红色标记的列为必填列。</label>
							</td>
						</tr>
						<tr>
							<td style="padding: 20px 0px 0px 0px;" align="right">
								<label style="font-size: 12px;font-weight: bold;">选择EXCEL:</label>&nbsp;&nbsp;
							</td>
							<td style="padding: 20px 0px 0px 0px;">
								<input type="file" name="csfile"/>
							</td>
						</tr>
						<tr>
							<td style="padding: 10px 0px;" colspan="2" align="center">
								<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-save" onclick="submit_campus_imp();">保存</a>
							</td>
						</tr>
					</table>
				</form>
  			</div>
  		</div>
  		<script type="text/javascript">
  			//用户权限过滤变量
  			var uspeid='${uspeid}';
  			var uscyid='${uscyid}';
  			var usaaid='${usaaid}';
  			var ustnid='${ustnid}';
  			var uslv='${uslv}';
  			var uslvid='${uslvid}';
  			var csid="";
  			if('${uslv}'==1){
  				csid='${uslvid}';
  			}
  			
  			
  			
  			
  			//组装加密路径
  			function assemblyEncryptionPathVampusManage(e,mod){
  				$.messager.progress({title:"系统提示",msg:"数据保存中,请稍等..."});
  				$.ajax({
  					type:'POST',
  					url:'assemblyEncryptionPathVampusManage_campusNew.htm',
  					data:{
  						fname : e.files[0].name
  					},
  					success:function(r){
  						$.messager.progress('close');
  						r=$.parseJSON(r);
  						if(mod=='add'){
  							$("#campus_add_table input[name='nurl']").val(r.nurl);
  						}else{
  							$("#campus_edit_table input[name='nurl']").val(r.nurl);
  						}
  					},
  					error:function(){
  						$.messager.progress('close');
  						$.messager.alert("系统提示","服务器连接失败","error");
  					}
  				});
  			}
  			
  			
  			
  			
  			
  			//学校新增选择幼儿园输入框控制
  			function addCstypeOnchange(cstype,id){
  				
  				if(cstype=="0"){//如果等于幼儿园
  					$("#campus_"+id+"_table select[name='csyesornonursery']").attr("disabled",true);
  	  				$("#campus_"+id+"_table input[name='cslegalperson']").attr("disabled",false);
  	  				$("#campus_"+id+"_table input[name='cslegalphone']").attr("disabled",false);
  	  				$("#campus_"+id+"_table input[name='cslegalqq']").attr("disabled",false);
  	  				$("#campus_"+id+"_table select[name='csyesornonursery']").val("");
  				}else{
  					$("#campus_"+id+"_table select[name='csyesornonursery']").attr("disabled",false);
  					var csxztype=$("#campus_"+id+"_table select[name='csxztype']").val();
  					if(csxztype=="2"){//是民办学校
  						$("#campus_"+id+"_table input[name='cslegalperson']").attr("disabled",false);
  	  	  				$("#campus_"+id+"_table input[name='cslegalphone']").attr("disabled",false);
  	  	  				$("#campus_"+id+"_table input[name='cslegalqq']").attr("disabled",false);
  					}else{
  	  	  				$("#campus_"+id+"_table input[name='cslegalperson']").attr("disabled",true);
  	  	  				$("#campus_"+id+"_table input[name='cslegalphone']").attr("disabled",true);
  	  	  				$("#campus_"+id+"_table input[name='cslegalqq']").attr("disabled",true);
	  	  	  			$("#campus_"+id+"_table input[name='cslegalperson']").val("");
	  	  				$("#campus_"+id+"_table input[name='cslegalphone']").val("");
	  	  				$("#campus_"+id+"_table input[name='cslegalqq']").val("");
  					}
  					
  				}
  			}
  			
  			//学校新增选择民办输入框控制
  			function addCsxztypeOnchange(csxztype,id){
  				var cstype=$("#campus_"+id+"_table select[name='cstype']").val();
  				if(cstype!=null &&cstype!="0"){//如果学校类别不是幼儿园
  					if(csxztype=="2"){//是民办学校
  	  					$("#campus_"+id+"_table input[name='cslegalperson']").attr("disabled",false);
  	  	  				$("#campus_"+id+"_table input[name='cslegalphone']").attr("disabled",false);
  	  	  				$("#campus_"+id+"_table input[name='cslegalqq']").attr("disabled",false);
  	  				}else{
  	  					$("#campus_"+id+"_table input[name='cslegalperson']").attr("disabled",true);
  	  	  				$("#campus_"+id+"_table input[name='cslegalphone']").attr("disabled",true);
  	  	  				$("#campus_"+id+"_table input[name='cslegalqq']").attr("disabled",true);
  	  	  				
  	  	  				$("#campus_"+id+"_table input[name='cslegalperson']").val("");
	  	  				$("#campus_"+id+"_table input[name='cslegalphone']").val("");
	  	  				$("#campus_"+id+"_table input[name='cslegalqq']").val("");
  	  				}
  				}else{//学校类别是幼儿园
  					$("#campus_"+id+"_table input[name='cslegalperson']").attr("disabled",false);
 	  				$("#campus_"+id+"_table input[name='cslegalphone']").attr("disabled",false);
 	  				$("#campus_"+id+"_table input[name='cslegalqq']").attr("disabled",false);
  				}
  				
  				
  			}
  			
  			//学校导入提交
  			function submit_campus_imp(){
  				//检查是否存在导入文件
  				var importExcel=$("#campus_imp_dialog input[name='csfile']").val();
  				if((importExcel!=null && $.trim(importExcel).length<=0) || importExcel==null){
  					$.messager.alert('消息','请选择导入文件!');
  					return;
  				}
  				$("#campus_imp_form").form('submit',{
  					url : 'importCampus_campus.htm',
  					onSubmit : function() {
  						$.messager.progress({title:'系统提示',text:'数据导入中，请耐心等待，请勿关闭浏览器!'});
  					},
  					success : function(r) {
  						$.messager.progress('close');
  						r = $.parseJSON(r);
  						if(r.result=='502'){
  							$('#campus_datagrid_table').datagrid("reload");
  							$("#campus_imp_dialog").dialog('close');
  							$.messager.alert('系统提示', r.msg,'makegood');
  						}else{
  							$.messager.alert('系统提示', r.msg,'error');
  						}
  					},
  					error : function() {
  						$.messager.progress('close');
  						$.messager.alert('系统提示', '服务器连接失败','error');
  					}
  				});
  			}
  			
  			
  			//下载学校导入模版
  			function down_campus_imp_mode(){
	  			window.open("down_campus_imp_mode.htm");
  			}
  			
  			
  			//打开学校导入窗口
  			function open_campus_imp(){
  				//初始化选择文件
  				$("#campus_imp_dialog input[name='csfile']").val("");
  				$("#campus_imp_dialog").dialog("open");
  			}
  			
  			
  			//根据市系统编号加载县区数据
  			function selectAreaByCyidCampusManage(cyid,xrdiv,tl){
  				if(cyid==null || $.trim(cyid).length<=0){
  					$("#"+xrdiv+" select[name='aaid']").html("<option value=''>--"+tl+"--</option>");
  					$("#"+xrdiv+" select[name='tnid']").html("<option value=''>--"+tl+"--</option>");
  					return;
  				}
  				$.ajax({
					url:"findAreaByCyid_campus.htm",
					type:"post",
					data:{
						cyid : cyid
					},
					success:function(r){
						r=$.parseJSON(r);
						var hl="<option value=''>--"+tl+"--</option>";
						for(var k=0;k<r.length;k++){
							hl+="<option value='"+r[k].AAID+"'>"+r[k].AANAME+"</option>";
						}
						$("#"+xrdiv+" select[name='aaid']").html(hl);
						$("#"+xrdiv+" select[name='tnid']").html("<option value=''>--"+tl+"--</option>");
					},
					error:function(){
						$.messager.alert("系统提示","服务器连接失败","error");
					}
				});
  			}
  			
  			
  			
  			//根据省系统编号加载市数据
  			function selectCityByPeidCampusManage(peid,xrdiv,tl){
  				if(peid==null || $.trim(peid).length<=0){
  					$("#"+xrdiv+" select[name='cyid']").html("<option value=''>--"+tl+"--</option>");
  					$("#"+xrdiv+" select[name='aaid']").html("<option value=''>--"+tl+"--</option>");
  					$("#"+xrdiv+" select[name='tnid']").html("<option value=''>--"+tl+"--</option>");
  					return;
  				}
  				$.ajax({
					url:"findCityByPeid_campus.htm",
					type:"post",
					data:{
						peid : peid
					},
					success:function(r){
						r=$.parseJSON(r);
						var hl="<option value=''>--"+tl+"--</option>";
						for(var k=0;k<r.length;k++){
							hl+="<option value='"+r[k].CYID+"'>"+r[k].CYNAME+"</option>";
						}
						$("#"+xrdiv+" select[name='cyid']").html(hl);
						$("#"+xrdiv+" select[name='aaid']").html("<option value=''>--"+tl+"--</option>");
  						$("#"+xrdiv+" select[name='tnid']").html("<option value=''>--"+tl+"--</option>");
					},
					error:function(){
						$.messager.alert("系统提示","服务器连接失败","error");
					}
				});
  			}
  		
  		
  			//根据县区系统编号查询镇数据
  			function selectTownByAaidCampusManage(aaid,xrdiv,tl){
  				if(aaid==null || $.trim(aaid).length<=0){
  					$("#"+xrdiv+" select[name='tnid']").html("<option value=''>--"+tl+"--</option>");
  					return;
  				}
  				$.ajax({
					url:"selectTownByAaid_campus.htm",
					type:"post",
					data:{
						aaid : aaid
					},
					success:function(r){
						r=$.parseJSON(r);
						var hl="<option value=''>--"+tl+"--</option>";
						for(var k=0;k<r.length;k++){
							hl+="<option value='"+r[k].TNID+"'>"+r[k].TNNAME+"</option>";
						}
						$("#"+xrdiv+" select[name='tnid']").html(hl);
					},
					error:function(){
						$.messager.alert("系统提示","服务器连接失败","error");
					}
				});
  			}
  		
  		
	  		//保存新增帐号
			function submit_campus_users_add(){
				//用户名
				var usname=$.trim($("#campus_users_add input[name='usname']").val());
				if(usname==null || usname.length<=0){
					$.messager.alert("系统提示","请输入用户名","warning");
					$("#campus_users_add input[name='usname']").focus();
					return;
				}
				var reg = /^[0-9a-zA-Z]+$/;
				if(!reg.test(usname)){
					$.messager.alert("系统提示","用户名只能为数字和字母","warning");
					$("#campus_users_add input[name='usname']").focus();
					return;
				}
				//密码
				var pwd=$("#campus_users_add input[name='pwd']").val();
				if(pwd==null || pwd.length<=0){
					$.messager.alert("系统提示","请输入密码","warning");
					$("#campus_users_add input[name='pwd']").focus();
					return;
				}
				//校区系统编号
				var csid=$("#campus_users_add input[name='csid']").val();
				$.messager.progress({title:'系统提示',msg:'数据保存中...'});
				$.ajax({
					url:"submit_addCampusUsers_campus.htm",
					type:"post",
					data:{
						usname : usname,
						pwd : pwd,
						csid : csid
					},
					success:function(r){
						r=$.parseJSON(r);
						$.messager.progress('close');
						if(r.result=="502"){
							$.messager.alert("系统提示",r.msg,"makegood");
							$("#campus_users_add").dialog("close");
							$('#campus_users_datagrid').datagrid("reload");
						}else{
							$.messager.alert("系统提示",r.msg,"error");
						}
					},
					error:function(){
						$.messager.progress('close');
						$.messager.alert("系统提示","服务器连接失败","error");
					}
				});
			}
  		
	  		//打开新增帐号窗口
			function campus_users_add_open(){
				var csid=$("#campus_users input[name='csid']").val();
				$("#campus_users_add input[name='csid']").val(csid);
				$("#campus_users_add").dialog("open");
				$("#campus_users_add input[name='usname']").val("");
				$("#campus_users_add input[name='usname']").focus();
			}
  		
  		
	  		//打开校区帐号管理
			function campus_users_dialog_open(csid){
				$("#campus_users input[name='csid']").val(csid);
				$("#campus_users").dialog("open");
				$('#campus_users_datagrid').datagrid({
					title :'',
					fit : true,
					url : 'list_campus_users.htm',
					queryParams : {
						csid : csid
					},
					rownumbers : true,
					fitColumns :true,
					toolbar:'#campus_users_search_div',
					columns : [[
						{field:'USNAME',title:'帐号',width:120,align:'center'},
						{field:'USSETTIME',title:'注册时间',width:120,align:'center'}
					]]
				});
			}
  		
  			//搜索导出
			function campus_search_exp(){
				var	peid = $("#campus_search_div select[name='peid']").val();
				if(peid=="undefined" || peid==undefined){
					peid="";
				}
				var	cyid = $("#campus_search_div select[name='cyid']").val();
				if(cyid=="undefined" || cyid==undefined){
					cyid="";
				}
				var	aaid = $("#campus_search_div select[name='aaid']").val();
				if(aaid=="undefined" || aaid==undefined){
					aaid="";
				}
				var	tnid = $("#campus_search_div select[name='tnid']").val();
				if(tnid=="undefined" || tnid==undefined){
					tnid="";
				}
				var	cstype = $("#campus_search_div select[name='cstype']").val();
				if(cstype=="undefined" || cstype==undefined){
					cstype="";
				}
				var	csname = $("#campus_search_div input[name='csname']").val();
				if(csname=="undefined" || csname==undefined){
					csname="";
				}
				var	csid = $("#campus_search_div input[name='csid']").val();
				if(csid=="undefined" || csid==undefined){
					csid="";
				}
				var url="list_campusnew_exp.htm?csname="+csname+"&peid="+peid+"&cyid="+cyid+"&aaid="+aaid+"&cstype="+cstype+"&tnid="+tnid+"&csid="+csid;
				window.open(url);
			}
		
			//批量删除
			function campus_delBat(){
				var list=$('#campus_datagrid_table').datagrid("getSelections");
				if(list.length<=0){
					$.messager.alert("系统提示","请选择您要删除的学校","warning");
					return;
				}
				var csIds="";
				for(var i=0;i<list.length;i++){
					if(csIds!=""){
						csIds+=",";
					}
					csIds+=list[i].CSID;
				}
				$.messager.confirm('系统提示',"学校存在帐号不能删除，删除后不可撤销，是否确认删除?",function(btn){
					if(btn){
						$.messager.progress({title:"系统提示",msg:"数据删除中,请稍等..."});
						$.ajax({
							url:"delBaths_campus.htm",
							type:"post",
							data:{
								csId : csIds
							},
							success:function(r){
								$.messager.progress('close');
								r=$.parseJSON(r);
								if(r.result=="502"){
									$('#campus_datagrid_table').datagrid("reload");
									$.messager.alert("系统提示",r.msg,"makegood");
								}else{
									$.messager.alert("系统提示",r.msg,"error");
								}
							},
							error:function(){
								$.messager.progress('close');
								$.messager.alert("系统提示","服务器连接失败","error");
							}
						});
					}
				});
			}
		
		
			//学校删除
			function campus_del(csid){
				$.messager.confirm('系统提示',"学校存在帐号不能删除，删除后不可撤销，是否确认删除?",function(btn){
					if(btn){
						$.messager.progress({title:"系统提示",msg:"数据删除中,请稍等..."});
						$.ajax({
							url: "delCampus_campus.htm",
							type: "POST",
							data:{
								csid : csid
							},
							success: function(r){
								$.messager.progress('close');
								r=$.parseJSON(r);
								if(r.result=="502"){
									$('#campus_datagrid_table').datagrid("reload");
									$.messager.alert("系统提示",r.msg,"makegood");
								}else{
									$.messager.alert("系统提示",r.msg,"error");
								}
							},
							error:function(){
								$.messager.progress('close');
								$.messager.alert("系统提示","服务器连接失败","error");
							} 
						});
			 		}
			 	});
  			}
  		
  		
			
			
			
			//编辑提交保存上传oss
			function campus_edit_submit(){
				//省
  				var peid=$("#campus_edit_table select[name='peid']").val();
  				if(peid==null || peid==""){
  					$.messager.alert("系统提示","请选择所在省","warning");
  					return;
  				}
  				//市
  				var cyid=$("#campus_edit_table select[name='cyid']").val();
  				if(cyid==null || cyid==""){
  					$.messager.alert("系统提示","请选择所在市","warning");
  					return;
  				}
  				//县区
  				var aaid=$("#campus_edit_table select[name='aaid']").val();
  				if(aaid==null || aaid==""){
  					$.messager.alert("系统提示","请选择所在县/区","warning");
  					return;
  				}
  				//镇
  				var tnid=$("#campus_edit_table select[name='tnid']").val();
  				//学校名称
  				var csname=$("#campus_edit_table input[name='csname']").val();
  				if(csname==null || $.trim(csname).length<=0){
  					$.messager.alert("系统提示","请填写学校名称","warning");
  					return;
  				}
  				//学校标识码
  				var csschid=$("#campus_edit_table input[name='csschid']").val();
  				if(csschid==null || $.trim(csschid).length<=0){
  					$.messager.alert("系统提示","请填写学校标识码","warning");
  					return;
  				}
  				//学校类别
  				var cstype=$("#campus_edit_table select[name='cstype']").val();
  				if(cstype==null || $.trim(cstype).length<=0){
  					$.messager.alert("系统提示","请选择学校类别","warning");
  					return;
  				}
  				//学校别名
  				var csalias=$("#campus_edit_table input[name='csalias']").val();
  				if(csalias==null || $.trim(csalias).length<=0){
  					$.messager.alert("系统提示","请填写学校别名","warning");
  					return;
  				}
  				
  				
  			    //年
  				var year=$("#campus_edit_table select[name='year']").val();
  				if(year==null || $.trim(year).length<=0){
  					$.messager.alert("系统提示","请选择创办年份","warning");
  					return;
  				}
  				//学校性质
  				var csxztype=$("#campus_edit_table select[name='csxztype']").val();
  				if(csxztype==null || $.trim(csxztype).length<=0){
  					$.messager.alert("系统提示","请选择学校性质","warning");
  					return;
  				}
  				//如果学校类别等于0或学校性质等于2，那就判断是否是附属学校
  				var csyesornonursery=$("#campus_edit_table select[name='csyesornonursery']").val();
  				if(cstype!="0"&&(csyesornonursery==null || $.trim(csyesornonursery).length<=0)){
  					$.messager.alert("系统提示","请选择是否附设幼儿班","warning");
  					return;
  				}
  				
  				//如果学校类别等于0或学校性质等于2，那就判断法人
  				var cslegalperson=$("#campus_edit_table input[name='cslegalperson']").val();
  				if((cstype=="0"||csxztype=="2")&&(cslegalperson==null || $.trim(cslegalperson).length<=0)){
  					$.messager.alert("系统提示","请输入法人姓名","warning");
  					return;
  				}
  				//如果学校类别等于0或学校性质等于2，那就判断法人电话
  				var cslegalphone=$("#campus_edit_table input[name='cslegalphone']").val();
  				if((cstype=="0"||csxztype=="2")&&(cslegalphone==null || $.trim(cslegalphone).length<=0)){
  					$.messager.alert("系统提示","请输入法人电话","warning");
  					return;
  				}
  				//如果学校类别等于0或学校性质等于2，那就判断法人QQ
  				var cslegalqq=$("#campus_edit_table input[name='cslegalqq']").val();
  				if((cstype=="0"||csxztype=="2")&&(cslegalqq==null || $.trim(cslegalqq).length<=0)){
  					$.messager.alert("系统提示","请输入法人QQ","warning");
  					return;
  				}
  				
  				//学校电话
  				var csphone=$("#campus_edit_table input[name='csphone']").val();
  				if(csphone==null || $.trim(csphone).length<=0){
  					$.messager.alert("系统提示","请填写学校电话","warning");
  					return;
  				}
  				//校长姓名
  				var csxz=$("#campus_edit_table input[name='csxz']").val();
  				if(csxz==null || $.trim(csxz).length<=0){
  					$.messager.alert("系统提示","请填写校长姓名","warning");
  					return;
  				}
  				//校长联系电话
  				var csxzphone=$("#campus_edit_table input[name='csxzphone']").val();
  				if(csxzphone==null || $.trim(csxzphone).length<=0){
  					$.messager.alert("系统提示","请填写校长联系电话","warning");
  					return;
  				}
  				//分管领导姓名
  				var csfgxm=$("#campus_edit_table input[name='csfgxm']").val();
  				//分管领导职务
  				var csfgzw=$("#campus_edit_table input[name='csfgzw']").val();
  				//分管领导电话
  				var csfgdh=$("#campus_edit_table input[name='csfgdh']").val();
  				//管理人员姓名
  				var csglxm=$("#campus_edit_table input[name='csglxm']").val();
  				//管理人员职务
  				var csglzw=$("#campus_edit_table input[name='csglzw']").val();
  				//管理人员电话
  				var csgldh=$("#campus_edit_table input[name='csgldh']").val();
  				//学校地址
  				var cssite=$("#campus_edit_table input[name='cssite']").val();
  				if(cssite==null || $.trim(cssite).length<=0){
  					$.messager.alert("系统提示","请填写学校地址","warning");
  					return;
  				}
  				//纬度
  				var cswd=$("#campus_edit_table input[name='cswd']").val();
  				//经度
  				var csjd=$("#campus_edit_table input[name='csjd']").val();
  				//电子邮箱
  				var csemail=$("#campus_edit_table input[name='csemail']").val();
  				if($.trim(csemail).length>0){
  					var reg =/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
  					if(!reg.test(csemail)){
  						$.messager.alert("系统提示","请正确填写邮箱,格式为XXXX@XX.XX","warning");
  						return;
  					}
  				}
  				//邮政编码
  				var cszip=$("#campus_edit_table input[name='cszip']").val();
  				//学校简介
  				var csjj=$("#campus_edit_table textarea[name='csjj']").val();
  				//学校系统编号
  				var csid=$("#campus_edit_table input[name='csid']").val();
  				//获取学校logo
  				var logo=$("#campus_edit_table input[name='logo']").val();
  				//判断是否上传logo
  				if((logo!=null && $.trim(logo).length<=0) || logo==null){
  					//获取原学校logo
  	  				var nurl=$("#campus_edit_table input[name='nurl']").val();
  					//判断学校类别并提示
  	  				if(cstype=="8" || cstype=="9"){
  	  					$.messager.confirm('系统提示',"学校类别选择中职或特殊教育后不能修改为其他类别，是否确认保存?",function(btn){
  	  						if(btn){
  	  							$.messager.progress({title:"系统提示",msg:"数据保存中,请稍等..."});
  	  			  				$.ajax({
  	  								url:"editCampus_campus.htm",
  	  								type:"post",
  	  								data:{
  	  									aaid : aaid,
  	  									csname : csname,
  	  									csschid : csschid,
  	  									cstype : cstype,
  	  									csphone : csphone,
  	  									csxz : csxz,
  	  									csxzphone : csxzphone,
  	  									csfgxm : csfgxm,
  	  									csfgzw : csfgzw,
  	  									csfgdh : csfgdh,
  	  									csglxm : csglxm,
  	  									csglzw : csglzw,
  	  									csgldh : csgldh,
  	  									cssite : cssite,
  	  									cswd : cswd,
  	  									csjd : csjd,
  	  									csemail : csemail,
  	  									cszip : cszip,
  	  									csjj : csjj,
  	  									csid : csid,
  	  									tnid : tnid,
  	  									year:year,
  	  									csxztype:csxztype,
  	  									cslegalqq:cslegalqq,
  	  									cslegalphone:cslegalphone,
  	  									cslegalperson:cslegalperson,
  	  									csyesornonursery:csyesornonursery,
  	  									csalias : csalias,
  	  									logo : nurl
  	  								},
  	  								success:function(r){
  	  									$.messager.progress('close');
  	  									r=$.parseJSON(r);
  	  									if(r.result=="502"){
  	  										$("#campus_edit_dialog").dialog("close");
  	  										$.messager.alert("系统提示",r.msg,"makegood");
  	  										$('#campus_datagrid_table').datagrid("reload");
  	  									}else{
  	  										$.messager.alert("系统提示",r.msg,"error");
  	  									}
  	  								},
  	  								error:function(){
  	  									$.messager.progress('close');
  	  									$.messager.alert("系统提示","服务器连接失败","error");
  	  								}
  	  							});
  	  						}
  	  					});
  	  				}else{
  	  					$.messager.progress({title:"系统提示",msg:"数据保存中,请稍等..."});
  	  	  				$.ajax({
  	  						url:"editCampus_campus.htm",
  	  						type:"post",
  	  						data:{
  	  							aaid : aaid,
  	  							csname : csname,
  	  							csschid : csschid,
  	  							cstype : cstype,
  	  							csphone : csphone,
  	  							csxz : csxz,
  	  							csxzphone : csxzphone,
  	  							csfgxm : csfgxm,
  	  							csfgzw : csfgzw,
  	  							csfgdh : csfgdh,
  	  							csglxm : csglxm,
  	  							csglzw : csglzw,
  	  							csgldh : csgldh,
  	  							cssite : cssite,
  	  							cswd : cswd,
  	  							csjd : csjd,
  	  							csemail : csemail,
  	  							cszip : cszip,
  	  							csjj : csjj,
  	  							csid : csid,
  	  							tnid : tnid,
  	  							year:year,
  	  							csxztype:csxztype,
  	  							cslegalqq:cslegalqq,
  	  							cslegalphone:cslegalphone,
  	  							cslegalperson:cslegalperson,
  	  							csyesornonursery:csyesornonursery,
  	  							csalias : csalias,
								logo : nurl
  	  						},
  	  						success:function(r){
  	  							$.messager.progress('close');
  	  							r=$.parseJSON(r);
  	  							if(r.result=="502"){
  	  								$("#campus_edit_dialog").dialog("close");
  	  								$.messager.alert("系统提示",r.msg,"makegood");
  	  								$('#campus_datagrid_table').datagrid("reload");
  	  							}else{
  	  								$.messager.alert("系统提示",r.msg,"error");
  	  							}
  	  						},
  	  						error:function(){
  	  							$.messager.progress('close');
  	  							$.messager.alert("系统提示","服务器连接失败","error");
  	  						}
  	  					});
  	  				}
  				}else{
  					//判断学校类别并提示
  	  				if(cstype=="8" || cstype=="9"){
  	  					$.messager.confirm('系统提示',"学校类别选择中职或特殊教育后不能修改为其他类别，是否确认保存?",function(btn){
	  						if(btn){
  	  						//判断文件大小
  	  						if(checkUploadFileSize(5,$("#campus_edit_table input[name='logo']")[0].files[0])==false){
  	  							$.messager.alert("系统提示","文件大小不能超过5M","warning");
  	  							return;
  	  						}
  	  						$.messager.progress({title:'系统提示',text:'数据保存中'});
  	  						var aliyun_oss_key = $("#campus_edit_table input[name='nurl']").val(); 
  	  						var aliyun_oss_staff_fd = new FormData();
  	  						aliyun_oss_staff_fd.append("key", aliyun_oss_key);
  	  						aliyun_oss_staff_fd.append("policy", policyBase64);
  	  						aliyun_oss_staff_fd.append("OSSAccessKeyId", accessid);
  	  						aliyun_oss_staff_fd.append("success_action_status", 200);
  	  						aliyun_oss_staff_fd.append("signature", signature);
  	  						aliyun_oss_staff_fd.append("file", $("#campus_edit_table input[name='logo']")[0].files[0]);
  	  						
  	  						aliyun_oss_staff_xhr = new XMLHttpRequest(); 
  	  						aliyun_oss_staff_xhr.onreadystatechange = campus_edit_submit_go;  
  	  						aliyun_oss_staff_xhr.open("POST", host);
  	  						aliyun_oss_staff_xhr.send(aliyun_oss_staff_fd);
	  						}
	  					});
					}else{
						//判断文件大小
						if(checkUploadFileSize(5,$("#campus_edit_table input[name='logo']")[0].files[0])==false){
							$.messager.alert("系统提示","文件大小不能超过5M","warning");
							return;
						}
						$.messager.progress({title:'系统提示',text:'数据保存中'});
						var aliyun_oss_key = $("#campus_edit_table input[name='nurl']").val(); 
						var aliyun_oss_staff_fd = new FormData();
						aliyun_oss_staff_fd.append("key", aliyun_oss_key);
						aliyun_oss_staff_fd.append("policy", policyBase64);
						aliyun_oss_staff_fd.append("OSSAccessKeyId", accessid);
						aliyun_oss_staff_fd.append("success_action_status", 200);
						aliyun_oss_staff_fd.append("signature", signature);
						aliyun_oss_staff_fd.append("file", $("#campus_edit_table input[name='logo']")[0].files[0]);
						
						aliyun_oss_staff_xhr = new XMLHttpRequest(); 
						aliyun_oss_staff_xhr.onreadystatechange = campus_edit_submit_go;  
						aliyun_oss_staff_xhr.open("POST", host);
						aliyun_oss_staff_xhr.send(aliyun_oss_staff_fd);
					}
  	  			}
			}
			
			
			
			
			
  			//校区编辑保存
  			function campus_edit_submit_go(){
  				if(aliyun_oss_staff_xhr.readyState == 4){
					if (aliyun_oss_staff_xhr.status == 200){
						//判断附件
		  				var nurl=$("#campus_edit_table input[name='nurl']").val();
		  				nurl = host+"/"+nurl;
		  				//省
		  				var peid=$("#campus_edit_table select[name='peid']").val();
		  				if(peid==null || peid==""){
		  					$.messager.alert("系统提示","请选择所在省","warning");
		  					return;
		  				}
		  				//市
		  				var cyid=$("#campus_edit_table select[name='cyid']").val();
		  				if(cyid==null || cyid==""){
		  					$.messager.alert("系统提示","请选择所在市","warning");
		  					return;
		  				}
		  				//县区
		  				var aaid=$("#campus_edit_table select[name='aaid']").val();
		  				if(aaid==null || aaid==""){
		  					$.messager.alert("系统提示","请选择所在县/区","warning");
		  					return;
		  				}
		  				//镇
		  				var tnid=$("#campus_edit_table select[name='tnid']").val();
		  				//学校名称
		  				var csname=$("#campus_edit_table input[name='csname']").val();
		  				if(csname==null || $.trim(csname).length<=0){
		  					$.messager.alert("系统提示","请填写学校名称","warning");
		  					return;
		  				}
		  				//学校标识码
		  				var csschid=$("#campus_edit_table input[name='csschid']").val();
		  				if(csschid==null || $.trim(csschid).length<=0){
		  					$.messager.alert("系统提示","请填写学校标识码","warning");
		  					return;
		  				}
		  				//学校类别
		  				var cstype=$("#campus_edit_table select[name='cstype']").val();
		  				if(cstype==null || $.trim(cstype).length<=0){
		  					$.messager.alert("系统提示","请选择学校类别","warning");
		  					return;
		  				}
		  				//学校别名
		  				var csalias=$("#campus_edit_table input[name='csalias']").val();
		  				if(csalias==null || $.trim(csalias).length<=0){
		  					$.messager.alert("系统提示","请填写学校别名","warning");
		  					return;
		  				}
		  				
		  				
		  			    //年
		  				var year=$("#campus_edit_table select[name='year']").val();
		  				if(year==null || $.trim(year).length<=0){
		  					$.messager.alert("系统提示","请选择创办年份","warning");
		  					return;
		  				}
		  				//学校性质
		  				var csxztype=$("#campus_edit_table select[name='csxztype']").val();
		  				if(csxztype==null || $.trim(csxztype).length<=0){
		  					$.messager.alert("系统提示","请选择学校性质","warning");
		  					return;
		  				}
		  				//如果学校类别等于0或学校性质等于2，那就判断是否是附属学校
		  				var csyesornonursery=$("#campus_edit_table select[name='csyesornonursery']").val();
		  				if(cstype!="0"&&(csyesornonursery==null || $.trim(csyesornonursery).length<=0)){
		  					$.messager.alert("系统提示","请选择是否附设幼儿班","warning");
		  					return;
		  				}
		  				
		  				//如果学校类别等于0或学校性质等于2，那就判断法人
		  				var cslegalperson=$("#campus_edit_table input[name='cslegalperson']").val();
		  				if((cstype=="0"||csxztype=="2")&&(cslegalperson==null || $.trim(cslegalperson).length<=0)){
		  					$.messager.alert("系统提示","请输入法人姓名","warning");
		  					return;
		  				}
		  				//如果学校类别等于0或学校性质等于2，那就判断法人电话
		  				var cslegalphone=$("#campus_edit_table input[name='cslegalphone']").val();
		  				if((cstype=="0"||csxztype=="2")&&(cslegalphone==null || $.trim(cslegalphone).length<=0)){
		  					$.messager.alert("系统提示","请输入法人电话","warning");
		  					return;
		  				}
		  				//如果学校类别等于0或学校性质等于2，那就判断法人QQ
		  				var cslegalqq=$("#campus_edit_table input[name='cslegalqq']").val();
		  				if((cstype=="0"||csxztype=="2")&&(cslegalqq==null || $.trim(cslegalqq).length<=0)){
		  					$.messager.alert("系统提示","请输入法人QQ","warning");
		  					return;
		  				}
		  				
		  				//学校电话
		  				var csphone=$("#campus_edit_table input[name='csphone']").val();
		  				if(csphone==null || $.trim(csphone).length<=0){
		  					$.messager.alert("系统提示","请填写学校电话","warning");
		  					return;
		  				}
		  				//校长姓名
		  				var csxz=$("#campus_edit_table input[name='csxz']").val();
		  				if(csxz==null || $.trim(csxz).length<=0){
		  					$.messager.alert("系统提示","请填写校长姓名","warning");
		  					return;
		  				}
		  				//校长联系电话
		  				var csxzphone=$("#campus_edit_table input[name='csxzphone']").val();
		  				if(csxzphone==null || $.trim(csxzphone).length<=0){
		  					$.messager.alert("系统提示","请填写校长联系电话","warning");
		  					return;
		  				}
		  				//分管领导姓名
		  				var csfgxm=$("#campus_edit_table input[name='csfgxm']").val();
		  				//分管领导职务
		  				var csfgzw=$("#campus_edit_table input[name='csfgzw']").val();
		  				//分管领导电话
		  				var csfgdh=$("#campus_edit_table input[name='csfgdh']").val();
		  				//管理人员姓名
		  				var csglxm=$("#campus_edit_table input[name='csglxm']").val();
		  				//管理人员职务
		  				var csglzw=$("#campus_edit_table input[name='csglzw']").val();
		  				//管理人员电话
		  				var csgldh=$("#campus_edit_table input[name='csgldh']").val();
		  				//学校地址
		  				var cssite=$("#campus_edit_table input[name='cssite']").val();
		  				if(cssite==null || $.trim(cssite).length<=0){
		  					$.messager.alert("系统提示","请填写学校地址","warning");
		  					return;
		  				}
		  				//纬度
		  				var cswd=$("#campus_edit_table input[name='cswd']").val();
		  				//经度
		  				var csjd=$("#campus_edit_table input[name='csjd']").val();
		  				//电子邮箱
		  				var csemail=$("#campus_edit_table input[name='csemail']").val();
		  				if($.trim(csemail).length>0){
		  					var reg =/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
		  					if(!reg.test(csemail)){
		  						$.messager.alert("系统提示","请正确填写邮箱,格式为XXXX@XX.XX","warning");
		  						return;
		  					}
		  				}
		  				//邮政编码
		  				var cszip=$("#campus_edit_table input[name='cszip']").val();
		  				//学校简介
		  				var csjj=$("#campus_edit_table textarea[name='csjj']").val();
		  				//学校系统编号
		  				var csid=$("#campus_edit_table input[name='csid']").val();
		  				
		  				
						$.messager.progress({title:"系统提示",msg:"数据保存中,请稍等..."});
		  				$.ajax({
							url:"editCampus_campus.htm",
							type:"post",
							data:{
								aaid : aaid,
								csname : csname,
								csschid : csschid,
								cstype : cstype,
								csphone : csphone,
								csxz : csxz,
								csxzphone : csxzphone,
								csfgxm : csfgxm,
								csfgzw : csfgzw,
								csfgdh : csfgdh,
								csglxm : csglxm,
								csglzw : csglzw,
								csgldh : csgldh,
								cssite : cssite,
								cswd : cswd,
								csjd : csjd,
								csemail : csemail,
								cszip : cszip,
								csjj : csjj,
								csid : csid,
								tnid : tnid,
								year:year,
								csxztype:csxztype,
								cslegalqq:cslegalqq,
								cslegalphone:cslegalphone,
								cslegalperson:cslegalperson,
								csyesornonursery:csyesornonursery,
								csalias : csalias,
								logo : nurl
							},
							success:function(r){
								$.messager.progress('close');
								r=$.parseJSON(r);
								if(r.result=="502"){
									$("#campus_edit_dialog").dialog("close");
									$.messager.alert("系统提示",r.msg,"makegood");
									$('#campus_datagrid_table').datagrid("reload");
								}else{
									$.messager.alert("系统提示",r.msg,"error");
								}
							},
							error:function(){
								$.messager.progress('close');
								$.messager.alert("系统提示","服务器连接失败","error");
							}
						});
					}
  				}
  			}
  		
  			//打开校区编辑
  			function campus_edit_dialog_open(csid){
  				//根据校区系统编号查询校区信息
  				$.messager.progress({title:"系统提示",msg:"数据提取中,请稍等..."});
  				//学校名称
  				$("#campus_edit_table input[name='csname']").val("");
  				//学校标识码
  				$("#campus_edit_table input[name='csschid']").val("");
  				//学校类别
  				$("#campus_edit_table select[name='cstype']").val("");
  				//学校别名
  				$("#campus_edit_table input[name='csalias']").val("");
  				//学校电话
  				$("#campus_edit_table input[name='csphone']").val("");
  				//校长姓名
  				$("#campus_edit_table input[name='csxz']").val("");
  				//是否是附设幼儿园
  				$("#campus_edit_table select[name='csyesornonursery']").val("");
  				//法人姓名
  				$("#campus_edit_dialog input[name='cslegalperson']").val("");
  				//法人电话
	  			$("#campus_edit_dialog input[name='cslegalphone']").val("");
	  			//联系QQ
	  			$("#campus_edit_dialog input[name='cslegalqq']").val("");
	  			
	  			//这是给他们初始化文本框为可编辑
	  			$("#campus_edit_dialog input[name='cslegalperson']").attr("disabled",false);
	  			$("#campus_edit_dialog input[name='cslegalphone']").attr("disabled",false);
	  			$("#campus_edit_dialog input[name='cslegalqq']").attr("disabled",false);
	  			$("#campus_edit_table select[name='csyesornonursery']").attr("disabled",false); 
	  			
  				//校长联系电话
  				$("#campus_edit_table input[name='csxzphone']").val("");
  				//分管领导姓名
  				$("#campus_edit_table input[name='csfgxm']").val("");
  				//分管领导职务
  				$("#campus_edit_table input[name='csfgzw']").val("");
  				//分管领导电话
  				$("#campus_edit_table input[name='csfgdh']").val("");
  				//管理人员姓名
  				$("#campus_edit_table input[name='csglxm']").val("");
  				//管理人员职务
  				$("#campus_edit_table input[name='csglzw']").val("");
  				//管理人员电话
  				$("#campus_edit_table input[name='csgldh']").val("");
  				//学校地址
  				$("#campus_edit_table input[name='cssite']").val("");
  				//纬度
  				$("#campus_edit_table input[name='cswd']").val("");
  				//经度
  				$("#campus_edit_table input[name='csjd']").val("");
  				//电子邮箱
  				$("#campus_edit_table input[name='csemail']").val("");
  				//邮政编码
  				$("#campus_edit_table input[name='cszip']").val("");
  				//学校简介
  				$("#campus_edit_table textarea[name='csjj']").val("");
  				//logo
  				$("#campus_edit_table input[name='logo']").val("");
  				$("#campus_edit_table input[name='nurl']").val("");
  				//学校类别
  				$("#campus_edit_table select[name='tnid']").html("<option value=''>--请选择--</option>");
  				$.ajax({
					url:"findCampusByCsid_campus.htm",
					type:"post",
					data:{
						csid : csid
					},
					success:function(r){
						$.messager.progress('close');
						r=$.parseJSON(r);
						//学校名称
		  				$("#campus_edit_table input[name='csname']").val(r.CSNAME);
		  				//学校标识码
		  				$("#campus_edit_table input[name='csschid']").val(r.CSSCHID);
		  				//学校类别
		  				$("#campus_edit_table select[name='cstype']").val(r.CSTYPE);
		  				//判断学校类别如果为中职或特殊教育就不能修改为其他类别
		  				if(r.CSTYPE=="8" || r.CSTYPE=="9"){
		  					$("#campus_edit_table select[name='cstype']").attr("disabled",true);
		  				}else{
		  					$("#campus_edit_table select[name='cstype']").attr("disabled",false);
		  				}
		  				if(r.CSTYPE=="0"){
		  					$("#campus_edit_table select[name='csyesornonursery']").attr("disabled",true);
		  				}else{
		  					//市否是附设幼儿园
			  				$("#campus_edit_table select[name='csyesornonursery']").val(r.CSYESORNONURSERY);
		  				}
		  				
		  				//学校别名
		  				$("#campus_edit_table input[name='csalias']").val(r.CSALIAS);
		  				
		  				//学校性质
		  				$("#campus_edit_table select[name='csxztype']").val(r.CSXZTYPE);
		  				if(r.CSTYPE!="0"){
		  					if(r.CSXZTYPE!="2"){
		  						//将select元素设置为readonly
			  	  				$("#campus_edit_dialog input[name='cslegalperson']").attr("disabled",true);
			  	  				$("#campus_edit_dialog input[name='cslegalphone']").attr("disabled",true);
			  	  				$("#campus_edit_dialog input[name='cslegalqq']").attr("disabled",true);
		  					}
		  				}
		  				//创办年份
		  				$("#campus_edit_table select[name='year']").val(r.YEAR);
		  				
		  				//法人姓名
		  				$("#campus_edit_table input[name='cslegalperson']").val(r.CSLEGALPERSON);
		  				//法人电话
		  				$("#campus_edit_table input[name='cslegalphone']").val(r.CSLEGALPHONE);
		  				//联系QQ
		  				$("#campus_edit_table input[name='cslegalqq']").val(r.CSLEGALQQ);
		  				
		  				//学校电话
		  				$("#campus_edit_table input[name='csphone']").val(r.CSPHONE);
		  				//校长姓名
		  				$("#campus_edit_table input[name='csxz']").val(r.CSXZ);
		  				//校长联系电话
		  				$("#campus_edit_table input[name='csxzphone']").val(r.CSXZPHONE);
		  				//分管领导姓名
		  				$("#campus_edit_table input[name='csfgxm']").val(r.CSFGXM);
		  				//分管领导职务
		  				$("#campus_edit_table input[name='csfgzw']").val(r.CSFGZW);
		  				//分管领导电话
		  				$("#campus_edit_table input[name='csfgdh']").val(r.CSFGDH);
		  				//管理人员姓名
		  				$("#campus_edit_table input[name='csglxm']").val(r.CSGLXM);
		  				//管理人员职务
		  				$("#campus_edit_table input[name='csglzw']").val(r.CSGLZW);
		  				//管理人员电话
		  				$("#campus_edit_table input[name='csgldh']").val(r.CSGLDH);
		  				//学校地址
		  				$("#campus_edit_table input[name='cssite']").val(r.CSSITE);
		  				//纬度
		  				$("#campus_edit_table input[name='cswd']").val(r.CSWD);
		  				//经度
		  				$("#campus_edit_table input[name='csjd']").val(r.CSJD);
		  				//电子邮箱
		  				$("#campus_edit_table input[name='csemail']").val(r.CSEMAIL);
		  				//邮政编码
		  				$("#campus_edit_table input[name='cszip']").val(r.CSZIP);
		  				//学校简介
		  				$("#campus_edit_table textarea[name='csjj']").val(r.CSJJ);
		  				//学校系统编号
		  				$("#campus_edit_table input[name='csid']").val(r.CSID);
		  				//学校logo
		  				$("#campus_edit_table input[name='nurl']").val(r.CSLOGO);
		  				var peid=r.PEID;
		  				var cyid=r.CYID;
		  				var aaid=r.AAID;
		  				var tnid=r.TNID;
		  				
		  				//提取所有省数据
		  				$.ajax({
							url:"findAllProvince_campus.htm",
							type:"post",
							async:false,
							success:function(r){
								r=$.parseJSON(r);
								var html="<option value=''>--请选择--</option>";
								for(var i=0;i<r.length;i++){
									html+="<option value='"+r[i].PEID+"'>"+r[i].PENAME+"</option>";
								}
								$("#campus_edit_table select[name='peid']").html(html);
								$("#campus_edit_table select[name='peid']").val(peid);
								//判断登录用户是否存在省级别
								if(uspeid!=null && uspeid!=""){
									$("#campus_edit_table select[name='peid']").attr("disabled",true);
								}
							},
							error:function(){
								$.messager.progress('close');
								$.messager.alert("系统提示","服务器连接失败","error");
							}
						});
						//根据省系统编号提取市数据
						$.ajax({
							url:"findCityByPeid_campus.htm",
							type:"post",
							async:false,
							data:{
								peid : peid
							},
							success:function(r){
								r=$.parseJSON(r);
								var hml="<option value=''>--请选择--</option>";
								for(var j=0;j<r.length;j++){
									hml+="<option value='"+r[j].CYID+"'>"+r[j].CYNAME+"</option>";
								}
								$("#campus_edit_table select[name='cyid']").html(hml);
								$("#campus_edit_table select[name='cyid']").val(cyid);
								//判断登录用户是否存在市级别
								if(uscyid!=null && uscyid!=""){
									$("#campus_edit_table select[name='cyid']").attr("disabled",true);
								}
							},
							error:function(){
								$.messager.progress('close');
								$.messager.alert("系统提示","服务器连接失败","error");
							}
						});
						//根据市系统编号查询县区数据
						$.ajax({
							url:"findAreaByCyid_campus.htm",
							type:"post",
							async:false,
							data:{
								cyid : cyid
							},
							success:function(r){
								r=$.parseJSON(r);
								var hl="<option value=''>--请选择--</option>";
								for(var k=0;k<r.length;k++){
									hl+="<option value='"+r[k].AAID+"'>"+r[k].AANAME+"</option>";
								}
								$("#campus_edit_table select[name='aaid']").html(hl);
								$("#campus_edit_table select[name='aaid']").val(aaid);
								//判断登录用户是否存在县区级别
								if(usaaid!=null && usaaid!=""){
									$("#campus_edit_table select[name='aaid']").attr("disabled",true);
								}
							},
							error:function(){
								$.messager.progress('close');
								$.messager.alert("系统提示","服务器连接失败","error");
							}
						});
						//根据县区查询镇数据
						$.ajax({
							url:"selectTownByAaid_campus.htm",
							type:"post",
							data:{
								aaid : aaid
							},
							success:function(r){
								r=$.parseJSON(r);
								var hl="<option value=''>--请选择--</option>";
								for(var k=0;k<r.length;k++){
									hl+="<option value='"+r[k].TNID+"'>"+r[k].TNNAME+"</option>";
								}
								$("#campus_edit_table select[name='tnid']").html(hl);
								$("#campus_edit_table select[name='tnid']").val(tnid);
								//判断登录用户是否存在镇级别
								if(ustnid!=null && ustnid!=""){
									$("#campus_edit_table select[name='tnid']").attr("disabled",true);
								}
							},
							error:function(){
								$.messager.alert("系统提示","服务器连接失败","error");
							}
						});
						$("#campus_edit_dialog").dialog("open");
					},
					error:function(){
						$.messager.progress('close');
						$.messager.alert("系统提示","服务器连接失败","error");
					}
				});
				
			}
		
			//校区搜索
			function campus_search(){
				$('#campus_datagrid_table').datagrid("load",{
					peid : $("#campus_search_div select[name='peid']").val(),
					cyid : $("#campus_search_div select[name='cyid']").val(),
					aaid : $("#campus_search_div select[name='aaid']").val(),
					cstype : $("#campus_search_div select[name='cstype']").val(),
					csname : $("#campus_search_div input[name='csname']").val(),
					tnid : $("#campus_search_div select[name='tnid']").val(),
					csid : $("#campus_search_div input[name='csid']").val()
				});
			}
		
			//打开校区查看
			function campus_select_dialog_open(csid){
				//根据校区系统编号查询校区信息
				$.messager.progress({title:"系统提示",msg:"数据提取中,请稍等..."});
				$("#campus_select_table label[name='dq']").html("");
				$("#campus_select_table label[name='csname']").html("");
				$("#campus_select_table label[name='csalias']").html("");
				$("#campus_select_table label[name='csschid']").html("");
  				$("#campus_select_table label[name='cstype']").html("");
				$("#campus_select_table label[name='csphone']").html("");
				$("#campus_select_table label[name='csxz']").html("");
				$("#campus_select_table label[name='csxzphone']").html("");
				$("#campus_select_table label[name='csfgxm']").html("");
				$("#campus_select_table label[name='csfgzw']").html("");
				$("#campus_select_table label[name='csfgdh']").html("");
				$("#campus_select_table label[name='csglxm']").html("");
				$("#campus_select_table label[name='csglzw']").html("");
				$("#campus_select_table label[name='csgldh']").html("");
				$("#campus_select_table label[name='cssite']").html("");
				$("#campus_select_table label[name='cswd']").html("");
				$("#campus_select_table label[name='csjd']").html("");
				$("#campus_select_table label[name='csemail']").html("");
				$("#campus_select_table label[name='cszip']").html("");
				$("#campus_select_table label[name='csjj']").html("");
				
				$("#campus_select_table label[name='year']").html("");
				$("#campus_select_table label[name='csxztype']").html("");
				$("#campus_select_table label[name='csyesornonursery']").html("");
				$("#campus_select_table label[name='cslegalperson']").html("");
				$("#campus_select_table label[name='cslegalphone']").html("");
				$("#campus_select_table label[name='cslegalqq']").html("");
  				$.ajax({
					url:"findCampusByCsid_campus.htm",
					type:"post",
					data:{
						csid : csid
					},
					success:function(r){
						$.messager.progress('close');
						r=$.parseJSON(r);
						$("#campus_select_table label[name='dq']").html("&nbsp;"+r.DQ);
						$("#campus_select_table label[name='csname']").html("&nbsp;"+r.CSNAME);
						$("#campus_select_table label[name='csalias']").html("&nbsp;"+r.CSALIAS);
						$("#campus_select_table label[name='csschid']").html("&nbsp;"+r.CSSCHID);
						
						var csxztype="";
						if(r.CSXZTYPE==1){
							csxztype="公办学校";
						}else if(r.CSXZTYPE==2){
							csxztype="民办学校";
						}
						if(r.CSXZTYPE!=undefined){
							$("#campus_select_table label[name='csxztype']").html("&nbsp;"+csxztype);
						}
						
						if(r.YEAR!=undefined){
							$("#campus_select_table label[name='year']").html("&nbsp;"+r.YEAR);
						}
						
						var csyesornonursery="";
						if(r.CSYESORNONURSERY==1){
							csyesornonursery="是";
						}else if(r.CSYESORNONURSERY==2){
							csyesornonursery="否";
						}
						if(r.CSYESORNONURSERY!=undefined){
							$("#campus_select_table label[name='csyesornonursery']").html("&nbsp;"+csyesornonursery);
						}
						if(r.CSLEGALPERSON!=undefined){
							$("#campus_select_table label[name='cslegalperson']").html("&nbsp;"+r.CSLEGALPERSON);
						}
						
						if(r.CSLEGALPHONE!=undefined){
							$("#campus_select_table label[name='cslegalphone']").html("&nbsp;"+r.CSLEGALPHONE);
						}
						if(r.CSLEGALQQ!=undefined){
							$("#campus_select_table label[name='cslegalqq']").html("&nbsp;"+r.CSLEGALQQ);
						}
						
						var cstype="";
						if(r.CSTYPE==0){
							cstype="幼儿园";
						}else if(r.CSTYPE==1){
							cstype="小学";
						}else if(r.CSTYPE==2){
							cstype="初中";
						}else if(r.CSTYPE==3){
							cstype="高中";
						}else if(r.CSTYPE==4){
							cstype="小学初中";
						}else if(r.CSTYPE==5){
							cstype="小学高中";
						}else if(r.CSTYPE==6){
							cstype="初中高中";
						}else if(r.CSTYPE==7){
							cstype="小学初中高中";
						}else if(r.CSTYPE==8){
							cstype="中职";
						}else if(r.CSTYPE==9){
							cstype="特殊教育";
						}else if(r.CSTYPE==10){
							cstype="小学教学点";
						}else if(r.CSTYPE==11){
							cstype="职业初中";
						}else if(r.CSTYPE==12){
							cstype="幼儿园小学教学点";
						}else if(r.CSTYPE==13){
							cstype="幼儿园小学";
						}else if(r.CSTYPE==14){
							cstype="幼儿园初中";
						}else if(r.CSTYPE==15){
							cstype="幼儿园高中";
						}else if(r.CSTYPE==16){
							cstype="幼儿园小学初中";
						}else if(r.CSTYPE==17){
							cstype="幼儿园小学高中";
						}else if(r.CSTYPE==18){
							cstype="幼儿园初中高中";
						}else if(r.CSTYPE==19){
							cstype="幼儿园小学初中高中";
						}
						$("#campus_select_table label[name='cstype']").html("&nbsp;"+cstype);
						
						if(r.CSPHONE!=undefined){
							$("#campus_select_table label[name='csphone']").html("&nbsp;"+r.CSPHONE);
						}
						if(r.CSXZ!=undefined){
							$("#campus_select_table label[name='csxz']").html("&nbsp;"+r.CSXZ);
						}
						if(r.CSXZPHONE!=undefined){
							$("#campus_select_table label[name='csxzphone']").html("&nbsp;"+r.CSXZPHONE);
						}
						
						if(r.CSFGXM!=undefined){
							$("#campus_select_table label[name='csfgxm']").html("&nbsp;"+r.CSFGXM);
						}
						if(r.CSFGZW!=undefined){
							$("#campus_select_table label[name='csfgzw']").html("&nbsp;"+r.CSFGZW);
						}
						if(r.CSFGDH!=undefined){
							$("#campus_select_table label[name='csfgdh']").html("&nbsp;"+r.CSFGDH);
						}
						
						if(r.CSGLXM!=undefined){
							$("#campus_select_table label[name='csglxm']").html("&nbsp;"+r.CSGLXM);
						}
						if(r.CSGLZW!=undefined){
							$("#campus_select_table label[name='csglzw']").html("&nbsp;"+r.CSGLZW);
						}
						if(r.CSGLDH!=undefined){
							$("#campus_select_table label[name='csgldh']").html("&nbsp;"+r.CSGLDH);
						}
						
						if(r.CSSITE!=undefined){
							$("#campus_select_table label[name='cssite']").html("&nbsp;"+r.CSSITE);
						}
						if(r.CSWD!=undefined){
							$("#campus_select_table label[name='cswd']").html("&nbsp;"+r.CSWD);
						}
						if(r.CSJD!=undefined){
							$("#campus_select_table label[name='csjd']").html("&nbsp;"+r.CSJD);
						}
						
						if(r.CSEMAIL!=undefined){
							$("#campus_select_table label[name='csemail']").html("&nbsp;"+r.CSEMAIL);
						}
						if(r.CSZIP!=undefined){
							$("#campus_select_table label[name='cszip']").html("&nbsp;"+r.CSZIP);
						}
						
						if(r.CSJJ!=undefined){
							$("#campus_select_table label[name='csjj']").html(r.CSJJ);
						}
						if(r.CSLOGO!=undefined){
							$("#campus_select_table img[name='logo']").attr("src",r.CSLOGO);
						}else{
							$("#campus_select_table img[name='logo']").attr("src","images/campus/xuexiao.png");
						}
						
						$("#campus_select_dialog").dialog("open");
					},
					error:function(){
						$.messager.progress('close');
						$.messager.alert("系统提示","服务器连接失败","error");
					}
				});
  			}
  		
			
			
			
			
			
			//上传文件
			function campus_add(){
				//省
  				var peid=$("#campus_add_table select[name='peid']").val();
  				if(peid==null || peid==""){
  					$.messager.alert("系统提示","请选择所在省","warning");
  					return;
  				}
  				//市
  				var cyid=$("#campus_add_table select[name='cyid']").val();
  				if(cyid==null || cyid==""){
  					$.messager.alert("系统提示","请选择所在市","warning");
  					return;
  				}
  				//县区
  				var aaid=$("#campus_add_table select[name='aaid']").val();
  				if(aaid==null || aaid==""){
  					$.messager.alert("系统提示","请选择所在县/区","warning");
  					return;
  				}
  				//镇
  				var tnid=$("#campus_add_table select[name='tnid']").val();
  				//学校名称
  				var csname=$("#campus_add_table input[name='csname']").val();
  				if(csname==null || $.trim(csname).length<=0){
  					$.messager.alert("系统提示","请填写学校名称","warning");
  					return;
  				}
  				//学校标识码
  				var csschid=$("#campus_add_table input[name='csschid']").val();
  				if(csschid==null || $.trim(csschid).length<=0){
  					$.messager.alert("系统提示","请填写学校标识码","warning");
  					return;
  				}
  				//学校类别
  				var cstype=$("#campus_add_table select[name='cstype']").val();
  				if(cstype==null || $.trim(cstype).length<=0){
  					$.messager.alert("系统提示","请选择学校类别","warning");
  					return;
  				}
  				//学校别名
  				var csalias=$("#campus_add_table input[name='csalias']").val();
  				if(csalias==null || $.trim(csalias).length<=0){
  					$.messager.alert("系统提示","请填写学校别名","warning");
  					return;
  				}
  				
  				
  				
  			    //年
  				var year=$("#campus_add_table select[name='year']").val();
  				if(year==null || $.trim(year).length<=0){
  					$.messager.alert("系统提示","请选择年份","warning");
  					return;
  				}
  				
  				//学校性质
  				var csxztype=$("#campus_add_table select[name='csxztype']").val();
  				if(csxztype==null || $.trim(csxztype).length<=0){
  					$.messager.alert("系统提示","请选择学校性质","warning");
  					return;
  				}
  				//如果学校类别等于0或学校性质等于2，那就判断是否是附属学校
  				var csyesornonursery=$("#campus_add_table select[name='csyesornonursery']").val();
  				if(cstype!="0"&&(csyesornonursery==null || $.trim(csyesornonursery).length<=0)){
  					$.messager.alert("系统提示","请选择是否附设幼儿班","warning");
	  					return;
  				}
  				//如果学校类别等于0或学校性质等于2，那就判断法人
  				var cslegalperson=$("#campus_add_table input[name='cslegalperson']").val();
  				if((cstype=="0"||csxztype=="2")&&(cslegalperson==null || $.trim(cslegalperson).length<=0)){
  					$.messager.alert("系统提示","请输入法人姓名","warning");
  					return;
  				}
  				//如果学校类别等于0或学校性质等于2，那就判断法人电话
  				var cslegalphone=$("#campus_add_table input[name='cslegalphone']").val();
  				if((cstype=="0"||csxztype=="2")&&(cslegalphone==null || $.trim(cslegalphone).length<=0)){
  					$.messager.alert("系统提示","请输入法人电话","warning");
  					return;
  				}
  				//如果学校类别等于0或学校性质等于2，那就判断法人QQ
  				var cslegalqq=$("#campus_add_table input[name='cslegalqq']").val();
  				if((cstype=="0"||csxztype=="2")&&(cslegalqq==null || $.trim(cslegalqq).length<=0)){
  					$.messager.alert("系统提示","请输入法人QQ","warning");
  					return;
  				}
  				var num= /^[0-9]*$/;
  			    if (!num.test(cslegalqq)){
  				 	$.messager.alert("系统提示","法人QQ只能为数字");
  			        return;
  			     }
  				
  				//学校电话
  				var csphone=$("#campus_add_table input[name='csphone']").val();
  				if(csphone==null || $.trim(csphone).length<=0){
  					$.messager.alert("系统提示","请填写学校电话","warning");
  					return;
  				}
  				//校长姓名
  				var csxz=$("#campus_add_table input[name='csxz']").val();
  				if(csxz==null || $.trim(csxz).length<=0){
  					$.messager.alert("系统提示","请填写校长姓名","warning");
  					return;
  				}
  				//校长联系电话
  				var csxzphone=$("#campus_add_table input[name='csxzphone']").val();
  				if(csxzphone==null || $.trim(csxzphone).length<=0){
  					$.messager.alert("系统提示","请填写校长联系电话","warning");
  					return;
  				}
  				//分管领导姓名
  				var csfgxm=$("#campus_add_table input[name='csfgxm']").val();
  				//分管领导职务
  				var csfgzw=$("#campus_add_table input[name='csfgzw']").val();
  				//分管领导电话
  				var csfgdh=$("#campus_add_table input[name='csfgdh']").val();
  				//管理人员姓名
  				var csglxm=$("#campus_add_table input[name='csglxm']").val();
  				//管理人员职务
  				var csglzw=$("#campus_add_table input[name='csglzw']").val();
  				//管理人员电话
  				var csgldh=$("#campus_add_table input[name='csgldh']").val();
  				//学校地址
  				var cssite=$("#campus_add_table input[name='cssite']").val();
  				if(cssite==null || $.trim(cssite).length<=0){
  					$.messager.alert("系统提示","请填写学校地址","warning");
  					return;
  				}
  				//纬度
  				var cswd=$("#campus_add_table input[name='cswd']").val();
  				//经度
  				var csjd=$("#campus_add_table input[name='csjd']").val();
  				//电子邮箱
  				var csemail=$("#campus_add_table input[name='csemail']").val();
  				if($.trim(csemail).length>0){
  					var reg =/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
  					if(!reg.test(csemail)){
  						$.messager.alert("系统提示","请正确填写邮箱,格式为XXXX@XX.XX","warning");
  						return;
  					}
  				}
  				//邮政编码
  				var cszip=$("#campus_add_table input[name='cszip']").val();
  				//学校简介
  				var csjj=$("#campus_add_table textarea[name='csjj']").val();
  				//获取学校logo
  				var logo=$("#campus_add_table input[name='logo']").val();
  				//判断是否上传logo
  				if((logo!=null && $.trim(logo).length<=0) || logo==null){
  				//判断学校类别并提示
  	  				if(cstype=="8" || cstype=="9"){
  	  					$.messager.confirm('系统提示',"学校类别选择中职或特殊教育后不能修改为其他类别，是否确认保存?",function(btn){
  	  						if(btn){
  	  							$.messager.progress({title:"系统提示",msg:"数据保存中,请稍等..."});
  	  			  				$.ajax({
  	  								url:"addCampus_campus.htm",
  	  								type:"post",
  	  								data:{
  	  									aaid : aaid,
  	  									csname : csname,
  	  									csschid : csschid,
  	  									cstype : cstype,
  	  									csphone : csphone,
  	  									csxz : csxz,
  	  									csxzphone : csxzphone,
  	  									csfgxm : csfgxm,
  	  									csfgzw : csfgzw,
  	  									csfgdh : csfgdh,
  	  									csglxm : csglxm,
  	  									csglzw : csglzw,
  	  									csgldh : csgldh,
  	  									cssite : cssite,
  	  									cswd : cswd,
  	  									csjd : csjd,
  	  									csemail : csemail,
  	  									cszip : cszip,
  	  									csjj : csjj,
  	  									tnid : tnid,
  	  									csalias : csalias,
  	  									year:year,
  	  									csxztype:csxztype,
  	  									csyesornonursery:csyesornonursery,
  	  									cslegalperson:cslegalperson,
  	  									cslegalphone:cslegalphone,
  	  									cslegalqq:cslegalqq
  	  									
  	  								},
  	  								success:function(r){
  	  									$.messager.progress('close');
  	  									r=$.parseJSON(r);
  	  									if(r.result=="502"){
  	  										$("#campus_add").dialog("close");
  	  										//市
  	  										$("#campus_add_table select[name='cyid']").html("<option value=''>--请选择--</option>");
  	  										//县区
  	  										$("#campus_add_table select[name='aaid']").html("<option value=''>--请选择--</option>");
  	  										//镇
  	  										$("#campus_add_table select[name='tnid']").html("<option value=''>--请选择--</option>");
  	  										
  	  										//法人电话
  	  						  				$("#campus_add_table input[name='cslegalphone']").val("");
  	  						  				//法人QQ
  	  						  				$("#campus_add_table input[name='cslegalqq']").val("");
  	  						  				//法人
  	  						  				$("#campus_add_table input[name='cslegalperson']").val("");
  	  						  				//创办年份
  	  						  				$("#campus_add_table select[name='year']").val("");
  	  						  				//是否是附属幼儿园
  	  						  				$("#campus_add_table select[name='csyesornonursery']").val("");
  	  						  				//学校性质
  	  						  				$("#campus_add_table select[name='csxztype']").val("");
  	  						  				
  	  										//学校名称
  	  						  				$("#campus_add_table input[name='csname']").val("");
  	  										//学校别名
  	  						  				$("#campus_add_table input[name='csalias']").val("");
  	  						  				//学校标识码
  	  						  				$("#campus_add_table input[name='csschid']").val("");
  	  						  				//学校类别
  	  						  				$("#campus_add_table select[name='cstype']").val("");
  	  						  				//学校电话
  	  						  				$("#campus_add_table input[name='csphone']").val("");
  	  						  				//校长姓名
  	  						  				$("#campus_add_table input[name='csxz']").val("");
  	  						  				//校长联系电话
  	  						  				$("#campus_add_table input[name='csxzphone']").val("");
  	  						  				//分管领导姓名
  	  						  				$("#campus_add_table input[name='csfgxm']").val("");
  	  						  				//分管领导职务
  	  						  				$("#campus_add_table input[name='csfgzw']").val("");
  	  						  				//分管领导电话
  	  						  				$("#campus_add_table input[name='csfgdh']").val("");
  	  						  				//管理人员姓名
  	  						  				$("#campus_add_table input[name='csglxm']").val("");
  	  						  				//管理人员职务
  	  						  				$("#campus_add_table input[name='csglzw']").val("");
  	  						  				//管理人员电话
  	  						  				$("#campus_add_table input[name='csgldh']").val("");
  	  						  				//学校地址
  	  						  				$("#campus_add_table input[name='cssite']").val("");
  	  						  				//纬度
  	  						  				$("#campus_add_table input[name='cswd']").val("");
  	  						  				//经度
  	  						  				$("#campus_add_table input[name='csjd']").val("");
  	  						  				//电子邮箱
  	  						  				$("#campus_add_table input[name='csemail']").val("");
  	  						  				//邮政编码
  	  						  				$("#campus_add_table input[name='cszip']").val("");
  	  						  				//学校简介
  	  						  				$("#campus_add_table textarea[name='csjj']").val("");
  	  										$.messager.alert("系统提示",r.msg,"makegood");
  	  										$('#campus_datagrid_table').datagrid("reload");
  	  									}else{
  	  										$.messager.alert("系统提示",r.msg,"error");
  	  									}
  	  								},
  	  								error:function(){
  	  									$.messager.progress('close');
  	  									$.messager.alert("系统提示","服务器连接失败","error");
  	  								}
  	  							});
  	  						}
  	  					});
  	  				}else{
  	  					$.messager.progress({title:"系统提示",msg:"数据保存中,请稍等..."});
  	  					$.ajax({
  							url:"addCampus_campus.htm",
  							type:"post",
  							data:{
  								aaid : aaid,
  								csname : csname,
  								csschid : csschid,
  								cstype : cstype,
  								csphone : csphone,
  								csxz : csxz,
  								csxzphone : csxzphone,
  								csfgxm : csfgxm,
  								csfgzw : csfgzw,
  								csfgdh : csfgdh,
  								csglxm : csglxm,
  								csglzw : csglzw,
  								csgldh : csgldh,
  								cssite : cssite,
  								cswd : cswd,
  								csjd : csjd,
  								csemail : csemail,
  								cszip : cszip,
  								csjj : csjj,
  								tnid : tnid,
  								csalias : csalias,
  								year:year,
  								csxztype:csxztype,
  								csyesornonursery:csyesornonursery,
  								cslegalperson:cslegalperson,
  								cslegalphone:cslegalphone,
  								cslegalqq:cslegalqq
  								
  							},
  							success:function(r){
  								$.messager.progress('close');
  								r=$.parseJSON(r);
  								if(r.result=="502"){
  									$("#campus_add").dialog("close");
  									//市
  									$("#campus_add_table select[name='cyid']").html("<option value=''>--请选择--</option>");
  									//县区
  									$("#campus_add_table select[name='aaid']").html("<option value=''>--请选择--</option>");
  									//镇
  									$("#campus_add_table select[name='tnid']").html("<option value=''>--请选择--</option>");
  									
  									//法人电话
  					  				$("#campus_add_table input[name='cslegalphone']").val("");
  					  				//法人QQ
  					  				$("#campus_add_table input[name='cslegalqq']").val("");
  					  				//法人
  					  				$("#campus_add_table input[name='cslegalperson']").val("");
  					  				//创办年份
  					  				$("#campus_add_table select[name='year']").val("");
  					  				//是否是附属幼儿园
  					  				$("#campus_add_table select[name='csyesornonursery']").val("");
  					  				//学校性质
  					  				$("#campus_add_table select[name='csxztype']").val("");
  					  				
  									//学校名称
  					  				$("#campus_add_table input[name='csname']").val("");
  									//学校别名
  					  				$("#campus_add_table input[name='csalias']").val("");
  					  				//学校标识码
  					  				$("#campus_add_table input[name='csschid']").val("");
  					  				//学校类别
  					  				$("#campus_add_table select[name='cstype']").val("");
  					  				//学校电话
  					  				$("#campus_add_table input[name='csphone']").val("");
  					  				//校长姓名
  					  				$("#campus_add_table input[name='csxz']").val("");
  					  				//校长联系电话
  					  				$("#campus_add_table input[name='csxzphone']").val("");
  					  				//分管领导姓名
  					  				$("#campus_add_table input[name='csfgxm']").val("");
  					  				//分管领导职务
  					  				$("#campus_add_table input[name='csfgzw']").val("");
  					  				//分管领导电话
  					  				$("#campus_add_table input[name='csfgdh']").val("");
  					  				//管理人员姓名
  					  				$("#campus_add_table input[name='csglxm']").val("");
  					  				//管理人员职务
  					  				$("#campus_add_table input[name='csglzw']").val("");
  					  				//管理人员电话
  					  				$("#campus_add_table input[name='csgldh']").val("");
  					  				//学校地址
  					  				$("#campus_add_table input[name='cssite']").val("");
  					  				//纬度
  					  				$("#campus_add_table input[name='cswd']").val("");
  					  				//经度
  					  				$("#campus_add_table input[name='csjd']").val("");
  					  				//电子邮箱
  					  				$("#campus_add_table input[name='csemail']").val("");
  					  				//邮政编码
  					  				$("#campus_add_table input[name='cszip']").val("");
  					  				//学校简介
  					  				$("#campus_add_table textarea[name='csjj']").val("");
  									$.messager.alert("系统提示",r.msg,"makegood");
  									$('#campus_datagrid_table').datagrid("reload");
  								}else{
  									$.messager.alert("系统提示",r.msg,"error");
  								}
  							},
  							error:function(){
  								$.messager.progress('close');
  								$.messager.alert("系统提示","服务器连接失败","error");
  							}
  						});
  	  				}
  				}else{
  					if(cstype=="8" || cstype=="9"){
  	  					$.messager.confirm('系统提示',"学校类别选择中职或特殊教育后不能修改为其他类别，是否确认保存?",function(btn){
  	  						if(btn){
	  	  						//判断文件大小
	  	  						if(checkUploadFileSize(5,$("#campus_add_table input[name='logo']")[0].files[0])==false){
	  	  							$.messager.alert("系统提示","文件大小不能超过5M","warning");
	  	  							return;
	  	  						}
	  	  						$.messager.progress({title:'系统提示',text:'数据保存中'});
	  	  						var aliyun_oss_key = $("#campus_add_table input[name='nurl']").val(); 
	  	  						var aliyun_oss_staff_fd = new FormData();
	  	  						aliyun_oss_staff_fd.append("key", aliyun_oss_key);
	  	  						aliyun_oss_staff_fd.append("policy", policyBase64);
	  	  						aliyun_oss_staff_fd.append("OSSAccessKeyId", accessid);
	  	  						aliyun_oss_staff_fd.append("success_action_status", 200);
	  	  						aliyun_oss_staff_fd.append("signature", signature);
	  	  						aliyun_oss_staff_fd.append("file", $("#campus_add_table input[name='logo']")[0].files[0]);
	  	  						
	  	  						aliyun_oss_staff_xhr = new XMLHttpRequest(); 
	  	  						aliyun_oss_staff_xhr.onreadystatechange = campus_add_go;  
	  	  						aliyun_oss_staff_xhr.open("POST", host);
	  	  						aliyun_oss_staff_xhr.send(aliyun_oss_staff_fd);
  	  						}
  	  					});
  					}else{
  						//判断文件大小
  						if(checkUploadFileSize(5,$("#campus_add_table input[name='logo']")[0].files[0])==false){
  							$.messager.alert("系统提示","文件大小不能超过5M","warning");
  							return;
  						}
  						$.messager.progress({title:'系统提示',text:'数据保存中'});
  						var aliyun_oss_key = $("#campus_add_table input[name='nurl']").val(); 
  						var aliyun_oss_staff_fd = new FormData();
  						aliyun_oss_staff_fd.append("key", aliyun_oss_key);
  						aliyun_oss_staff_fd.append("policy", policyBase64);
  						aliyun_oss_staff_fd.append("OSSAccessKeyId", accessid);
  						aliyun_oss_staff_fd.append("success_action_status", 200);
  						aliyun_oss_staff_fd.append("signature", signature);
  						aliyun_oss_staff_fd.append("file", $("#campus_add_table input[name='logo']")[0].files[0]);
  						
  						aliyun_oss_staff_xhr = new XMLHttpRequest(); 
  						aliyun_oss_staff_xhr.onreadystatechange = campus_add_go;  
  						aliyun_oss_staff_xhr.open("POST", host);
  						aliyun_oss_staff_xhr.send(aliyun_oss_staff_fd);
  					}
  				}
			}
			
			
			
			
			
			
  			//校区新增保存
  			function campus_add_go(){
  				if(aliyun_oss_staff_xhr.readyState == 4){
					if (aliyun_oss_staff_xhr.status == 200){
						//判断附件
		  				var nurl=$("#campus_add_table input[name='nurl']").val();
		  				nurl = host+"/"+nurl;
		  				//省
		  				var peid=$("#campus_add_table select[name='peid']").val();
		  				if(peid==null || peid==""){
		  					$.messager.alert("系统提示","请选择所在省","warning");
		  					return;
		  				}
		  				//市
		  				var cyid=$("#campus_add_table select[name='cyid']").val();
		  				if(cyid==null || cyid==""){
		  					$.messager.alert("系统提示","请选择所在市","warning");
		  					return;
		  				}
		  				//县区
		  				var aaid=$("#campus_add_table select[name='aaid']").val();
		  				if(aaid==null || aaid==""){
		  					$.messager.alert("系统提示","请选择所在县/区","warning");
		  					return;
		  				}
		  				//镇
		  				var tnid=$("#campus_add_table select[name='tnid']").val();
		  				//学校名称
		  				var csname=$("#campus_add_table input[name='csname']").val();
		  				if(csname==null || $.trim(csname).length<=0){
		  					$.messager.alert("系统提示","请填写学校名称","warning");
		  					return;
		  				}
		  				//学校标识码
		  				var csschid=$("#campus_add_table input[name='csschid']").val();
		  				if(csschid==null || $.trim(csschid).length<=0){
		  					$.messager.alert("系统提示","请填写学校标识码","warning");
		  					return;
		  				}
		  				//学校类别
		  				var cstype=$("#campus_add_table select[name='cstype']").val();
		  				if(cstype==null || $.trim(cstype).length<=0){
		  					$.messager.alert("系统提示","请选择学校类别","warning");
		  					return;
		  				}
		  				//学校别名
		  				var csalias=$("#campus_add_table input[name='csalias']").val();
		  				if(csalias==null || $.trim(csalias).length<=0){
		  					$.messager.alert("系统提示","请填写学校别名","warning");
		  					return;
		  				}
		  				
		  				
		  				
		  			    //年
		  				var year=$("#campus_add_table select[name='year']").val();
		  				if(year==null || $.trim(year).length<=0){
		  					$.messager.alert("系统提示","请选择年份","warning");
		  					return;
		  				}
		  				
		  				//学校性质
		  				var csxztype=$("#campus_add_table select[name='csxztype']").val();
		  				if(csxztype==null || $.trim(csxztype).length<=0){
		  					$.messager.alert("系统提示","请选择学校性质","warning");
		  					return;
		  				}
		  				//如果学校类别等于0或学校性质等于2，那就判断是否是附属学校
		  				var csyesornonursery=$("#campus_add_table select[name='csyesornonursery']").val();
		  				if(cstype!="0"&&(csyesornonursery==null || $.trim(csyesornonursery).length<=0)){
		  					$.messager.alert("系统提示","请选择是否附设幼儿班","warning");
			  					return;
		  				}
		  				//如果学校类别等于0或学校性质等于2，那就判断法人
		  				var cslegalperson=$("#campus_add_table input[name='cslegalperson']").val();
		  				if((cstype=="0"||csxztype=="2")&&(cslegalperson==null || $.trim(cslegalperson).length<=0)){
		  					$.messager.alert("系统提示","请输入法人姓名","warning");
		  					return;
		  				}
		  				//如果学校类别等于0或学校性质等于2，那就判断法人电话
		  				var cslegalphone=$("#campus_add_table input[name='cslegalphone']").val();
		  				if((cstype=="0"||csxztype=="2")&&(cslegalphone==null || $.trim(cslegalphone).length<=0)){
		  					$.messager.alert("系统提示","请输入法人电话","warning");
		  					return;
		  				}
		  				//如果学校类别等于0或学校性质等于2，那就判断法人QQ
		  				var cslegalqq=$("#campus_add_table input[name='cslegalqq']").val();
		  				if((cstype=="0"||csxztype=="2")&&(cslegalqq==null || $.trim(cslegalqq).length<=0)){
		  					$.messager.alert("系统提示","请输入法人QQ","warning");
		  					return;
		  				}
		  				var num= /^[0-9]*$/;
		  			    if (!num.test(cslegalqq)){
		  				 	$.messager.alert("系统提示","法人QQ只能为数字");
		  			        return;
		  			     }
		  				
		  				//学校电话
		  				var csphone=$("#campus_add_table input[name='csphone']").val();
		  				if(csphone==null || $.trim(csphone).length<=0){
		  					$.messager.alert("系统提示","请填写学校电话","warning");
		  					return;
		  				}
		  				//校长姓名
		  				var csxz=$("#campus_add_table input[name='csxz']").val();
		  				if(csxz==null || $.trim(csxz).length<=0){
		  					$.messager.alert("系统提示","请填写校长姓名","warning");
		  					return;
		  				}
		  				//校长联系电话
		  				var csxzphone=$("#campus_add_table input[name='csxzphone']").val();
		  				if(csxzphone==null || $.trim(csxzphone).length<=0){
		  					$.messager.alert("系统提示","请填写校长联系电话","warning");
		  					return;
		  				}
		  				//分管领导姓名
		  				var csfgxm=$("#campus_add_table input[name='csfgxm']").val();
		  				//分管领导职务
		  				var csfgzw=$("#campus_add_table input[name='csfgzw']").val();
		  				//分管领导电话
		  				var csfgdh=$("#campus_add_table input[name='csfgdh']").val();
		  				//管理人员姓名
		  				var csglxm=$("#campus_add_table input[name='csglxm']").val();
		  				//管理人员职务
		  				var csglzw=$("#campus_add_table input[name='csglzw']").val();
		  				//管理人员电话
		  				var csgldh=$("#campus_add_table input[name='csgldh']").val();
		  				//学校地址
		  				var cssite=$("#campus_add_table input[name='cssite']").val();
		  				if(cssite==null || $.trim(cssite).length<=0){
		  					$.messager.alert("系统提示","请填写学校地址","warning");
		  					return;
		  				}
		  				//纬度
		  				var cswd=$("#campus_add_table input[name='cswd']").val();
		  				//经度
		  				var csjd=$("#campus_add_table input[name='csjd']").val();
		  				//电子邮箱
		  				var csemail=$("#campus_add_table input[name='csemail']").val();
		  				if($.trim(csemail).length>0){
		  					var reg =/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
		  					if(!reg.test(csemail)){
		  						$.messager.alert("系统提示","请正确填写邮箱,格式为XXXX@XX.XX","warning");
		  						return;
		  					}
		  				}
		  				//邮政编码
		  				var cszip=$("#campus_add_table input[name='cszip']").val();
		  				//学校简介
		  				var csjj=$("#campus_add_table textarea[name='csjj']").val();
						$.messager.progress({title:"系统提示",msg:"数据保存中,请稍等..."});
						$.ajax({
							url:"addCampus_campus.htm",
							type:"post",
							data:{
								aaid : aaid,
								csname : csname,
								csschid : csschid,
								cstype : cstype,
								csphone : csphone,
								csxz : csxz,
								csxzphone : csxzphone,
								csfgxm : csfgxm,
								csfgzw : csfgzw,
								csfgdh : csfgdh,
								csglxm : csglxm,
								csglzw : csglzw,
								csgldh : csgldh,
								cssite : cssite,
								cswd : cswd,
								csjd : csjd,
								csemail : csemail,
								cszip : cszip,
								csjj : csjj,
								tnid : tnid,
								csalias : csalias,
								year:year,
								csxztype:csxztype,
								csyesornonursery:csyesornonursery,
								cslegalperson:cslegalperson,
								cslegalphone:cslegalphone,
								cslegalqq:cslegalqq,
								logo : nurl
							},
							success:function(r){
								$.messager.progress('close');
								r=$.parseJSON(r);
								if(r.result=="502"){
									$("#campus_add").dialog("close");
									//市
									$("#campus_add_table select[name='cyid']").html("<option value=''>--请选择--</option>");
									//县区
									$("#campus_add_table select[name='aaid']").html("<option value=''>--请选择--</option>");
									//镇
									$("#campus_add_table select[name='tnid']").html("<option value=''>--请选择--</option>");
									
									//法人电话
					  				$("#campus_add_table input[name='cslegalphone']").val("");
					  				//法人QQ
					  				$("#campus_add_table input[name='cslegalqq']").val("");
					  				//法人
					  				$("#campus_add_table input[name='cslegalperson']").val("");
					  				//创办年份
					  				$("#campus_add_table select[name='year']").val("");
					  				//是否是附属幼儿园
					  				$("#campus_add_table select[name='csyesornonursery']").val("");
					  				//学校性质
					  				$("#campus_add_table select[name='csxztype']").val("");
					  				
									//学校名称
					  				$("#campus_add_table input[name='csname']").val("");
									//学校别名
					  				$("#campus_add_table input[name='csalias']").val("");
					  				//学校标识码
					  				$("#campus_add_table input[name='csschid']").val("");
					  				//学校类别
					  				$("#campus_add_table select[name='cstype']").val("");
					  				//学校电话
					  				$("#campus_add_table input[name='csphone']").val("");
					  				//校长姓名
					  				$("#campus_add_table input[name='csxz']").val("");
					  				//校长联系电话
					  				$("#campus_add_table input[name='csxzphone']").val("");
					  				//分管领导姓名
					  				$("#campus_add_table input[name='csfgxm']").val("");
					  				//分管领导职务
					  				$("#campus_add_table input[name='csfgzw']").val("");
					  				//分管领导电话
					  				$("#campus_add_table input[name='csfgdh']").val("");
					  				//管理人员姓名
					  				$("#campus_add_table input[name='csglxm']").val("");
					  				//管理人员职务
					  				$("#campus_add_table input[name='csglzw']").val("");
					  				//管理人员电话
					  				$("#campus_add_table input[name='csgldh']").val("");
					  				//学校地址
					  				$("#campus_add_table input[name='cssite']").val("");
					  				//纬度
					  				$("#campus_add_table input[name='cswd']").val("");
					  				//经度
					  				$("#campus_add_table input[name='csjd']").val("");
					  				//电子邮箱
					  				$("#campus_add_table input[name='csemail']").val("");
					  				//邮政编码
					  				$("#campus_add_table input[name='cszip']").val("");
					  				//学校简介
					  				$("#campus_add_table textarea[name='csjj']").val("");
									$.messager.alert("系统提示",r.msg,"makegood");
									$('#campus_datagrid_table').datagrid("reload");
								}else{
									$.messager.alert("系统提示",r.msg,"error");
								}
							},
							error:function(){
								$.messager.progress('close');
								$.messager.alert("系统提示","服务器连接失败","error");
							}
						});
					}
  				}
  			}
  		
  			//打开新增窗口
  			function campus_add_dialog_open(){
  				//清空里面的值
  				$("#campus_add_table input").each(function(){
					$(this).val("");
				});
  				$("#campus_add_table select[name='csyesornonursery']").val("");
  				$("#campus_add_table select[name='csxztype']").val("");
  				$("#campus_add_table select[name='cstype']").val("");
  				$("#campus_add_table select[name='cyid']").val("");
  				$("#campus_add_table select[name='aaid']").val("");
  				//这是加载年份
  				$("#campus_add_table select[name='year']").val("${nowyear}");
				
  				//提取所有省数据
  				$.ajax({
					url:"findAllProvince_campus.htm",
					type:"post",
					async:false,
					success:function(r){
						r=$.parseJSON(r);
						var html="<option value=''>--请选择--</option>";
						for(var i=0;i<r.length;i++){
							html+="<option value='"+r[i].pccode+"'>"+r[i].pcname+"</option>";
						}
						$("#campus_add_table select[name='pccode']").html(html);
// 						//判断登录用户是否存在省级别
// 						if(uspeid!=null && uspeid!=""){
// 							$("#campus_add_table select[name='peid']").val(uspeid);
// 							$("#campus_add_table select[name='peid']").attr("disabled",true);
// 						}
					},
					error:function(){
						$.messager.alert("系统提示","服务器连接失败","error");
					}
				});
  				//判断登录用户是否存在省级别
				if(uspeid!=null && uspeid!=""){
					$.ajax({
						url:"findCityByPeid_campus.htm",
						type:"post",
						data:{
							peid : uspeid
						},
						success:function(r){
							r=$.parseJSON(r);
							var hml="<option value=''>--请选择--</option>";
							for(var j=0;j<r.length;j++){
								hml+="<option value='"+r[j].CYID+"'>"+r[j].CYNAME+"</option>";	
							}
							$("#campus_add_table select[name='cyid']").html(hml);
							//判断登录用户是否存在市级别
							if(uscyid!=null && uscyid!=""){
								$("#campus_add_table select[name='cyid']").val(uscyid);
								$("#campus_add_table select[name='cyid']").attr("disabled",true);
							}
						},
						error:function(){
							$.messager.alert("系统提示","服务器连接失败","error");
						}
					});
				}
				//判断登录用户是否存在市级别
				if(uscyid!=null && uscyid!=""){
					$.ajax({
						url:"findAreaByCyid_campus.htm",
						type:"post",
						data:{
							cyid : uscyid
						},
						success:function(r){
							r=$.parseJSON(r);
							var hl="<option value=''>--请选择--</option>";
							for(var k=0;k<r.length;k++){
								hl+="<option value='"+r[k].AAID+"'>"+r[k].AANAME+"</option>";
							}
							$("#campus_add_table select[name='aaid']").html(hl);
							//判断登录用户是否存在县区级别
							if(usaaid!=null && usaaid!=""){
								$("#campus_add_table select[name='aaid']").val(usaaid);
								$("#campus_add_table select[name='aaid']").attr("disabled",true);
							}
						},
						error:function(){
							$.messager.alert("系统提示","服务器连接失败","error");
						}
					});
				}
				//判断登录用户是否存在县区级别
				if(usaaid!=null && usaaid!=""){
					$.ajax({
						url:"selectTownByAaid_campus.htm",
						type:"post",
						data:{
							aaid : usaaid
						},
						success:function(r){
							r=$.parseJSON(r);
							var hl="<option value=''>--请选择--</option>";
							for(var k=0;k<r.length;k++){
								hl+="<option value='"+r[k].TNID+"'>"+r[k].TNNAME+"</option>";
							}
							$("#campus_add_table select[name='tnid']").html(hl);
							//判断登录用户是否存在镇级别
							if(ustnid!=null && ustnid!=""){
								$("#campus_add_table select[name='tnid']").val(ustnid);
								$("#campus_add_table select[name='tnid']").attr("disabled",true);
							}
						},
						error:function(){
							$.messager.alert("系统提示","服务器连接失败","error");
						}
					});
				}
				
				//将select元素设置为readonly
  				$("#campus_add_table select[name='csyesornonursery']").attr("disabled",true);
  				$("#campus_add_table input[name='cslegalperson']").attr("disabled",true);
  				$("#campus_add_table input[name='cslegalphone']").attr("disabled",true);
  				$("#campus_add_table input[name='cslegalqq']").attr("disabled",true);
  				//打开窗口
  				$("#campus_add").dialog("open");
  			}
  			
  		   
  			//页面加载完成
			$(document).ready(function(){
				//绑定回车搜索事件
				document.onkeydown = function(e){
					var ev = document.all ? window.event : e;
					if(ev.keyCode==13){
						campus_search();
					}
				};
				
				//提取所有省数据
  				$.ajax({
					url:"findAllProvince_campus.htm",
					type:"post",
					success:function(r){
						r=$.parseJSON(r);
						var html="<option value=''>--全部--</option>";
						for(var i=0;i<r.length;i++){
							html+="<option value='"+r[i].PEID+"'>"+r[i].PENAME+"</option>";
						}
						$("#campus_search_div select[name='peid']").html(html);
						//判断登录用户是否存在省级别
						if(uspeid!=null && uspeid!=""){
							$("#campus_search_div select[name='peid']").val(uspeid);
							$("#campus_search_div select[name='peid']").attr("disabled",true);
						}
					},
					error:function(){
						$.messager.alert("系统提示","服务器连接失败","error");
					}
				});
				//判断登录用户是否存在省级别
				if(uspeid!=null && uspeid!=""){
					$.ajax({
						url:"findCityByPeid_campus.htm",
						type:"post",
						data:{
							peid : uspeid
						},
						success:function(r){
							r=$.parseJSON(r);
							var hml="<option value=''>--全部--</option>";
							for(var j=0;j<r.length;j++){
								hml+="<option value='"+r[j].CYID+"'>"+r[j].CYNAME+"</option>";	
							}
							$("#campus_search_div select[name='cyid']").html(hml);
							//判断登录用户是否存在市级别
							if(uscyid!=null && uscyid!=""){
								$("#campus_search_div select[name='cyid']").val(uscyid);
								$("#campus_search_div select[name='cyid']").attr("disabled",true);
							}
						},
						error:function(){
							$.messager.alert("系统提示","服务器连接失败","error");
						}
					});
				}
				//判断登录用户是否存在市级别
				if(uscyid!=null && uscyid!=""){
					$.ajax({
						url:"findAreaByCyid_campus.htm",
						type:"post",
						data:{
							cyid : uscyid
						},
						success:function(r){
							r=$.parseJSON(r);
							var hl="<option value=''>--全部--</option>";
							for(var k=0;k<r.length;k++){
								hl+="<option value='"+r[k].AAID+"'>"+r[k].AANAME+"</option>";
							}
							$("#campus_search_div select[name='aaid']").html(hl);
							//判断登录用户是否存在县区级别
							if(usaaid!=null && usaaid!=""){
								$("#campus_search_div select[name='aaid']").val(usaaid);
								$("#campus_search_div select[name='aaid']").attr("disabled",true);
							}
						},
						error:function(){
							$.messager.alert("系统提示","服务器连接失败","error");
						}
					});
				}
				//判断登录用户是否存在县区级别
				if(usaaid!=null && usaaid!=""){
					$.ajax({
						url:"selectTownByAaid_campus.htm",
						type:"post",
						data:{
							aaid : usaaid
						},
						success:function(r){
							r=$.parseJSON(r);
							var hl="<option value=''>--全部--</option>";
							for(var k=0;k<r.length;k++){
								hl+="<option value='"+r[k].TNID+"'>"+r[k].TNNAME+"</option>";
							}
							$("#campus_search_div select[name='tnid']").html(hl);
							//判断登录用户是否存在镇级别
							if(ustnid!=null && ustnid!=""){
								$("#campus_search_div select[name='tnid']").val(ustnid);
								$("#campus_search_div select[name='tnid']").attr("disabled",true);
							}
						},
						error:function(){
							$.messager.alert("系统提示","服务器连接失败","error");
						}
					});
				}
				
				
				//加载表格数据
				$('#campus_datagrid_table').datagrid({
					title :'', 
					fit : true,
					url : 'findListCount_campus.htm',
					queryParams:{
						peid : uspeid,
						cyid : uscyid,
						aaid : usaaid,
						tnid : ustnid,
						csid : csid
					},
					pageSize : 25,
					pageList : [25,50,75,100],
					singleSelect :false,
					rownumbers : true,
					pagination : true,
					iconCls : 'icon-save',
					fitColumns :true,
					toolbar:'#campus_search_div',
					columns : [[
						{field:'text',title:'',width:120,align:'center',checkbox:true},
						{field:'CSID',title:'操作',width:130,align:'center',
							formatter:function(value,rowData,rowIndex){
								if(value!=undefined && value!=""){
									var html="";
									if(uslv==null || uslv==""){//超级管理员按钮
										html+="<div class='rowButton_select' title='查看' onclick=\"javascript:campus_select_dialog_open('"+value+"');\"></div>";
										html+="<div class='rowButton_edit' title='编辑' onclick=\"javascript:campus_edit_dialog_open('"+value+"');\"></div>";
										html+="<div class='rowButton_delete' title='删除' onclick=\"javascript:campus_del('"+value+"');\"></div>";
										html+="<div class='rowButton_xuexiaozhanghu' title='学校帐号' onclick=\"javascript:campus_users_dialog_open('"+value+"');\"></div>";
									}else if(uslv==1){//学校用户按钮
										html+="<div class='rowButton_select' title='查看' onclick=\"javascript:campus_select_dialog_open('"+value+"');\"></div>";
										html+="<div class='rowButton_edit' title='编辑' onclick=\"javascript:campus_edit_dialog_open('"+value+"');\"></div>";
										html+="<div class='rowButton_daochu' title='导出' onclick=\"javascript:campus_search_exp();\"></div>";
										html+="<div class='rowButton_xuexiaozhanghu' title='学校帐号' onclick=\"javascript:campus_users_dialog_open('"+value+"');\"></div>";
									}else if(uslv==0 || uslv==3){//教育局，教办用户按钮
										html+="<div class='rowButton_select' title='查看' onclick=\"javascript:campus_select_dialog_open('"+value+"');\"></div>";
										html+="<div class='rowButton_edit' title='编辑' onclick=\"javascript:campus_edit_dialog_open('"+value+"');\"></div>";
										html+="<div class='rowButton_delete' title='删除' onclick=\"javascript:campus_del('"+value+"');\"></div>";
										html+="<div class='rowButton_xuexiaozhanghu' title='学校帐号' onclick=\"javascript:campus_users_dialog_open('"+value+"');\"></div>";
									}
							   		return html;
						   		}
							}
						},
						{field:'DQ',title:'地区',width:120,align:'center',
							formatter: function(value,row,index){  
						   	if(value!=undefined && value!=""){
								return "<span title="+value+">"+value+"</span>"  ;
							}
						}},
						{field:'CSNAME',title:'学校名称',width:120,align:'center',
							formatter: function(value,row,index){  
						   	if(value!=undefined && value!=""){
								return "<span title="+value+">"+value+"</span>"  ;
							}
						}},
						{field:'CSLOGO',title:'学校LOGO',width:100,align:'center',
							formatter: function(value,row,index){  
							if(value!=undefined && value!=""){
								return "<img src="+value+" style='width:40px;border-radius:50px;height:40px;'/>"  ;
							}else{
								return "<img src='images/campus/xuexiao.png' style='width:40px;border-radius:50px;height:40px;'/>";
							}
						}},
						{field:'CSALIAS',title:'学校别名',width:80,align:'center',
							formatter: function(value,row,index){  
						   	if(value!=undefined && value!=""){
								return "<span title="+value+">"+value+"</span>"  ;
							}
						}},
						{field:'CSSCHID',title:'学校标识码',width:120,align:'center'},
						{field:'CSTYPE',title:'学校类别',width:80,align:'center',formatter:function(value,rowData,rowIndex){
							if(value==0){
								return "幼儿园";
							}else if(value==1){
								return "小学(完全小学)";
							}else if(value==2){
								return "初中(初级中学)";
							}else if(value==3){
								return "高中(高级中学)";
							}else if(value==4){
								return "小学初中(九年一贯制)";
							}else if(value==5){
								return "小学高中";
							}else if(value==6){
								return "初中高中(完全中学)";
							}else if(value==7){
								return "小学初中高中(十二年一贯制)";
							}else if(value==8){
								return "中职";
							}else if(value==9){
								return "特殊教育";
							}else if(value==10){
								return "小学教学点";
							}else if(value==11){
								return "职业初中";
							}else if(value==12){
								return "幼儿园小学教学点";
							}else if(value==13){
								return "幼儿园小学";
							}else if(value==14){
								return "幼儿园初中";
							}else if(value==15){
								return "幼儿园高中";
							}else if(value==16){
								return "幼儿园小学初中";
							}else if(value==17){
								return "幼儿园小学高中";
							}else if(value==18){
								return "幼儿园初中高中";
							}else if(value==19){
								return "幼儿园小学初中高中";
							}
						}},
						{field:'CSPHONE',title:'学校电话',width:120,align:'center'},
						{field:'CSSITE',title:'学校地址',width:120,align:'center',
							formatter: function(value,row,index){  
						   	if(value!=undefined && value!=""){
								return "<span title="+value+">"+value+"</span>"  ;
							}
						}},
						{field:'CSXZ',title:'校长',width:80,align:'center'},
						{field:'CSXZPHONE',title:'校长电话',width:120,align:'center'},
						{field:'CSEMAIL',title:'电子邮箱',width:120,align:'center'},
						{field:'CSZIP',title:'邮政编码',width:120,align:'center'}
					]],
					  onDblClickRow:function (rowIndex, rowData){
				  		  campus_select_dialog_open(rowData.CSID);
					  },
			   		  onLoadSuccess : function () {
					      $(this).datagrid("fixRownumber");
					  }
			   	});
			});
  			
			//dialog关闭方法
	  		function dialog_close(id){
	  			$("#"+id).dialog("close");
	  		}
  		</script>
  </body>
</html>
