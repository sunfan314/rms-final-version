<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.qlove.server.rms.util.ResourceTypeConfig"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="resourceType" value="${type.id}" />
<c:set var="resourceFatherType" value="${type.fatherType}" />
<c:set var="SIM_CARD_TYPE" value="<%=ResourceTypeConfig.SIM_CARD%>" />
<c:set var="PHONE_CARD_TYPE" value="<%=ResourceTypeConfig.PHONE_CARD%>" />
<c:set var="CONSUMABLE_TYPE" value="<%=ResourceTypeConfig.CONSUMABLE%>" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>某类别资产列表</title>
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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/easyui/expand/datagrid-detailview.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/layer/layer.js"></script>
</head>
<body>
	<div style="margin-left:300px;margin-top:200px;">
		<a id="bt1" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">点击</a>
	</div>


<script type="text/javascript">
	$(function(){
		$('#bt1').on('click',function(){
			layer.open({
				type:1,
				title:'提示',
				content:'<div>LLL</div>',
				success:function(index,layero){
					alert("ss");
				}
			
			})
		})
		
	});
	
	
</script>
	
</body>
</html>