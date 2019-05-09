<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/adminjs/css/bootstrap.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/adminjs/css/css.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/adminjs/js/jquery1.9.0.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/adminjs/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/adminjs/js/sdmenu.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/adminjs/js/laydate/laydate.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/adminjs/css/jquery.dialog.css">
	<script src="${pageContext.request.contextPath}/adminjs/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/adminjs/js/jquery.dialog.js"></script>
	<style type="text/css">
		#vvv{text-align:right;margin:0;padding:0;}
	</style>
	<script type="text/javascript">		
		function toget() { 
    		var msg = "您真的确定要接单吗？\n\n请确认！"; 
    		if (confirm(msg)==true){ 
    		return true; 
    		}else{ 
    		return false; 
    		} 
    		}
	</script>
</head>
<body>
    <div class="right" id="mainFrame">
        <div class="right_cont">
            <ul class="breadcrumb">
               	 当前位置：<a href="${pageContext.request.contextPath}/welcome.html">首页</a>
                <span class="divider">/</span>
                <a href="#">厨师个人功能</a>
                <span class="divider">/</span>做菜管理
            </ul>
            <div class="title_right">
                <strong>做菜管理</strong>
            </div>			
            <div style="width:99%; margin:auto">
                <!--表格开始-->
				<table class="table table-bordered table-striped table-hover">
					<tbody>
						<tr align="center">
							<td>顾客昵称</td>
							<td>性别</td>
							<td>年龄</td>
							<td>电话</td>														
         				</tr>
						<tr align="left">
							<td>${user.username}</td>
							<td>${user.sex==1?"男":"女"}</td>
							<td>${user.age}</td>
							<td>${user.tel}</td>
         				</tr>
					</tbody>
				</table>
            </div>
        </div>
    </div><!-- 底部 -->
    <script>
        !function(){
            laydate.skin('molv');
            laydate({
                elem: '#Calendar'
            });
            laydate.skin('molv');
            laydate({
                elem: '#Calendar2'
            });
        }();
    </script>
</body>
</html>
