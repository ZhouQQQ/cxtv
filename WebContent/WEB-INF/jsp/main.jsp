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
<meta http-equiv="description" content="抽象工作室">
<link rel="icon" href="<%=basePath%>img/cxtv_logo.jpg">
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
<link href="<%=basePath%>css/style.css" rel="stylesheet">
<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet">
<title>抽象TV</title>
</head>
<body style="background-color: #eee">

	<!-- 导航 -->
	<jsp:include page="module/nav.jsp"></jsp:include>

	<div id="jumu">
		<div class="jumbotron">
			<div class="container">
				<div class="row">
					<div class="col-md-5 col-sm-4">
						<c:if test="${room.data.roomStatus==1}">
							<h1 id="biaoti">${room.data.roomName}</h1>
							<p>
								<i class="fa fa-clock-o" aria-hidden="true"></i> 开播时间：<span
									class="label label-info">${room.data.startTime}</span>
							</p>
							<p>
								<i class="fa fa-users" aria-hidden="true"></i> 在线人数：<span
									class="label label-success">${room.data.online}</span>
							</p>
							<p>

								<a class="btn btn-lg btn-primary"
									href="http://www.douyu.com/6324" role="button" target="_blank">去开车
								</a> <a href="<%=basePath%>autoSendMsg" target="_blank">弹幕自动档？</a>
							</p>
						</c:if>

						<c:if test="${room.data.roomStatus==2}">
							<h1 class="text-muted" id="biaoti">嗨屏中...</h1>
							<br><br><br>
							<p>
								<i class="fa fa-clock-o" aria-hidden="true"></i> 上次开播时间：<span
									class="label label-info">${room.data.startTime}</span>
							</p>
							
							<p>
								<a class="btn btn-lg btn-primary"
									href="http://www.douyu.com/6324" role="button" target="_blank">去开车
								</a> <a href="<%=basePath%>autoSendMsg" target="_blank">弹幕自动档？</a>
							</p>
						</c:if>


					</div>

					<c:if test="${room.data.roomStatus==1}">
						<div class="col-md-7 col-sm-5  hidden-xs">
							<embed width="640" height="360" allownetworking="all" wmode="Opaque"
								allowscriptaccess="always"
								src="https://staticlive.douyucdn.cn/common/share/play.swf?room_id=6324"
								quality="high" bgcolor="#000" wmode="window"
								allowfullscreen="true" allowFullScreenInteractive="true"
								type="application/x-shockwave-flash">
						</div>
					</c:if>
					<c:if test="${room.data.roomStatus==2}">
						<div class="col-md-7 col-sm-5  hidden-xs">
							<a href="http://www.douyu.com/6324" target="_blank"><img
								id="jianying" width="640" height="360" src=""></a>
						</div>
					</c:if>
				</div>

			</div>
		</div>
	</div>


	<div id="todaygift">
		<div class="container">
			<h2 style="padding: 30px;">
				<span class="glyphicon glyphicon-gift"></span> 今天收到的礼物
			</h2>
			<div class="row lw">
				<div class="col-md-6 col-xs-12 pt">
					<div class="row">
						<div class="col-md-6 col-xs-6 item ">
							<div>
								<img class="lwtp " alt="鱼丸" src="<%=basePath%>img/yw.png"><span
									class="x">&nbsp;x</span><span class="num">&nbsp;<c:out
										value="${todayYw}"></c:out></span>
							</div>

						</div>
						<div class="col-md-6 col-xs-6 item ">

							<img class="lwtp " alt="赞" src="<%=basePath%>img/z.gif"><span
								class="x">&nbsp;x</span><span class="num">&nbsp;${todayZ}</span>


						</div>
					</div>

					<div class="row">
						<div class="col-md-6 col-xs-6  item">

							<img class="lwtp  " alt="弱鸡" src="<%=basePath%>img/rj.gif"><span
								class="x">&nbsp;x</span><span class="num">&nbsp;${todayRj}</span>


						</div>
						<div class="col-md-6  col-xs-6 item">
							<img class="lwtp " alt="神探赣" src="<%=basePath%>img/stg.gif"><span
								class="x">&nbsp;x</span><span class="num">&nbsp;${todayStg}</span>
						</div>
					</div>
				</div>

				<div class="col-md-3 col-xs-6 ">
					<div class="item">
						<div class="row">
							<div class="">
								<img class="col-md-6 " id="feiji" alt="飞机"
									src="<%=basePath%>img/fj.gif">
							</div>
							<div class="col-md-6">
								<span class="bnum">${todayFj}</span>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-3 col-xs-6 ">
					<div class="item">
						<div class="row">
							<div class="">
								<img class="col-md-6 " id="huojian" alt="火箭"
									src="<%=basePath%>img/hj.gif">
							</div>
							<div class="col-md-6 ">
								<span class="bnum">${todayHj}</span>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container" style="margin-top: 8 0px;">
		<div class="row" style="text-align: center;">
			<div class="col-md-4 zby">
				<img class="img-circle" src="<%=basePath%>img/portrait/lg.jpg"
					width="140" height="140">
				<h2 class="zbyname">李赣</h2>
				<p class="text-muted">“抽象工作室董事长,电竞李伯清”</p>
				<p>
					<strong>ID:</strong>六三二四李老八
				</p>
				<p>
					<i class="fa fa-weibo" aria-hidden="true"></i> <a
						href="http://weibo.com/u/2150835921" target="_blank">@咸鱼我干</a>
				</p>


			</div>
			<div class="col-md-4 zby">
				<img class="img-circle" src="<%=basePath%>img/portrait/sxc.png"
					width="140" height="140">
				<h2 class="zbyname">孙笑川</h2>
				<p class="text-muted">“嘴臭心机直播员,等一个登基”</p>
				<p>
					<strong>ID:</strong>上坟鸭王丶mata川
				</p>
				<p>
					<i class="fa fa-weibo" aria-hidden="true"></i> <a
						href="http://weibo.com/u/3176010690" target="_blank">@带带大师兄</a>
				</p>

			</div>
			<div class="col-md-4 zby">
				<img class="img-circle" src="<%=basePath%>img/portrait/zsf.png"
					width="140" height="140">
				<h2 class="zbyname">张顺飞</h2>
				<p class="text-muted">“吃最冷的饭,守最冷的夜 ——雪诺·劳根”</p>
				<p>
					<strong>ID:</strong>灵魂歌手丶嗨奴改
				</p>
				<p>
					<i class="fa fa-weibo" aria-hidden="true"></i> <a
						href="http://weibo.com/u/5819537769" target="_blank">@wuligaigai</a>
				</p>

			</div>
			<div class="col-md-4 zby">
				<img class="img-circle" src="<%=basePath%>img/portrait/hst.png"
					width="140" height="140">
				<h2 class="zbyname">韩世天</h2>
				<p class="text-muted">“斗鱼第一大莱莱”</p>
				<p>
					<strong>ID:</strong>我是冠军丶UZ鱼
				</p>
				<p>
					<i class="fa fa-weibo" aria-hidden="true"></i> <a
						href="http://weibo.com/u/5494336046" target="_blank">@PIJDE丶</a>
				</p>

			</div>
			<div class="col-md-4 zby">
				<img class="img-circle" src="<%=basePath%>img/portrait/zm.png"
					width="140" height="140">
				<h2 class="zbyname">郑苗</h2>
				<p class="text-muted">“午夜神偷小矮人”</p>
				<p>
					<strong>ID:</strong>不偷不香丶苗人凤
				</p>

			</div>
			<div class="col-md-4 zby">
				<img class="img-circle" src="<%=basePath%>img/portrait/cy.png"
					width="140" height="140">
				<h2 class="zbyname">陈毅</h2>
				<p class="text-muted">“他依然向往华尔街的雪,想念阿坝州的风吟鸟唱,多年以后才发现,华尔街没有雪,冷的是人心”</p>


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
			$('#main').addClass("active");
			$('#jianying').attr("src", '${room.data.roomThumb}');
		});
	</script>

</body>
</html>