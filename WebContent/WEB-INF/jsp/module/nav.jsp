<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<nav style="background-color: #ffffff; border-bottom: solid 1px"
	class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<a href="#" class="navbar-brand "
				style="padding: 0px 15px 0px 0px; margin: 0px"><img
				src="img/cxtv.png" alt="抽象TV"></a>
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar-collapse">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>


		<div class="collapse navbar-collapse" id="navbar-collapse">

			<ul style="margin-top: 0px" class="nav navbar-nav navbar-left	">
				<li id="main"><a href="#"><span
						class="glyphicon glyphicon-home"></span> 首页</a></li>
				<li id="zbsj"><a href="zbsj"><span
						class="glyphicon glyphicon-th-list"></span> 直播数据</a></li>
				<li id="ltkg"><a href="ltkg"><span
						class="glyphicon glyphicon-headphones"></span> 歪歪K歌</a></li>
				<li id="cxrj"><a href="cxrj"><span
						class="glyphicon glyphicon-book"></span> 抽象日记</a></li>
			</ul>


			<c:choose>
				<c:when test="${sessionScope.user!=null}">
					<ul style="margin-top: 0px" class="nav navbar-nav navbar-right">
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"> ${user.username}<span class="caret"></span>
						</a>
							<ul class="dropdown-menu">
								<c:if test="${user.userType=='管理员'}">
									<li><a href="admin">管理</a></li>
									<li role="separator" class="divider"></li>
								</c:if>

								<li><a id="logout">退出</a></li>
							</ul></li>
						
							<c:if test="${user.whosFans=='护毅宝'}">
								<span class="label label-default wfslabel">${user.whosFans}</span>
							</c:if>
							<c:if test="${user.whosFans!='护毅宝'}">
								<span class="label label-primary wfslabel">${user.whosFans}</span>
							</c:if>
							<c:if test="${user.userType=='管理员'}">
								<span class="label label-danger wfslabel ">${user.userType}</span>
							</c:if>
						

					</ul>



				</c:when>
				<c:otherwise>
					<ul style="margin-top: 0px" class="nav navbar-nav navbar-right">
						<li><a href="#" data-toggle="modal" data-target="#login"><span
								class="glyphicon glyphicon-user"></span> 登录</a></li>
						<li><a href="#" data-toggle="modal" data-target="#register"><span
								class="glyphicon glyphicon-pencil"></span> 注册</a></li>
					</ul>
				</c:otherwise>
			</c:choose>



		</div>
	</div>

</nav>