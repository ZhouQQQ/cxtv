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
<title>弹幕自动档_抽象TV</title>
</head>
<body style="background-color: #eee">

	<!-- 导航 -->
	<jsp:include page="module/nav.jsp"></jsp:include>
	<div class="container" style="margin-top: 80px;">

		<div class="col-sm-5 ">
			<div class="well" style="line-height: 2">
				<blockquote>
					<h2 style="font-family: '微软雅黑'">使用方法</h2>
				</blockquote>
				<ol>
					<li>进入斗鱼直播房间并登录</li>
					<li>按F12或在浏览器设置中进入开发者工具</li>
					<li>Chrome、360、QQ浏览器等进入Console选项卡,IE浏览器进入控制台选项卡</li>
					<li>
						在输入框中插生成的代码,按Enter执行,IE按Ctrl+Enter或点击运行脚本，到达次数后或F5刷新即可取消（未登录会弹出斗鱼登录对话框）</li>

				</ol>
				<blockquote>
					<h2 style="font-family: '微软雅黑'">PS</h2>
				</blockquote>
				<ul>
					<li>末尾会加上 ‘-执行次数’</li>
					<li>双击弹幕输入框可以提前停车</li>
				</ul>

			</div>
		</div>

		<div class="col-sm-7">

			<form id="inputAttr">
				<div class="form-group">
					<label for="acontent" class="control-label">输入开车内容(斗鱼限制20个字符)</label>

					<input type="text" class="form-control" id="acontent"
						name="acontent" placeholder="内容" maxlength="20">

				</div>
				<div class="form-group">
					<label for="aintervalTime" class="control-label">发车间隔(单位：秒)</label>
					<input type="number" class="form-control" id="aintervalTime"
						placeholder="最快不超过房间设置的发言间隔" name="aintervalTime">



				</div>
				<div class="form-group">
					<label for="atimes" class="control-label">发车次数</label> <input
						type="number" class="form-control" id="atimes" placeholder="发车的次数"
						name="atimes">
				</div>

				<div class="form-group">

					<button type="button" id="gene"
						class="btn btn-success  form-control">生成脚本并复制到剪切板</button>


				</div>

				<textarea spellcheck="false" id="geneCode" class="form-control"
					rows="20"></textarea>
			</form>




		</div>



	</div>

	<div class="container"></div>

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

			$('#gene')
					.click(
							function() {

								$('#inputAttr').data('bootstrapValidator')
										.validate();
								if ($('#inputAttr').data('bootstrapValidator')
										.isValid()) {
									var content = $('#acontent').val();
									var intervalTimes = $('#aintervalTime')
											.val();
									var times = $('#atimes').val();

									var geneCode = "var setContent =\'"
											+ content
											+ "\'\;\nvar setIntervalTime ="
											+ intervalTimes
											+ "\;\nvar setTimes = "
											+ times
											+ ";\nvar realTime=1;\nvar realContent = setContent;\nvar realIntervalTime\nvar autoSendMsg;\nvar $sendButton = $('div[data-type=\"send\"],#sendmsg_but');\nsendMsg();\nfunction sendMsg(){\nif(!checkCanSend()){return;}\nrealContent=setContent+'-'+realTime++;\n $('textarea').val(realContent);\n$sendButton.click();\nvar roomMsgCd = getRoomMsgCd();\nif(roomMsgCd>setIntervalTime){\nrealIntervalTime=roomMsgCd;\n}else{\n realIntervalTime=setIntervalTime;\n}\nautoSendMsg = setTimeout(\"sendMsg()\",realIntervalTime*1000+300);\nrealContent=setContent;\nif(realTime>setTimes){\nclearTimeout(autoSendMsg);\n}\n}\nfunction getRoomMsgCd(){\nif(!isNaN(Number($sendButton.text()))){\nreturn Number($sendButton.text());\n}else{\ngetRoomMsgCd();\n}\n}\nfunction checkCanSend(){\nif($('div[data-type=\"send\"]').hasClass(\"b-btn-gray\")){\n$('a[data-type=\"login\"]\').click();\nreturn false;\n}else{\nreturn true;\n}\n}\n$('textarea').dblclick(function(){\nclearTimeout(autoSendMsg);\n});\n"

									$('#geneCode').html(geneCode);
									$('textarea').select();
									document.execCommand('copy');
									$('textarea').popover({
										content : '复制成功',
										placement : 'right'
									}).popover('show');
									setTimeout(function() {
										$('textarea').popover('hide');
									}, 2000)
								} else {
									$('#geneCode').html("");
								}

							});
			//验证输入框内容
			$('#inputAttr').bootstrapValidator({
				feedbackIcons : {/* 输入框不同状态，显示图片的样式 */
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},

				fields : {
					acontent : {
						trigger : 'blur',
						validators : {
							notEmpty : {
								message : '不能为空',
							},

						}
					},
					aintervalTime : {
						trigger : 'blur',
						validators : {
							notEmpty : {
								message : '不能为空',
							},
							numeric : {
								message : '只能是数字',
							},

						}
					},
					atimes : {
						trigger : 'blur',
						validators : {
							notEmpty : {
								message : '不能为空',
							},
							numeric : {
								message : '只能是数字',
							},

						}
					},

				}
			});

			function ToggleDialog() {
				$("tip").slideToggle("fast");
			}

		})
	</script>
</body>
</html>