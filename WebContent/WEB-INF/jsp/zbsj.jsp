<%@ page language="java" contentType="text/html;charset=UTF-8"
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
<meta http-equiv="keywords" content="抽象TV,抽象官网，抽象tv官网,抽象工作室">
<meta http-equiv="description" content="抽象工作室直播数据">
<link rel="icon" href="<%=basePath%>img/cxtv_logo.jpg">
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
<link href="<%=basePath%>css/style.css" rel="stylesheet">
<script src="<%=basePath%>js/echarts.common.min.js"></script>
<title>直播数据_抽象TV</title>
</head>
<body>

	<!-- 导航 -->
	<jsp:include page="module/nav.jsp"></jsp:include>


	<div id="shuju">
		<div class="container">
			<div class="row">
				<div class="col-md-2">
					<div class="list-group">
						<a href="zbsj/lwjl?page=1" class="list-group-item"><span
							class="glyphicon glyphicon-gift"></span> 礼物记录</a> <a href="zbsj/fjjl"
							class="list-group-item"><span
							class="glyphicon glyphicon-ban-circle"></span> 封禁记录</a>
					</div>
				</div>

				<div class="col-md-10">

					<h2 class="tj">最近七天内鱼翅礼物统计</h2>
					<div style="padding-bottom: 50px" id="charts2" class="col-md-6"></div>
					<h2 class="tj">最近七天内鱼丸礼物统计</h2>
					<div style="padding-bottom: 50px" id="charts1" class="col-md-6"></div>



					<script type="text/javascript">
						// 基于准备好的dom，初始化echarts实例
						var myChart2 = echarts.init(document
								.getElementById('charts2'));

						// 指定图表的配置项和数据
						option = {
							tooltip : {
								trigger : 'axis',
								axisPointer : { // 坐标轴指示器，坐标轴触发有效
									type : 'shadow' // 默认为直线，可选为：'line' | 'shadow'
								}
							},
							legend : {
								data : [ '赞', '弱鸡', '神探赣', '飞机', '火箭' ]
							},
							grid : {
								left : '3%',
								right : '4%',
								bottom : '3%',
								containLabel : true
							},
							xAxis : [ {
								type : 'category',
								data : []
							} ],
							yAxis : [ {
								type : 'value',
								name : '单位:元',
							} ],
							series : [
									{
										name : '赞',
										type : 'bar',
										stack : '总量',
										data : [ "${dayAgo6Z}", "${dayAgo5Z}",
												"${dayAgo4Z}", "${dayAgo3Z}",
												"${dayAgo2Z}", "${dayAgo1Z}",
												"${dayAgo0Z}" ]
									},
									{
										name : '弱鸡',
										type : 'bar',
										stack : '总量',
										data : [ "${dayAgo6Rj}",
												"${dayAgo5Rj}", "${dayAgo4Rj}",
												"${dayAgo3Rj}", "${dayAgo2Rj}",
												"${dayAgo1Rj}", "${dayAgo0Rj}" ]
									},
									{
										name : '神探赣',
										type : 'bar',
										stack : '总量',
										data : [ "${dayAgo6Stg}",
												"${dayAgo5Stg}",
												"${dayAgo4Stg}",
												"${dayAgo3Stg}",
												"${dayAgo2Stg}",
												"${dayAgo1Stg}",
												"${dayAgo0Stg}" ]
									},
									{
										name : '飞机',
										type : 'bar',
										stack : '总量',
										data : [ "${dayAgo6Fj}",
												"${dayAgo5Fj}", "${dayAgo4Fj}",
												"${dayAgo3Fj}", "${dayAgo2Fj}",
												"${dayAgo1Fj}", "${dayAgo0Fj}" ]
									},
									{
										name : '火箭',
										type : 'bar',
										stack : '总量',
										data : [ "${dayAgo6Hj}",
												"${dayAgo5Hj}", "${dayAgo4Hj}",
												"${dayAgo3Hj}", "${dayAgo2Hj}",
												"${dayAgo1Hj}", "${dayAgo0Hj}" ],
									},

							]
						};

						for (var i = 0; i <= 6; i++) {
							var date = new Date();
							date.setDate(date.getDate() - i);
							option.xAxis[0].data[6 - i] = date
									.toLocaleDateString();

						}
						option.xAxis[0].data[6] = option.xAxis[0].data[6] += "(今天)";
						// 使用刚指定的配置项和数据显示图表。
						myChart2.setOption(option);
					</script>


					<script type="text/javascript">
						// 基于准备好的dom，初始化echarts实例
						var myChart1 = echarts.init(document
								.getElementById('charts1'));

						// 指定图表的配置项和数据
						option2 = {

							tooltip : {
								trigger : 'axis',
								axisPointer : { // 坐标轴指示器，坐标轴触发有效
									type : 'shadow' // 默认为直线，可选为：'line' | 'shadow'
								}
							},
							legend : {
								data : [ '鱼丸' ]
							},
							grid : {
								left : '3%',
								right : '4%',
								bottom : '3%',
								containLabel : true
							},
							xAxis : [ {
								type : 'category',
								data : []
							} ],
							yAxis : [ {
								type : 'value'
							} ],
							series : [ {
								name : '鱼丸',
								type : 'bar',
								data : [ "${dayAgo6Yw}", "${dayAgo5Yw}",
										"${dayAgo4Yw}", "${dayAgo3Yw}",
										"${dayAgo2Yw}", "${dayAgo1Yw}",
										"${dayAgo0Yw}" ]
							} ]
						};
						for (var i = 0; i <= 6; i++) {
							var date = new Date();
							date.setDate(date.getDate() - i);
							option2.xAxis[0].data[6 - i] = date
									.toLocaleDateString();

						}
						option2.xAxis[0].data[6] = option2.xAxis[0].data[6] += "(今天)";

						// 使用刚指定的配置项和数据显示图表。
						myChart1.setOption(option2);
					</script>
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