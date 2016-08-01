<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="lastPage" value="${pageContext.request.contextPath}" />

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
<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet">
<title>礼物记录_抽象TV</title>
</head>
<body>

	<!-- 导航 -->
	<jsp:include page="module/nav.jsp"></jsp:include>



	<div id="shuju">
		<div class="container">
			<div class="row">
				<div class="col-md-2">
					<div class="list-group">
						<a href="zbsj/lwjl?page=1" class="list-group-item active"><span
							class="
glyphicon glyphicon-gift"></span> 礼物记录</a> <a
							href="zbsj/fjjl" class="list-group-item"><span
							class="glyphicon glyphicon-ban-circle"></span> 封禁记录</a>
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

					<form id="form1" action="zbsj/lwjl" method="POST">
						<div class="input-group ">
							<input type="text" class="form-control" placeholder="输入ID查找记录"
								name="inputname"> <span class="input-group-btn">
								<button id="search" class="btn btn-primary" type="button"><i class="fa fa-search" aria-hidden="true"></i> 搜索</button>
							</span>
						</div>
					</form>


					<ul style="margin-top: 10px;" class="nav nav-pills nav-justified" role="tablist">
						<li role="presentation" class="active"><a href="#detail"
							aria-controls="detail" role="tab" data-toggle="tab"><i class="fa fa-list" aria-hidden="true"></i> 详细列表</a></li>
						<li role="presentation"><a href="#count"
							aria-controls="count" role="tab" data-toggle="tab"><i class="fa fa-list-alt" aria-hidden="true"></i> 总量</a></li>

					</ul>

					<div class="tab-content">
						<div role="tabpanel" class="tab-pane active " id="detail">
							<table class="table table-bordered">
								<thead class="thead">
									<tr>
										
										<th>ID</th>
										<th>礼物类型</th>
										<th>送礼时间</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${giftRecord}" var="gift">
										<tr>
											
											<td>${gift.name}</td>
											<td>${gift.type}</td>
											<td><fmt:formatDate value="${gift.time}" type="both" /></td>
										</tr>
									</c:forEach>

								</tbody>
							</table>



							<c:if test="${isShowFenYe==true}">
								<div id="fenye" class="text-center">
									<nav>
										<ul class="pager">
											<li id="last"><a href="zbsj/lwjl?page=${pageNow-1}">上一页</a></li>
											<li id="next"><a href="zbsj/lwjl?page=${pageNow+1}">下一页</a></li>
										</ul>
									</nav>
								</div>
							</c:if>
						</div>
						<div role="tabpanel" class="tab-pane " id="count">
							<table class="table table-bordered ">
								<thead class="thead">
									<tr>
										
										<th>ID</th>
										<th>礼物类型 </th>
										<th>数量</th>
										
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${giftRecordCount}" var="gift">
										<tr>											
											<td>${gift.name}</td>
											<td>${gift.type} </td>
											<td>${gift.count}</td>
											
										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>

					</div>


				</div>
			</div>
		</div>
	</div>

	<div>

		<!-- Nav tabs -->


		<!-- Tab panes -->


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
		$(function() {
			var pageNow = "${pageNow}";
			if (pageNow == 1) {
				$('#last').addClass("disabled");
				$('#last').click(function(event) {
					event.preventDefault();
				});
			}

			$('#search').click(function() {
				$('#form1').submit();
			});

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