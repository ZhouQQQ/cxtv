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
<title>抽象日记_抽象TV</title>
</head>
<body style="background-color: #eee">

	<!-- 导航 -->
	<jsp:include page="module/nav.jsp"></jsp:include>

	<div id="shuju">
		<div class="container">
			<div class="alert alert-info alert-dismissible" role="alert"
				style="text-align: center; margin-bottom: 5px">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<strong>注意：</strong>本版块目前摘录 自百度抽象tv贴吧<a
					href="http://tieba.baidu.com/p/4512436760?pn=1" target="_blank"
					style="color: #">联合·突击的帖子</a>

			</div>

			<c:forEach items="${allCxrj}" var="cxrj">
				<div class="row info-content" >
					<div class="col-md-4">
						<img class="img-responsive" alt="" src="${cxrj.cover}">
					</div>

					<div class="col-md-8" style="position: relative;" >
						<h2>
							<strong>${cxrj.title}</strong>
						</h2>

						<div style="max-height: 200px; overflow: auto;">${cxrj.content}</div>

						<p
							style="color: #677AB2;">
							<i> <fmt:formatDate value="${cxrj.date}" type="date" /></i>
						</p>

					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<!-- 页脚 -->
	<jsp:include page="module/footer.jsp"></jsp:include>

	<!-- 注册模态窗 -->
	<jsp:include page="module/registerWindow.jsp"></jsp:include>
	<!-- 登录模态窗口 -->
	<jsp:include page="module/loginWindow.jsp"></jsp:include>
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
		$("iframe").attr("height", "500").attr("width", "800").attr(
				"isAutoPlay", "true");
	</script>
	<script src="<%=basePath%>js/bootstrapValidator.min.js"></script>
	<script src="http://static.geetest.com/static/tools/gt.js"></script>
	<script src="<%=basePath%>js/validator.js"></script>
	<script src="<%=basePath%>js/geetest.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#cxrj').addClass("active");
		});
	</script>
</body>
</html>