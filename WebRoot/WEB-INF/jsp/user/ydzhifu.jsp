<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<title>预订支付</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/userjs/css/base.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/userjs/css/shop_common.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/userjs/css/shop_manager.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/userjs/css/shop_header.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/userjs/css/shop_list.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/userjs/css/shop_goods.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/userjs/css/shop_gouwuche.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/userjs/css/shop_form.css" type="text/css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/userjs/js/jquery.js" ></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/userjs/js/topNav.js" ></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/userjs/js/shop_goods.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/userjs/js/jquery.goodnums.js" ></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/userjs/js/shop_gouwuche.js" ></script>
	<style type="text/css">
		.font > p {
			font-size: 40px;
			text-shadow: 5px 5px 5px black, 0px 0px 2px red, 2px 2px 3px green;
		}
	</style>
</head>
<body>
	<!-- Header  -zy-2019/05/10 -->
	<div class="shop_hd">
		<!-- Header TopNav -->
		<div class="shop_hd_topNav">
			<div class="shop_hd_topNav_all">
				<!-- Header TopNav Left -->
				<c:choose>
					<c:when test="${sessionScope.user.username!=null}">
						<div class="shop_hd_topNav_all_left">
							<p>您好！<b><a href="#">${sessionScope.user.username}</a></b>[<a href="${pageContext.request.contextPath}/user/logout.action">退出</a>]</p>
						</div>
					</c:when>
					<c:otherwise>
						<div class="shop_hd_topNav_all_left">
							<p>您好，欢迎来到<b><a href="/">来怡饭店</a></b>[<a href="${pageContext.request.contextPath}/user/userLogin.action">登录</a>][<a href="">注册</a>]</p>
						</div>
					</c:otherwise>	
				</c:choose>
				<!-- Header TopNav Left End -->
			</div>
			<div class="clear"></div>
		</div>
		<div class="clear"></div>
		<!-- Header TopNav End -->

		<!-- TopHeader Center -->
		<div class="shop_hd_header">
			
			<div class="shop_hd_header_logo font">
	 			<p><i>来怡饭店</i></p>
			</div>
			<div class="shop_hd_header_search">
                <ul class="shop_hd_header_search_tab">
			         <li id="search" class="current">商品</li>
			    </ul>
                <div class="clear"></div>
			    <div class="search_form">
			    	<form method="post" action="${pageContext.request.contextPath}/food/findByFname.action">
			    		<div class="search_formstyle">
			    			<input type="text" class="search_form_text" name="searchContent"  />
			    			<input type="submit" class="search_form_sub" name="secrch_submit" value="" title="搜索" />
			    		</div>
			    	</form>
			    </div>
			</div>
		</div>
		<div class="clear"></div>
		<!-- TopHeader Center End -->

		<!-- Header Menu -->
		<div class="shop_hd_menu">
			<!-- 所有商品菜单 -->
                        
			<div id="shop_hd_menu_all_category" class="shop_hd_menu_all_category"><!-- 首页去掉 id="shop_hd_menu_all_category" 加上clsss shop_hd_menu_hover -->
				<div class="shop_hd_menu_all_category_title"><h2 title="所有商品分类"><a href="javascript:void(0);">所有商品分类</a></h2><i></i></div>
				<div id="shop_hd_menu_all_category_hd" class="shop_hd_menu_all_category_hd">
					<ul class="shop_hd_menu_all_category_hd_menu clearfix">
						<!-- 单个菜单项 -->
						<c:forEach items="${sessionScope.cuisines}" var="c">
							<li id="cat_1" class="">
								<h3><a href="${pageContext.request.contextPath}/food/findByCuisine.action?id=${c.id}">${c.cuisine}</a></h3>
	                        </li>
                        </c:forEach>
					</ul>
				</div>
			</div>
			<!-- 所有商品菜单 END -->
			<!-- 普通导航菜单 -->
			<ul class="shop_hd_menu_nav">
				<li class="link"><a href="${pageContext.request.contextPath}/food/toindex.action"><span>首页</span></a></li>			
				<li class="current_link"><a href="${pageContext.request.contextPath}/table/tableList.action"><span>预订餐桌</span></a></li>
				<li class="link"><a href="${pageContext.request.contextPath}/cart/tomyCart.action"><span>我的购物车</span></a></li>
				<li class="link"><a href="${pageContext.request.contextPath}/user/myInfo.action"><span>个人中心</span></a></li>
			</ul>
			<!-- 普通导航菜单 End -->
		</div>
		<!-- Header Menu End -->
	</div>
	<div class="clear"></div>
	
	<!-- 面包屑 注意首页没有 -->
	<div class="shop_hd_breadcrumb">
		<strong>当前位置：</strong>
		<span>
			<a href="${pageContext.request.contextPath}/table/tableList.action">预订餐桌</a>&nbsp;›&nbsp;
			<a href="">支付</a>
		</span>
	</div>
	
	<div class="clear"></div>
	<!-- 我的个人中心 -->
	<div class="shop_member_bd clearfix">
		
		<!-- 右边购物列表 -->
		<div class="shop_member_bd_right clearfix">
			
			<p style="text-align: center;"><img  width="40%" height="40%" src="${pageContext.request.contextPath}/userjs/images/ydzf.jpg" />
			</br>
			<a href="zhifuchenggong.action?id=${id }&capacity=${capacity}">支付成功</a>
			</p>
		</div>
		<!-- 右边购物列表 End -->
		
	</div>
	<!-- 我的个人中心 End -->     
 
	<div class="clear"></div>
	<div class="shop_footer">
            <div class="shop_footer_link">
                <p> 
					<a href="#">首页</a> |
				 	<a href="#">广告合作</a> |
				 	<a href="#">关于来怡饭店</a> |
				 	<a href="#">联系我们</a>
				</p>	
            </div>
            <div class="shop_footer_copy">
                <p>According to the first version designed by le yi hotels</p>
            </div>
        </div>
	<!-- Footer End -->
</body>
</html>

