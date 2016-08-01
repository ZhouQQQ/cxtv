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
<link href="<%=basePath%>css/overhang.min.css" rel="stylesheet">
<title>管理_抽象TV</title>
</head>
<body style="background-color: #CCCCCC">

	<!-- 导航 -->
	<jsp:include page="module/nav.jsp"></jsp:include>

	<div style="margin: 100px auto" class="container-fluid">
		<div class="row">
			<div class="col-md-2">
				<div class="list-group">
					<a href="admin/ltkg" class="list-group-item "><span
						class="glyphicon glyphicon-headphones"></span> 管理K歌<span
						class="badge">${countLtkg}</span></a> <a href="admin/cxrj"
						class="list-group-item"><span class="glyphicon glyphicon-book"></span>
						管理日记<span class="badge">${countCxrj}</span></a>
				</div>

				<div class="list-group">
					<a href="admin/users" class="list-group-item"><span
						class="glyphicon glyphicon-user"></span> 管理用户</a>

				</div>
			</div>

			<div class="col-md-10">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>公告</h4>
					</div>
					<div class="panel-body">
						<h1></h1>
						<p>目前正在测试中,请不要随意删除原有内容,自己增加内容之后再删除 谢谢！</p>

					</div>
				</div>

				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>用户反馈</h4>
					</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-hover">
								<tr>
									<th>序号</th>
									<th>邮箱</th>
									<th>内容</th>
									<th>时间</th>
									<th>操作</th>
								</tr>
								<c:forEach items="${allFeedback}" var="feedback">
									<tr>
										<td>${feedback.id}</td>
										<td>${feedback.email}</td>
										<td>${feedback.content}</td>
										<td><fmt:formatDate value="${feedback.datetime}"
												pattern="yyyy-MM-dd HH:dd:ss" /></td>
										<td><a class="btn btn-primary btn-md sendbtn"
											id="${feedback.email}">发邮件</a></td>
									</tr>
								</c:forEach>
							</table>
						</div>


					</div>
				</div>
			</div>
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
	<!-- 回信模态窗口 -->
	<jsp:include page="module/sendEmailWindow.jsp"></jsp:include>

	<script src="<%=basePath%>js/jquery-1.10.1.js"></script>
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
	<script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
	<script
		src="http://apps.bdimg.com/libs/respond.js/1.4.2/respond.min.js"></script>

	<script src="<%=basePath%>js/bootstrapValidator.min.js"></script>
	<script src="http://static.geetest.com/static/tools/gt.js"></script>
	<script src="<%=basePath%>js/validator.js"></script>
	<script src="<%=basePath%>js/geetest.js"></script>
	<script src="http://cdn.bootcss.com/jqueryui/1.12.0/jquery-ui.js"></script>
	<script src="<%=basePath%>js/overhang.min.js"></script>
	<script type="text/javascript">
		$(function() {			

			$('.sendbtn').click(function() {
				$('#s_email').val($(this).attr('id'));
				$('#sendEmail').modal('show');
			});

			$('#sendEmailBtn').on(
					'click',
					function(e) {
						e.preventDefault();
						$.ajax({
							type : 'GET',
							url : "admin/sendEmailWindow",
							beforeSend : function() {
								$('#sendEmailBtn').addClass('disabled');
								$('#sendEmailBtn').text('发送中..');

							},
							success : function(info) {

								$('#s_content').popover({
									content : info.msg,
									placement : 'bottom'
								}).popover('show');
								setTimeout(function() {
									$('#s_content').popover('hide')
								}, 1000);

							},
							data : 'email=' + $('#s_email').val() + '&content='
									+ $('#s_content').val() + '',
							complete : function() {
								$('#sendEmailBtn').text('发送');
								$('#sendEmailBtn').removeClass('disabled');
							}
						});

					});

		})
	</script>
</body>
</html>