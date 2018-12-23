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
		 	<div id="campus_add_dialog" class="easyui-dialog" title="新增学校" closed="true" modal="true" style="width:850px;height:auto;padding-top:20px;" iconCls="icon-building">
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
							<select name="pccode" style="width: 150px; font-size:12px;" onchange="selectCityByPccodeCampusManage(this.value,'campus_add_table','请选择');">
								<option value="">--请选择--</option>
							</select>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">市:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<select name="ctcode" style="width: 150px;font-size:12px;" onchange="selectAreaByCtcodeCampusManage(this.value,'campus_add_table','请选择');">
								<option value="">--请选择--</option>
							</select>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">县/区:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<select name="aacode" style="width: 150px;font-size:12px;">
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
							<input type="text" name="cscode"/>
						</td>
						
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">创办年份:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
<!-- 							<input id="createyear" type="text" class="easyui-datebox" required="required"> -->
							<input type="text" name="createyear"/>
						</td>
					</tr>
					<tr>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">学校别名:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="csotname"/>
						</td>
						
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">学校性质:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<select name="csproerty" style="width: 150px;font-size:12px;">
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
							<input type="text" name="csaddres" value=""/>
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
							<input type="text" name="cstelnum"/>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">校长姓名:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="principal"/>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">校长联系电话:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="prnum"/>
						</td>
					</tr>
					<tr>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="font-size: 12px;">分管领导姓名:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="charger"/>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="font-size: 12px;">分管领导职务:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="chagejob"/>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="font-size: 12px;">分管领导电话:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="chrgtelnum"/>
						</td>
					</tr>
					
					<tr>
						
					</tr>
					<tr>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="font-size: 12px;">电子邮箱:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="email" value=""/>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="font-size: 12px;">邮政编码:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="postcode" value=""/>
						</td>
					</tr>
					<tr>
						<td>
							<label style="font-size: 12px;">学校简介:</label>
						</td>
						<td colspan="5" style="padding: 10px 0px 0px 0px;" align="center">
							<textarea name="csintro" style="font-size: 12px;width: 550px;height: 100px;resize: none;"></textarea>
						</td>
					</tr>
					<tr>
						<td style="padding: 10px 0px 0px 0px;" colspan="6" align="center">
							<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-save" onclick="campus_add();">保存</a>
							<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-cancel" style="margin-left: 10px;" onclick="dialog_close('campus_add_dialog');">关闭</a>
						</td>
					</tr>
					<tr style="height: 10px;">
					</tr>
				</table>
			</div>
			
  		
  			<!-- 搜索及数据展示 -->
			<div id="campus_search_div" style="height:auto;min-height:1px;float: left;line-height: 35px;width: 100%;">
			
				<!-- 超级管理员搜索框 -->
				<div style="float: left;padding: 5px 5px;height: 35px;">
					<label style="font-size: 12px;">省:</label>
					<select name="pccode" style="width: 150px;" onchange="selectCityByPccodeCampusManage(this.value,'campus_search_div','全部');">
						<option value="">--全部--</option>
					</select>
				</div>
				<div style="float: left;padding: 5px 5px;height: 35px;">
					<label style="font-size: 12px;">市:</label>
					<select name="ctcode" style="width: 150px;" onchange="selectAreaByCtcodeCampusManage(this.value,'campus_search_div','全部');">
						<option value="">--全部--</option>
					</select>
				</div>
				<div style="float: left;padding: 5px 5px;height: 35px;">
					<label style="font-size: 12px;">县/区:</label>
					<select name="aacode" style="width: 150px;">
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
			
  			<!-- 学校导入 -->
  			<div id="campus_imp_dialog" class="easyui-dialog" title="学校导入" closed="true" modal="true" style="width:400px;height:250px;" iconCls="icon-building_add">
  				<form id="campus_imp_form" method="post" enctype="multipart/form-data">
	  				<table style="width: 100%;padding: 12px 0px 0px 0px;">
	  					<tr>
							<td style="padding: 0px 0px 0px 5px;" align="left" colspan="2">
								<label style="font-size: 16px;font-weight: bold;">注意:</label>&nbsp;&nbsp;
							</td>
						</tr>
						<tr>
							<td style="padding: 5px 0px 0px 20px;" align="left" colspan="2">
								<label style="font-size: 12px; color:red;">[1]请严格按照导入模版进行操作。</label>
								<a href="javascript:void(0);" onclick="down_campus_imp_mode();" style="font-size: 12px;text-decoration: none;">>>点击下载导入模版</a>
							</td>
						</tr>
						<tr>
							<td style="padding: 5px 0px 0px 20px;" align="left" colspan="2">
								<label style="font-size: 12px;color:red;">[2]在EXCEL导入模版中红色标记的列为必填列。</label>
							</td>
						</tr>
						<tr>
							<td style="padding: 20px 0px 0px 0px;" align="right">
								<label style="font-size: 12px;font-weight: bold;">选择EXCEL:</label>&nbsp;&nbsp;
							</td>
							<td style="padding: 20px 0px 0px 0px;">
								<input type="file" name="csfile" accept=".xls"/>
							</td>
						</tr>
						<tr>
							<td style="padding: 30px 0px 0px 0px;" colspan="2" align="center">
								<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-save" onclick="submit_campus_imp();">保存</a>
							</td>
						</tr>
					</table>
				</form>
			</div>
			
			<!-- 学校查看 -->
		 	<div id="campus_select_dialog" class="easyui-dialog" title="查看学校" closed="true" modal="true" style="width:860px;height:550px;padding-top:20px;" iconCls="icon-building">
				<table id="campus_select_table" align="center" cellpadding="0"cellspacing="0" style="width: 95%;border-left: 1px solid #0478B5;border-top:  1px solid #0478B5;">
					<thead>
						<tr style="height:40px;">
							<td style="border-bottom: 1px solid #000;border-right: 1px solid #0478B5;background-color: #0478B5;" align="center" colspan="7">
								 <label style="font-size: 16px;margin-left: 15px;color:#fff;">
								 	<img src="img/campus/csinfo.png" style="width: 17px;vertical-align:middle;padding-bottom: 5px;"> 学校基本情况
								 </label>
							</td>
						</tr>
						<tr>
							<td style="padding: 10px 0px 10px 10px;border-bottom: 1px solid #000;width:100px; border-right: 1px solid #000;" rowspan="3" >
								<img src="img/campus/xuexiao.png" name="logo" style="width:80;height:80px;"/>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;width: 100px;">
								<label style="font-size: 12px;">&nbsp;学校名称:</label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;" colspan="2">
								<label style="font-size: 12px;" name="csname"></label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;width: 100px;">
								<label style="font-size: 12px;">&nbsp;学校标识码:</label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;"colspan="2">
								<label style="font-size: 12px;" name="cscode"></label>
							</td>
						</tr>
						<tr>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;width: 100px;">
								<label style="font-size: 12px;">&nbsp;学校别名:</label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;" name="csotname"></label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;width: 100px;">
								<label style="font-size: 12px;">&nbsp;学校性质:</label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;" name="csproerty"></label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;width: 100px;">
								<label style="font-size: 12px;">&nbsp;创办年份:</label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;width: 100px;"">
								<label style="font-size: 12px;" name="createyear"></label>
							</td>
						</tr>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;">&nbsp;学校地址:</label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #0478B5;" colspan="5">
								<label style="font-size: 12px;" name="csaddres"></label>
							</td>
						</tr>
					</thead>
					<tbody>
						<tr style="height:40px;">
							<td style="border-bottom: 1px solid #000;border-right: 1px solid #0478B5;background-color: #0478B5;" align="center" colspan="8">
								 <label style="font-size: 16px;margin-left: 15px;color:#fff;">
								 	<img src="img/campus/cstel.png" style="width: 17px;vertical-align:middle;padding-bottom: 5px;"> 学校联系方式
								 </label>
							</td>
						</tr>
						<tr>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000; width:100px;">
								<label style="font-size: 12px;">&nbsp;学校电话:</label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;" name="cstelnum"></label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;width:100px;">
								<label style="font-size: 12px;">&nbsp;校长姓名:</label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;" name="principal"></label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;width:100px;">
								<label style="font-size: 12px;">&nbsp;校长联系电话:</label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #0478B5;" colspan="2">
								<label style="font-size: 12px;" name="prnum"></label>
							</td>
						</tr>
						<tr>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;">&nbsp;分管领导姓名:</label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;" name="charger"></label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;">&nbsp;分管领导职务:</label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;" name="chagejob"></label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;">&nbsp;分管领导电话:</label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #0478B5;" colspan="2">
								<label style="font-size: 12px;" name="chrgtelnum"></label>
							</td>
						</tr>
						<tr>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;">&nbsp;邮政编码:</label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;" name="postcode"></label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;">
								<label style="font-size: 12px;">&nbsp;电子邮箱:</label>
							</td>
							<td style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #000;border-right: 1px solid #000;" colspan="4">
								<label style="font-size: 12px;" name="email"></label>
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr style="height:40px;">
							<td style="border-bottom: 1px solid #0478B5;border-right: 1px solid #0478B5;background-color: #0478B5;" align="center" colspan="7">
								 <label style="font-size: 16px;margin-left: 15px;color:#fff;">
								 	<img src="img/campus/csinfo.png" style="width: 17px;vertical-align:middle;padding-bottom: 5px;"> 学校简介
								 </label>
							</td>
						</tr>
						<tr style="height:90px;">
							<td colspan="7" style="padding: 10px 0px 10px 0px;border-bottom: 1px solid #0478B5;border-right: 1px solid #0478B5;">
								<label style="font-size: 12px;" name="csintro"></label>
							</td>
						</tr>
					</tfoot>
				</table>
				<table align="center" cellpadding="0"cellspacing="0">
					<tr>
						<td style="padding-top: 15px;" colspan="4" align="center">
						<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-cancel" style="margin-left: 10px;" onclick="dialog_close('campus_select_dialog');">关闭</a>
						</td>
					</tr>
				</table>
			</div>

			<!-- 学校编辑 -->
			<div id="campus_edit_dialog" class="easyui-dialog" title="编辑学校信息" closed="true" modal="true" style="width:850px;height:auto;padding-top:20px;" iconCls="icon-building">
				<table id="campus_edit_table" align="center" cellpadding="0"cellspacing="0" style="width: 90%;">
					<tr>
						<td colspan="6">
							<label style="font-size: 12px;color: #999d9c;">请先选择学校所在地区：</label>
							<input type="hidden" name="csid" />
						</td>
					</tr>
					<tr>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">省:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<select name="pccode" style="width: 150px; font-size:12px;" onchange="selectCityByPccodeCampusManage(this.value,'campus_edit_table','请选择');">
								<option value="">--请选择--</option>
							</select>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">市:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<select name="ctcode" style="width: 150px;font-size:12px;" onchange="selectAreaByCtcodeCampusManage(this.value,'campus_edit_table','请选择');">
								<option value="">--请选择--</option>
							</select>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">县/区:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<select name="aacode" style="width: 150px;font-size:12px;">
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
							<input type="text" name="cscode"/>
						</td>
						
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">创办年份:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
<!-- 							<input id="createyear" type="text" class="easyui-datebox" required="required"> -->
							<input type="text" name="createyear"/>
						</td>
					</tr>
					<tr>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">学校别名:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="csotname"/>
						</td>
						
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">学校性质:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<select name="csproerty" style="width: 150px;font-size:12px;">
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
							<input type="text" name="csaddres" value=""/>
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
							<input type="text" name="cstelnum"/>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">校长姓名:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="principal"/>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="color: red;">*</label>
							<label style="font-size: 12px;">校长联系电话:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="prnum"/>
						</td>
					</tr>
					<tr>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="font-size: 12px;">分管领导姓名:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="charger"/>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="font-size: 12px;">分管领导职务:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="chagejob"/>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="font-size: 12px;">分管领导电话:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="chrgtelnum"/>
						</td>
					</tr>
					
					<tr>
						
					</tr>
					<tr>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="font-size: 12px;">电子邮箱:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="email" value=""/>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<label style="font-size: 12px;">邮政编码:</label>
						</td>
						<td style="padding: 10px 0px 0px 0px;">
							<input type="text" name="postcode" value=""/>
						</td>
					</tr>
					<tr>
						<td>
							<label style="font-size: 12px;">学校简介:</label>
						</td>
						<td colspan="5" style="padding: 10px 0px 0px 0px;" align="center">
							<textarea name="csintro" style="font-size: 12px;width: 550px;height: 100px;resize: none;"></textarea>
						</td>
					</tr>
					<tr>
						<td style="padding: 10px 0px 0px 0px;" colspan="6" align="center">
							<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-save" onclick="campus_update_save();">保存</a>
							<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-cancel" style="margin-left: 10px;" onclick="dialog_close('campus_edit_dialog');">关闭</a>
						</td>
					</tr>
					<tr style="height: 10px;">
					</tr>
				</table>
			</div>
		</div>
		<script type="text/javascript">
			var html1 = "<option value=''>--全部-</option>";
			//页面加载完成
			$(document).ready(function(){
				//绑定回车搜索事件
				document.onkeydown = function(e){
					var ev = document.all ? window.event : e;
					if(ev.keyCode==13){
						campus_search();
					}
				};
				var pccode = "";
				var ctcode = "";
				var aacode = "";
				var csname = "";
				
				//提取所有省数据
  				$.ajax({
					url:"findAllProvince_campus.htm",
					type:"post",
					success:function(r){
						r=$.parseJSON(r);
						var html="<option value=''>--全部--</option>";
						for(var i=0;i<r.length;i++){
							html+="<option value='"+r[i].pccode+"'>"+r[i].pcname+"</option>";
						}
						$("#campus_search_div select[name='pccode']").html(html);
					},
					error:function(){
						$.messager.alert("系统提示","服务器连接失败","error");
					}
				});
				// 加载表格数据
				$('#campus_datagrid_table').datagrid({
					title :'', 
					fit : true,
					url : 'findListCount_campus.htm',
					queryParams : {
						pccode : pccode,
						ctcode : ctcode,
						aacode : aacode,
						csname : csname
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
						{field:'text',title:'',width:30,align:'center',checkbox:true},
						{field:'csid',title:'操作',width:130,align:'center',
							formatter:function(value,rowData,rowIndex){
								if(value!=undefined && value!=""){
									var html="";
									html+="<div class='rowButton_select' title='查看' onclick=\"javascript:campus_select_dialog_open('"+value+"');\"></div>";
									html+="<div class='rowButton_edit' title='编辑' onclick=\"javascript:campus_edit_dialog_open('"+value+"');\"></div>";
									html+="<div class='rowButton_delete' title='删除' onclick=\"javascript:campus_del('"+value+"');\"></div>";
									return html;
								}
							}
						},
						{field:'dq',title:'地区',width:150,align:'center',
							formatter: function(value,row,index){  
						   	if(value!=undefined && value!=""){
								return "<span title="+value+">"+value+"</span>"  ;
							}
						}},
						{field:'csname',title:'学校名称',width:120,align:'center',
							formatter: function(value,row,index){  
						   	if(value!=undefined && value!=""){
								return "<span title="+value+">"+value+"</span>"  ;
							}
						}},
						{field:'csotname',title:'学校别名',width:60,align:'center',
							formatter: function(value,row,index){  
						   	if(value!=undefined && value!=""){
								return "<span title="+value+">"+value+"</span>"  ;
							}
						}},
						{field:'cscode',title:'学校标识码',width:90,align:'center'},
						{field:'cstelnum',title:'学校电话',width:90,align:'center'},
						{field:'csaddres',title:'学校地址',width:120,align:'center',
							formatter: function(value,row,index){  
							if(value!=undefined && value!=""){
								return "<span title="+value+">"+value+"</span>"  ;
							}
						}},
						{field:'principal',title:'校长',width:80,align:'center'},
						{field:'prnum',title:'校长电话',width:120,align:'center'},
						{field:'email',title:'电子邮箱',width:150,align:'center'},
						{field:'postcode',title:'邮政编码',width:90,align:'center'}
					]],
					// 双击事件
					onDblClickRow:function (rowIndex, rowData){
						campus_select_dialog_open(rowData.csid);
					},
					// 加载成功
					onLoadSuccess : function () {
						$(this).datagrid("fixRownumber");
					}
				});
			});

			// 搜索事件
			function campus_search(){
				$('#campus_datagrid_table').datagrid("load",{
					pccode : $("#campus_search_div select[name='pccode']").val(),
					ctcode : $("#campus_search_div select[name='ctcode']").val(),
					aacode : $("#campus_search_div select[name='aacode']").val(),
					csname : $("#campus_search_div input[name='csname']").val(),
				});
			}
		
			// 打开新增学校的窗口
			function campus_add_dialog_open(){
				//清空里面的值
				$("#campus_add_table input").each(function(){
					$(this).val("");
				});
				$("#campus_add_table select[name='csproerty']").val("");
				$("#campus_add_table select[name='ctcode']").val("");
				$("#campus_add_table select[name='aacode']").val("");
				//提取所有省数据
				$.ajax({
					url:"findAllProvince_campus.htm",
					type:"post",
					success:function(r){
						r=$.parseJSON(r);
						var html="<option value=''style=\"color:#919191; font-size:14px;\">--请选择--</option>";
						for(var i=0;i<r.length;i++){
							html+="<option value='"+r[i].pccode+"'>"+r[i].pcname+"</option>";
						}
						$("#campus_add_table select[name='pccode']").html(html);
					},
					error:function(){
  						$.messager.alert("系统提示","服务器连接失败","error");
  					}
				});
				//打开窗口
				$("#campus_add_dialog").dialog("open");
			}
			
			// 根据省数据加载市数据
			function selectCityByPccodeCampusManage(pccode,xrdiv,tl){
				// 重置下拉列表
				if($("#"+xrdiv+" select[name='pccode']").val() == ""){
					$("#"+xrdiv+" select[name='ctcode']").html(html1);
					$("#"+xrdiv+" select[name='aacode']").html(html1);
					
				}
				//校验
				if(pccode==null || $.trim(pccode).length<=0){
  					$("#"+xrdiv+" select[name='ccode']").html("<option value=''>--"+tl+"--</option>");
  					$("#"+xrdiv+" select[name='aaid']").html("<option value=''>--"+tl+"--</option>");
  					return;
  				}
				$.ajax({
					url:"findCityByPccode_campus.htm",
					type:"post",
					data:{
						pccode : pccode
					},
					success:function(r){
						r=$.parseJSON(r);
						var hl="<option value=''>--"+tl+"--</option>";
						for(var k=0;k<r.length;k++){
							hl+="<option value='"+r[k].ctcode+"'>"+r[k].ctname+"</option>";
						}
						$("#"+xrdiv+" select[name='ctcode']").html(hl);
						$("#"+xrdiv+" select[name='aacode']").html("<option value=''>--"+tl+"--</option>");
					},
					error:function(){
						$.messager.alert("系统提示","服务器连接失败","error");
					}
				});
			}
			
			//根据市编码查询县区数据
			function selectAreaByCtcodeCampusManage(ctcode,xrdiv,tl){
				// 重置下拉列表
				if($("#"+xrdiv+" select[name='ctcode']").val() == ""){
					$("#"+xrdiv+" select[name='aacode']").html(html1);
				}
				
				//校验
				if(ctcode==null || $.trim(ctcode).length<=0){
  					$("#"+xrdiv+" select[name='aacode']").html("<option value=''>--"+tl+"--</option>");
  					return;
  				}
				$.ajax({
					url:"findAreaByCtcode_campus.htm",
					type:"post",
					data:{
						ctcode : ctcode
					},
					success:function(r){
						r=$.parseJSON(r);
						var hl="<option value=''>--"+tl+"--</option>";
						for(var k=0;k<r.length;k++){
							hl+="<option value='"+r[k].aacode+"'>"+r[k].aaname+"</option>";
						}
						$("#"+xrdiv+" select[name='aacode']").html(hl);
					},
					error:function(){
						$.messager.alert("系统提示","服务器连接失败","error");
					}
				});
			}
			
			//新增学校数据
			function campus_add(){
				//省
  				var pccode=$("#campus_add_table select[name='pccode']").val();
  				if(pccode==null || pccode==""){
  					$.messager.alert("系统提示","请选择所在省","warning");
  					return;
  				}
  				//市
  				var ctcode=$("#campus_add_table select[name='ctcode']").val();
  				if(ctcode==null || ctcode==""){
  					$.messager.alert("系统提示","请选择所在市","warning");
  					return;
  				}
  				//县区
  				var aacode=$("#campus_add_table select[name='aacode']").val();
  				if(aacode==null || aacode==""){
  					$.messager.alert("系统提示","请选择所在县/区","warning");
  					return;
  				}
  				
  				//学校名称
  				var csname=$("#campus_add_table input[name='csname']").val();
  				if(csname==null || $.trim(csname).length<=0){
  					$.messager.alert("系统提示","请填写学校名称","warning");
  					return;
  				}
  				//学校标识码
  				var cscode=$("#campus_add_table input[name='cscode']").val();
  				if(cscode==null || $.trim(cscode).length<=0){
  					$.messager.alert("系统提示","请填写学校标识码","warning");
  					return;
  				}
  				
  				// 创办年份
  				var createyear=$("#campus_add_table input[name='createyear']").val();
  				if(createyear==null || $.trim(createyear).length<=0){
  					$.messager.alert("系统提示","请填写年份","warning");
  					return;
  				}
  				
  				//学校别名
  				var csotname=$("#campus_add_table input[name='csotname']").val();
  				if(csotname==null || $.trim(csotname).length<=0){
  					$.messager.alert("系统提示","请填写学校别名","warning");
  					return;
  				}
  				
  				//学校性质
  				var csproerty=$("#campus_add_table select[name='csproerty']").val();
  				if(csproerty==null || $.trim(csproerty).length<=0){
  					$.messager.alert("系统提示","请选择学校性质","warning");
  					return;
  				}
  				
  				//学校地址
  				var csaddres=$("#campus_add_table input[name='csaddres']").val();
  				if(csaddres==null || $.trim(csaddres).length<=0){
  					$.messager.alert("系统提示","请填写学校地址","warning");
  					return;
  				}
  				
  				//学校电话
  				var cstelnum=$("#campus_add_table input[name='cstelnum']").val();
  				if(cstelnum==null || $.trim(cstelnum).length<=0){
  					$.messager.alert("系统提示","请填写学校电话","warning");
  					return;
  				}
  				
  				//校长姓名
  				var principal=$("#campus_add_table input[name='principal']").val();
  				if(principal==null || $.trim(principal).length<=0){
  					$.messager.alert("系统提示","请填写校长姓名","warning");
  					return;
  				}
  				
  				//校长联系电话
  				var prnum=$("#campus_add_table input[name='prnum']").val();
  				if(prnum==null || $.trim(prnum).length<=0){
  					$.messager.alert("系统提示","请填写校长联系电话","warning");
  					return;
  				}
  				
  				//分管领导姓名
  				var charger=$("#campus_add_table input[name='charger']").val();
  				//分管领导职务
  				var chagejob=$("#campus_add_table input[name='chagejob']").val();
  				//分管领导电话
  				var chrgtelnum=$("#campus_add_table input[name='chrgtelnum']").val();
  				
  				//电子邮箱
  				var email=$("#campus_add_table input[name='email']").val();
  				if($.trim(email).length>0){
  					var reg =/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
  					if(!reg.test(email)){
  						$.messager.alert("系统提示","请正确填写邮箱,格式为XXXX@XX.XX","warning");
  						return;
  					}
  				}
  				//邮政编码
  				var postcode=$("#campus_add_table input[name='postcode']").val();
  				//学校简介
  				var csintro=$("#campus_add_table textarea[name='csintro']").val();
  				$.messager.progress({title:"系统提示",msg:"数据保存中,请稍等..."});
  				$.ajax({
  					url : "addCampusData.htm",
  					type:"post",
  					data:{
  						pccode : pccode,
  						ctcode : ctcode,
  						aacode : aacode,
  						csname : csname,
  						cscode : cscode,
  						createyear : createyear,
  						csotname : csotname,
  						csproerty : csproerty,
  						csaddres : csaddres,
  						cstelnum : cstelnum,
  						principal : principal,
  						prnum : prnum,
  						charger : charger,
  						chagejob : chagejob,
  						chrgtelnum : chrgtelnum,
  						email : email,
  						postcode : postcode,
  						csintro : csintro
  					},
  					success:function(r){
  						$.messager.progress('close');
						r=$.parseJSON(r);
						if(r.result=="502"){
							$("#campus_add_dialog").dialog("close");
							$.messager.alert("系统提示",r.msg,"makegood");
							campus_search();
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
			
			// 关闭事件
			function dialog_close(id){
				$("#"+id).dialog("close");
			}
			
			//搜索导出
			function campus_search_exp(){
				var pccode = $("#campus_search_div select[name='pccode']").val();
				if(pccode=="undefined" || pccode==undefined){
					pccode="";
				}
				var	ctcode = $("#campus_search_div select[name='ctcode']").val();
				if(ctcode=="undefined" || ctcode==undefined){
					ctcode="";
				}
				var	aacode = $("#campus_search_div select[name='aacode']").val();
				if(aacode=="undefined" || aacode==undefined){
					aacode="";
				}
				var	csname = $("#campus_search_div input[name='csname']").val();
				if(csname=="undefined" || csname==undefined){
					csname="";
				}
				// 搜索导出请求地址
				var url="list_campusnew_exp.htm?csname="+csname+"&pccode="+pccode+"&ctcode="+ctcode+"&aacode="+aacode;
				window.open(url);
			}
			
			// 学校信息单条删除
			function campus_del(csid){
				$.messager.confirm('系统提示',"学校存在帐号不能删除，删除后不可撤销，是否确认删除?",function(btn){
					if(btn){
						$.messager.progress({title:"系统提示",msg:"数据删除中,请稍等..."});
						//检查是否登录超时
						$.ajax({
							url:"checkSession_index.htm",
							type:"post",
							async:false,
							success:function(r){
								r=$.parseJSON(r);
								if(r.result=="500"){
									alert(r.msg);
									window.location.href="exit_login_users.htm";
									return;
								}else{
									// 如果登录未超时则正常删除流程
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
							},
							error:function(){
								$.messager.alert("系统提示","服务器连接失败","error");
								return;
							}
						});
			 		}
			 	});
			}
			
			
			
			
			// 学校信息查看
			function campus_select_dialog_open(csid){
				//根据校区系统编号查询校区信息
				$.messager.progress({title:"系统提示",msg:"数据提取中,请稍等..."});
				$.ajax({
					url:"findCampusByCsid_campus.htm",
					type:"post",
					data:{
						csid : csid
					},
					success:function(r){
						$.messager.progress('close');
						r=$.parseJSON(r);
						if(r.result=="500"){
							$.messager.alert("系统提示",r.msg,"error");
						}else{
							$("#campus_select_table label[name='csname']").html("&nbsp;"+r.csname);
							$("#campus_select_table label[name='cscode']").html("&nbsp;"+r.cscode);
							$("#campus_select_table label[name='csotname']").html("&nbsp;"+r.csotname);
							$("#campus_select_table label[name='csproerty']").html("&nbsp;"+r.proerty);
							$("#campus_select_table label[name='csaddres']").html("&nbsp;"+r.address);
							$("#campus_select_table label[name='createyear']").html("&nbsp;"+r.createyear);
							$("#campus_select_table label[name='cstelnum']").html("&nbsp;"+r.cstelnum);
							$("#campus_select_table label[name='principal']").html("&nbsp;"+r.principal);
							$("#campus_select_table label[name='prnum']").html("&nbsp;"+r.prnum);
							$("#campus_select_table label[name='charger']").html("&nbsp;"+r.charger);
							$("#campus_select_table label[name='chagejob']").html("&nbsp;"+r.chagejob);
							$("#campus_select_table label[name='chrgtelnum']").html("&nbsp;"+r.chrgtelnum);
							$("#campus_select_table label[name='postcode']").html("&nbsp;"+r.postcode);
							$("#campus_select_table label[name='csintro']").html("&nbsp;"+r.csintro);
							$("#campus_select_table label[name='email']").html("&nbsp;"+r.email);
							$("#campus_select_dialog").dialog("open");
						}
					},
					error:function(){
						$.messager.progress('close');
						$.messager.alert("系统提示","服务器连接失败","error");
					}
				});
			}
			
			
			
			
			
			//学校信息编辑
  			function campus_edit_dialog_open(csid){
  				//根据校区系统编号查询校区信息
  				$.messager.progress({title:"系统提示",msg:"数据提取中,请稍等..."});
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
		  				$("#campus_edit_table input[name='csname']").val(r.csname);
		  				//学校标识码
		  				$("#campus_edit_table input[name='cscode']").val(r.cscode);
		  				//学校别名
		  				$("#campus_edit_table input[name='csotname']").val(r.csotname);
		  				//学校性质
		  				$("#campus_edit_table select[name='csproerty']").val(r.csproerty);
		  				//创办年份
		  				$("#campus_edit_table input[name='createyear']").val(r.createyear);
		  				//学校电话
		  				$("#campus_edit_table input[name='cstelnum']").val(r.cstelnum);
		  				//校长姓名
		  				$("#campus_edit_table input[name='principal']").val(r.principal);
		  				//校长联系电话
		  				$("#campus_edit_table input[name='prnum']").val(r.prnum);
		  				//分管领导姓名
		  				$("#campus_edit_table input[name='charger']").val(r.charger);
		  				//分管领导职务
		  				$("#campus_edit_table input[name='chagejob']").val(r.chagejob);
		  				//分管领导电话
		  				$("#campus_edit_table input[name='chrgtelnum']").val(r.chrgtelnum);
		  				//学校地址
		  				$("#campus_edit_table input[name='csaddres']").val(r.csaddres);
		  				//电子邮箱
		  				$("#campus_edit_table input[name='email']").val(r.email);
		  				//邮政编码
		  				$("#campus_edit_table input[name='postcode']").val(r.postcode);
		  				//学校简介
		  				$("#campus_edit_table textarea[name='csintro']").val(r.csintro);
		  				//学校系统编号
		  				$("#campus_edit_table input[name='csid']").val(r.csid);
		  				var pccode=r.pccode;
		  				var ctcode=r.ctcode;
		  				var aacode=r.aacode;
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
								$("#campus_edit_table select[name='pccode']").html(html);
								$("#campus_edit_table select[name='pccode']").val(pccode);
							},
							error:function(){
								$.messager.progress('close');
								$.messager.alert("系统提示","服务器连接失败","error");
							}
						});
						//根据省系统编号提取市数据
						$.ajax({
							url:"findCityByPccode_campus.htm",
							type:"post",
							async:false,
							data:{
								pccode : pccode
							},
							success:function(r){
								r=$.parseJSON(r);
								var hml="<option value=''>--请选择--</option>";
								for(var j=0;j<r.length;j++){
									hml+="<option value='"+r[j].ctcode+"'>"+r[j].ctname+"</option>";
								}
								$("#campus_edit_table select[name='ctcode']").html(hml);
								$("#campus_edit_table select[name='ctcode']").val(ctcode);
							},
							error:function(){
								$.messager.progress('close');
								$.messager.alert("系统提示","服务器连接失败","error");
							}
						});
						//根据市系统编号查询县区数据
						$.ajax({
							url:"findAreaByCtcode_campus.htm",
							type:"post",
							async:false,
							data:{
								ctcode : ctcode
							},
							success:function(r){
								r=$.parseJSON(r);
								var hl="<option value=''>--请选择--</option>";
								for(var k=0;k<r.length;k++){
									hl+="<option value='"+r[k].aacode+"'>"+r[k].aaname+"</option>";
								}
								$("#campus_edit_table select[name='aacode']").html(hl);
								$("#campus_edit_table select[name='aacode']").val(aacode);
							},
							error:function(){
								$.messager.progress('close');
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
			
			
			
			
			
			// 学校信息编辑保存
			function campus_update_save(){
				//省
  				var pccode=$("#campus_edit_table select[name='pccode']").val();
  				if(pccode==null || pccode==""){
  					$.messager.alert("系统提示","请选择所在省","warning");
  					return;
  				}
  				//市
  				var ctcode=$("#campus_edit_table select[name='ctcode']").val();
  				if(ctcode==null || ctcode==""){
  					$.messager.alert("系统提示","请选择所在市","warning");
  					return;
  				}
  				//县区
  				var aacode=$("#campus_edit_table select[name='aacode']").val();
  				if(aacode==null || aacode==""){
  					$.messager.alert("系统提示","请选择所在县/区","warning");
  					return;
  				}
  				
  				//学校名称
  				var csname=$("#campus_edit_table input[name='csname']").val();
  				if(csname==null || $.trim(csname).length<=0){
  					$.messager.alert("系统提示","请填写学校名称","warning");
  					return;
  				}
  				//学校标识码
  				var cscode=$("#campus_edit_table input[name='cscode']").val();
  				if(cscode==null || $.trim(cscode).length<=0){
  					$.messager.alert("系统提示","请填写学校标识码","warning");
  					return;
  				}
  				
  				// 创办年份
  				var createyear=$("#campus_edit_table input[name='createyear']").val();
  				if(createyear==null || $.trim(createyear).length<=0){
  					$.messager.alert("系统提示","请填写年份","warning");
  					return;
  				}
  				
  				//学校别名
  				var csotname=$("#campus_edit_table input[name='csotname']").val();
  				if(csotname==null || $.trim(csotname).length<=0){
  					$.messager.alert("系统提示","请填写学校别名","warning");
  					return;
  				}
  				
  				//学校性质
  				var csproerty=$("#campus_edit_table select[name='csproerty']").val();
  				if(csproerty==null || $.trim(csproerty).length<=0){
  					$.messager.alert("系统提示","请选择学校性质","warning");
  					return;
  				}
  				
  				//学校地址
  				var csaddres=$("#campus_edit_table input[name='csaddres']").val();
  				if(csaddres==null || $.trim(csaddres).length<=0){
  					$.messager.alert("系统提示","请填写学校地址","warning");
  					return;
  				}
  				
  				//学校电话
  				var cstelnum=$("#campus_edit_table input[name='cstelnum']").val();
  				if(cstelnum==null || $.trim(cstelnum).length<=0){
  					$.messager.alert("系统提示","请填写学校电话","warning");
  					return;
  				}
  				
  				//校长姓名
  				var principal=$("#campus_edit_table input[name='principal']").val();
  				if(principal==null || $.trim(principal).length<=0){
  					$.messager.alert("系统提示","请填写校长姓名","warning");
  					return;
  				}
  				
  				//校长联系电话
  				var prnum=$("#campus_edit_table input[name='prnum']").val();
  				if(prnum==null || $.trim(prnum).length<=0){
  					$.messager.alert("系统提示","请填写校长联系电话","warning");
  					return;
  				}
  				
  				//分管领导姓名
  				var charger=$("#campus_edit_table input[name='charger']").val();
  				//分管领导职务
  				var chagejob=$("#campus_edit_table input[name='chagejob']").val();
  				//分管领导电话
  				var chrgtelnum=$("#campus_edit_table input[name='chrgtelnum']").val();
  				
  				//电子邮箱
  				var email=$("#campus_edit_table input[name='email']").val();
  				if($.trim(email).length>0){
  					var reg =/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
  					if(!reg.test(email)){
  						$.messager.alert("系统提示","请正确填写邮箱,格式为XXXX@XX.XX","warning");
  						return;
  					}
  				}
  				//邮政编码
  				var postcode=$("#campus_edit_table input[name='postcode']").val();
  				//学校简介
  				var csintro=$("#campus_edit_table textarea[name='csintro']").val();
  				//学校系统编号
  				var csid=$("#campus_edit_table input[name='csid']").val();
  				$.messager.progress({title:"系统提示",msg:"数据保存中,请稍等..."});
  				$.ajax({
  					url : "editCampus_campus.htm",
  					type:"post",
  					data:{
  						pccode : pccode,
  						ctcode : ctcode,
  						aacode : aacode,
  						csname : csname,
  						cscode : cscode,
  						createyear : createyear,
  						csotname : csotname,
  						csproerty : csproerty,
  						csaddres : csaddres,
  						cstelnum : cstelnum,
  						principal : principal,
  						prnum : prnum,
  						charger : charger,
  						chagejob : chagejob,
  						chrgtelnum : chrgtelnum,
  						email : email,
  						postcode : postcode,
  						csintro : csintro,
  						csid : csid
  					},
  					success:function(r){
  						$.messager.progress('close');
						r=$.parseJSON(r);
						if(r.result=="502"){
							$("#campus_edit_dialog").dialog("close");
							$.messager.alert("系统提示",r.msg,"makegood");
							campus_search();
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
			
			// 学校信息批量删除
			function campus_delBat(){
				// 获取选中的list
				var list=$('#campus_datagrid_table').datagrid("getSelections");
				if(list.length<=0){
					$.messager.alert("系统提示","请选择您要删除的学校","warning");
					return;
				}
				var csIds="";
				//将选中的多条数据的csid进行拼接
				for(var i=0;i<list.length;i++){
					if(csIds!=""){
						csIds+=",";
					}
					csIds+=list[i].csid;
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
			
			//打开学校导入窗口
  			function open_campus_imp(){
  				//初始化选择文件
  				$("#campus_imp_dialog input[name='csfile']").val("");
  				$("#campus_imp_dialog").dialog("open");
  			}
			
			//学校导入Excel模板下载
			function down_campus_imp_mode(){
				window.open("down_campus_imp_mode.htm");
			}
			
			// excel学校信息导入
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
  							$("#campus_imp_dialog").dialog('close');
  							$('#campus_datagrid_table').datagrid("reload");
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
		</script>
	</body>
</html>