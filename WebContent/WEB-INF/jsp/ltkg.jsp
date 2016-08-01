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
<title>歪歪K歌_抽象TV</title>
</head>
<body style="background-color: #eee">

	<!-- 导航 -->
	<jsp:include page="module/nav.jsp"></jsp:include>

	<div id="shuju">
		<div class="container">
			<div class="row">
				<div id="left" style="overflow: auto;" class="col-md-3">

					<div class="list-group">
						<c:forEach items="${ltkg}" var="lk">
							<c:choose>
								<c:when test="${lk.id==video.id}">
									<a href="ltkg/detail?videoid=${lk.id}"
										class="list-group-item active">
										<span style="list-group-item-heading">
											<fmt:formatDate value="${lk.date}" type="date"
												dateStyle="long" />
										</span><br/>

										<span class="list-group-item-text">
											<strong>${lk.title}</strong>
										</span>

									</a>
								</c:when>
								<c:otherwise>
									<a href="ltkg/detail?videoid=${lk.id}" class="list-group-item ">
										<span class="list-group-item-heading">
											<fmt:formatDate value="${lk.date}" type="date"
												dateStyle="long" />
										</span><br/>
										<span style="color: #007AB2" class="list-group-item-text">${lk.title}</span>
									</a>
								</c:otherwise>
							</c:choose>


						</c:forEach>
						
						
					</div>
				</div>



				<div  id="video" class="col-md-9 " >${video.code}</div>


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
	<script src="<%=basePath%>js/bootstrapValidator.min.js"></script>
	<script src="http://static.geetest.com/static/tools/gt.js"></script>
	<script src="<%=basePath%>js/validator.js"></script>
	<script src="<%=basePath%>js/geetest.js"></script>
	<script type="text/javascript">
		$(function() {
			$("iframe").attr("width", "100%");
			$('#ltkg').addClass("active");
			$('#left').css("max-height", $(window).height());

		});
	</script>
</body>
</html>