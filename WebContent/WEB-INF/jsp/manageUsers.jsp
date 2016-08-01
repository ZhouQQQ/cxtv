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
<title>管理_抽象TV</title>
</head>
<body style="background-color: #CCCCCC">

	<!-- 导航 -->
	<jsp:include page="module/nav.jsp"></jsp:include>

	<div style="margin: 100px auto" class="container-fluid">
		<div class="row">
			<div class="col-md-2">
				<div class="list-group">
					<a href="admin/ltkg" class="list-group-item"><span
						class="glyphicon glyphicon-headphones"></span> 管理K歌<span
						class="badge">${countLtkg}</span></a> <a href="admin/cxrj"
						class="list-group-item"><span class="glyphicon glyphicon-book"></span>
						管理日记<span class="badge">${countCxrj}</span></a>
				</div>

				<div class="list-group">
					<a href="admin/users" class="list-group-item  active"><span
						class="glyphicon glyphicon-user"></span> 管理用户</a>

				</div>
			</div>

			<div class="col-md-10">

				<div
					style="background-color: #fff; padding: 10px 10px; box-shadow: 5px 5px 10px #333">





					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-hover">
								<tr>
									<th>id</th>
									<th>用户名</th>
									<th>密码</th>
									<th>谁的粉丝</th>
									<th>注册时间</th>
									<th>用户类型</th>
									<th>编辑</th>
									<th>删除</th>
								</tr>
								<c:forEach items="${users}" var="user">
									<tr>
										<td>${user.id}</td>
										<td>${user.username }</td>
										<td>${user.password }</td>
										<td>${user.whosFans}</td>
										<td><fmt:formatDate value="${user.registerTime}"
												pattern="yyyy-MM-dd HH:mm:ss" /></td>
										<td>${user.userType }</td>
										<td><a href="" class="edit"><span id="${user.id}"
												class="glyphicon glyphicon-edit"></span></a></td>
										<td><a href="admin/deleteUserById/${user.id}"
											class="delete"><span class="glyphicon glyphicon-remove"></span></a></td>
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

	<!-- 编辑用户模态窗 -->

	<jsp:include page="module/editUserWindow.jsp"></jsp:include>s

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

	<script src="<%=basePath%>js/bootstrapValidator.min.js"></script>
	<script src="http://static.geetest.com/static/tools/gt.js"></script>
	<script src="<%=basePath%>js/validator.js"></script>
	<script src="<%=basePath%>js/geetest.js"></script>
	<script src="<%=basePath%>js/formateTransfer.js"></script>
	<script type="text/javascript">
		$(function() {
			/*点击编辑按钮 发送ajax请求 获取json数据  */
			$('.edit').click(
					function(e) {
						e.preventDefault()
						$.ajax({
							type : "get",
							url : "admin/getUserInfo",
							dataType : "json",
							data : "id=" + e.target.id,
							success : function(msg) {

								$('#id').val(msg.id);
								$('#registerTime').val(
										number2Date(msg.registerTime).Format(
												"yyyy-MM-dd hh:mm:ss"));
								$('#username').val(msg.username);
								$('#password').val(msg.password);
								$('#whosFans').val(msg.whosFans);
								$('#userType').val(msg.userType);
								$('#editUserWindow').modal('show');
							}
						});
					});

			$('.delete').click(function() {
				if (confirm('确定删除本条记录吗')) {
					return true;
				} else {
					return false;
				}
			});

		});
	</script>
</body>
</html>