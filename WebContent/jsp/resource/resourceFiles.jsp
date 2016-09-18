<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>资产附件</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/easyui/themes/color.css">
<script
	src="${pageContext.request.contextPath}/jquery/jquery-2.1.3.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
</head>
<body>
	<div style="margin:20px;">
		<table id="dg" class="easyui-datagrid" style="width:100%;"
			data-options="url:'${ctx}/resource/getResourceFiles.do?rid=${rid}',fitColumns:true,singleSelect:true,remoteSort:false">
			<thead>
				<tr>
					<th data-options="field:'id',hidden:true">附件标识</th>
					<th data-options="field:'rid',hidden:true">资产标识</th>
					<th data-options="field:'fileName',width:50,sortable:true">附件名称</th>
					<th data-options="field:'remark',width:100,sortable:true">备注信息</th>
					<th data-options="field:'uploader',width:30,sortable:true">上传者</th>
					<th data-options="field:'uploadTime',width:40,sortable:true">上传时间</th>
					<th data-options="field:'download_file_bt',width:30,formatter:download_file_formatter">下载</th>
					<th data-options="field:'remove_file_bt',width:30,formatter:remove_file_formatter">删除</th>			
				</tr>
			</thead>
		</table>
	</div>
	
	<div id="uploadFileToolbar" style="display: none">
		<a href="#" class="easyui-linkbutton" iconCls="icon-upload" plain="true"
			onclick="uploadFile()">上传附件</a>
	</div>
	
	<div id="dlg" class="easyui-dialog"
		style="width: 380px; height: 325px; padding: 20px" closed="true"
		buttons="#dlg-buttons">
		<form id="fm" method="post" enctype="multipart/form-data">
			<table cellpadding="5">
				<tr style="display:none;">
					<th>资产标识</th>
					<td><input id="rid" name="rid" class="easyui-validatebox"></td>
				</tr>
				<tr>
					<th colspan="2">附件选择</th>
				</tr>
				<tr>
					<td colspan="2">
						<input class="easyui-filebox" id="file" name="file" 
							data-options="prompt:'请选择一个文件'" style="height: 30px; width: 100%;">
					</td>
				</tr>
				<tr>
					<th colsapn="2">备注信息</th>
				</tr>
				<tr>
					<td><input name="remark" class="easyui-textbox" data-options="multiline:true" 
						style="width: 300px; height: 100px"></td>
				</tr>
			</table>
		</form>
	</div>

	<div id="dlg-buttons">
		<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
			onclick="submitFile()">上传</a> <a href="#"
			class="easyui-linkbutton" iconCls="icon-cancel"
			onclick="javascript:$('#dlg').dialog('close')">取消</a>
	</div>
	
	<div id="info-dlg" class="easyui-dialog"
		style="width: 300px; height: 140px; padding: 10px 20px" closed="true"
		buttons="#info-dlg-buttons">
		<label id="dialogInfo" style="font-size: 15px;"></label>
	</div>

	<div id="info-dlg-buttons">
		<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
			onclick="javascript:$('#info-dlg').dialog('close')">确定</a>
	</div>
	
<script type="text/javascript">
	$(function(){
		$('#dg').datagrid({
			toolbar:'#uploadFileToolbar',
			//直接在formatter中设置linkbutton样式无法加载
			onLoadSuccess:function(data){
				//没有数据时进行提示
				if(data.total==0){
					//设置没有数据时在表格中进行提示
					$('#dg').datagrid('appendRow',{
						fileName:"<div style='font-weight:bold;margin-left:400px;'>没有相关数据</div>"
					});
					$('#dg').datagrid('mergeCells',{
						index:0,
						field:'fileName',
						colspan:6
					});
				}
				$('.downlaod_file_style').linkbutton({text:'下载',plain:true,iconCls:'icon-download'});
				$('.remove_file_style').linkbutton({text:'删除',plain:true,iconCls:'icon-delete'}); 

			}	
		});
	});

	//文件下载按钮样式
	function download_file_formatter(value,row,index){
		return '<a href="${ctx}/resource/downloadFile.do?id='+row.id+'" class="downlaod_file_style" style="margin-bottom:-5px;"></a>';	
	}
	
	//文件删除按钮样式
	function remove_file_formatter(value,row,index){
		if('${uid}'==row.uploader){
			return '<a href="#" class="remove_file_style" style="margin-bottom:-5px;" onclick="removeFile('+row.id+')"></a>';
		}	
	}
	
	//打开附件上传窗口
	function uploadFile(){
		$('#dlg').dialog('open').dialog('setTitle', '附件上传');
		$('#rid').val('${rid}');
	}
	
	//上传文件
	function submitFile(){
		if ($('#file').filebox('getValue') == "") {
			$('#dialogInfo').text("请选择文件进行上传！");
			$('#info-dlg').dialog('open').dialog('setTitle', '提示');
			return;
		}
		$('#fm').form(
				'submit',
				{
					url : '${ctx}/resource/uploadFile.do',
					success : function(result) {
						$('#dlg').dialog('close'); // close the dialog
						$('#fm').form('clear');//clear the form
						result = JSON.parse(result);
						if (result.success) {
							$('#dialogInfo').text("附件上传成功！");
							$('#info-dlg').dialog('open').dialog(
									'setTitle', '成功');
							$('#dg').datagrid('reload');
						} else {
							if(result.msg=="Same Filename"){
								$('#dialogInfo').text("附件上传失败，存在同名文件，请修改文件名后再上传！");
								$('#info-dlg').dialog('open').dialog(
										'setTitle', '失败');
							}
						}

					}
				});
	}
	
	//删除文件
	function removeFile(id){
		$.messager.confirm('提示', '确定删除该文件嘛?', function(result){
			if (result){
				$.post(
						"${ctx}/resource/deleteFile.do",{
							id:id
						},function(result){
							if(result.success){
								$('#dialogInfo').text("附件删除成功！");
								$('#info-dlg').dialog('open').dialog(
										'setTitle', '成功');
								$('#dg').datagrid('reload');
							}
						}
					);
			}
		});

	}
	
	
	
</script>

</body>
</html>