<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1,IE=9">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="抽象TV,抽象官网，抽象tv官网">
<meta http-equiv="description" content="This is my page">
<link rel="icon" href="<%=basePath%>img/cxtv_logo.jpg">
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
<link href="<%=basePath%>css/style.css" rel="stylesheet">
<title>封禁记录_抽象TV</title>
</head>
<body>

	<!-- 导航 -->
	<jsp:include page="module/nav.jsp"></jsp:include>

	<div id="shuju">
		<div class="container">
			<div class="row">
				<div class="col-md-2">
					<div class="list-group">
						<a href="zbsj/lwjl?page=1" class="list-group-item "><span class="glyphicon glyphicon-gift"></span> 礼物记录</a> <a
							href="zbsj/fjjl" class="list-group-item active"><span class="glyphicon glyphicon-ban-circle"></span> 封禁记录</a>
					</div>
				</div>

				<div class="col-md-10">
					<div class="alert alert-warning alert-dismissible" role="alert">
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<strong>提示</strong> 本站数据从2016年8月1日 00:00:00开始
					</div>
					<form id="form2" action="zbsj/fjjl" method="post">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="输入ID查找记录"
								name="inputname"> <span class="input-group-btn">
								<button id="search" class="btn btn-default" type="button">搜索！</button>
							</span>
						</div>
					</form>
					<table class="table table-striped">
						<thead>
							<tr>
								<th>#</th>
								<th>封禁ID</th>
								<th>管理员</th>
								<th>封禁时间</th>
								<th>解封时间</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${bannedRecord}" var="banned">
								<tr>
									<td>${banned.id}</td>
									<td>${banned.name}</td>
									<td>${banned.operator}</td>
									<td><fmt:formatDate value="${banned.banTime}" type="both" /></td>
									<td><fmt:formatDate value="${banned.unlockTime}"
											type="both" /></td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>




	<!-- 页脚 -->
	<jsp:include page="module/footer.jsp"></jsp:include>

	<!-- 登录模态窗口 -->
	<jsp:include page="module/loginWindow.jsp"></jsp:include>
	<!-- 注册模态窗 -->
	<jsp:include page="module/registerWindow.jsp"></jsp:include>
	<!-- 联系站长模态窗口 -->
	<jsp:include page="module/contactWindow.jsp"></jsp:include>
	<!-- 支持作者模态窗口 -->
	<jsp:include page="module/subscribeWindow.jsp"></jsp:include>
	<!-- 反馈模态窗口 -->
	<jsp:include page="module/feedbackWindow.jsp"></jsp:include>

	<script src="<%=basePath%>js/jquery-1.10.1.js"></script>
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
	<script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
	<script
		src="http://apps.bdimg.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<script type="text/javascript">
		$('#search').click(function() {
			$('#form2').submit();
		});
	</script>
	<script src="<%=basePath%>js/bootstrapValidator.min.js"></script>
	<script src="http://static.geetest.com/static/tools/gt.js"></script>
	<script src="<%=basePath%>js/validator.js"></script>
	<script src="<%=basePath%>js/geetest.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#zbsj').addClass("active");
		});
	</script>

</body>
</html>