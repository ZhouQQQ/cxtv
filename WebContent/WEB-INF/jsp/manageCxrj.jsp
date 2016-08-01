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
<!-- Include Editor style. -->
<link rel="stylesheet" href="<%=basePath%>css/font-awesome.min.css">
<link rel="stylesheet" href="<%=basePath%>css/froala_editor.css">
<link rel="stylesheet" href="<%=basePath%>css/froala_style.css">
<link rel="stylesheet" href="<%=basePath%>css/plugins/code_view.css">
<link rel="stylesheet" href="<%=basePath%>css/plugins/colors.css">
<link rel="stylesheet" href="<%=basePath%>css/plugins/emoticons.css">
<link rel="stylesheet" href="<%=basePath%>css/plugins/image_manager.css">
<link rel="stylesheet" href="<%=basePath%>css/plugins/image.css">
<link rel="stylesheet" href="<%=basePath%>css/plugins/line_breaker.css">
<link rel="stylesheet" href="<%=basePath%>css/plugins/table.css">
<link rel="stylesheet" href="<%=basePath%>css/plugins/char_counter.css">
<link rel="stylesheet" href="<%=basePath%>css/plugins/video.css">
<link rel="stylesheet" href="<%=basePath%>css/plugins/fullscreen.css">
<link rel="stylesheet" href="<%=basePath%>css/plugins/file.css">
<link rel="stylesheet" href="<%=basePath%>css/plugins/quick_insert.css">
<link rel="stylesheet" href="<%=basePath%>css/codemirror.min.css">
<!-- fileinput css -->
<link rel="stylesheet" href="<%=basePath%>css/fileinput.min.css">





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
						class="list-group-item active"><span
						class="glyphicon glyphicon-book "></span> 管理日记<span class="badge">${countCxrj}</span></a>
				</div>

				<div class="list-group">
					<a href="admin/users" class="list-group-item"><span
						class="glyphicon glyphicon-user"></span> 管理用户</a>

				</div>

			</div>

			<div class="col-md-10">
				<div
					style="background-color: #fff; padding: 10px 10px; box-shadow: 5px 5px 10px #333">


					<div class="row">

						<div class="col-md-1" style="margin-left: 15px">
							<a data-toggle="modal" data-target="#cxrjWindow"><button
									class="btn btn-success" type="button">
									<span class="glyphicon glyphicon-plus"></span> 增加
								</button></a>
						</div>

					</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-hover">
								<tr>
									<th>时间</th>
									<th>封面</th>
									<th>标题</th>
									<th>正文</th>
									<th>编辑</th>
									<th>删除</th>
								</tr>
								<c:forEach items="${cxrj}" var="note">
									<tr>
										<td style="width: 10%"><fmt:formatDate value="${note.date}"
												pattern="yyyy-MM-dd" /></td>
										<td style="width: 10%"><img class="img-responsive" alt=""
											src="${note.cover}"></td>
										<td style="width: 10%">${note.title}</td>

										<td style="width: 60%">${note.content}</td>
										<td style="width: 5%"><a href="" class="edit"><span id="${note.id}"
												class="glyphicon glyphicon-edit"></span></a></td>
										<td style="width: 5%"><a href="admin/deleteCxrjById/${note.id}"
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

	<!-- 增加抽象日记模态窗 -->
	<jsp:include page="module/addCxrjWindow.jsp"></jsp:include>
	<!-- 编辑抽象日记模态窗 -->
	<jsp:include page="module/editCxrjWindow.jsp"></jsp:include>
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

	<script src="<%=basePath%>js/jquery-1.11.1.min.js"></script>
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
	<script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
	<script
		src="http://apps.bdimg.com/libs/respond.js/1.4.2/respond.min.js"></script>

	<script src="<%=basePath%>js/bootstrapValidator.min.js"></script>
	<script src="http://static.geetest.com/static/tools/gt.js"></script>
	<script src="<%=basePath%>js/validator.js"></script>
	<script src="<%=basePath%>js/geetest.js"></script>
	<script src="<%=basePath%>js/formateTransfer.js"></script>

	<script type="text/javascript"
		src="<%=basePath%>js/froala_editor.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>js/plugins/align.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>js/plugins/char_counter.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>js/plugins/code_beautifier.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>js/plugins/code_view.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>js/plugins/colors.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>js/plugins/draggable.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>js/plugins/emoticons.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>js/plugins/entities.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>js/plugins/file.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>js/plugins/font_size.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>js/plugins/font_family.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>js/plugins/fullscreen.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>js/plugins/image.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>js/plugins/image_manager.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>js/plugins/line_breaker.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>js/plugins/inline_style.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>js/plugins/link.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>js/plugins/lists.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>js/plugins/paragraph_format.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>js/plugins/paragraph_style.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>js/plugins/quick_insert.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>js/plugins/quote.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>js/plugins/table.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>js/plugins/save.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/plugins/url.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>js/plugins/video.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/fileinput.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>js/fileinput_locale_zh.js"></script>

	<script type="text/javascript"
		src="<%=basePath%>js/plugins/codemirror.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/plugins/xml.min.js"></script>



	<!-- Include Language file if we want to use it. -->
	<script type="text/javascript" src="<%=basePath%>js/languages/zh_cn.js"></script>


	<!-- Initialize the editor. -->
	<script>
		$(function() {
			//初始化文本编辑器
			$('#edit,#editContent').froalaEditor(
					{
						language : 'zh_cn',
						toolbarButtons : [ 'fullscreen', 'bold', 'italic',
								'fontFamily', 'fontSize', '|', 'color', '|',
								'align', 'formatOL', 'formatUL', 'outdent',
								'indent', 'insertHR', 'paragraphFormat', '|',
								'insertLink', 'insertImage', 'insertTable',
								'undo', 'redo', 'clearFormatting', 'html' ],
						heightMax : 600,
						heightMin : 250,

						fontFamily : {
							"微软雅黑" : '微软雅黑',
							"宋体" : '宋体',
							"楷体" : '楷体',
						},
						imageInsertButtons : [ 'imageBack', 'imageUpload',
								'imageByURL' ],
						linkInsertButtons : [ 'linkBack' ],
						imageMaxSize : 1024 * 1024 * 3, //3MB
						imageUploadURL : 'admin/cxrj/uploadimage',
						allowedImageTypes : [ "jpeg", "jpg", "png", "gif" ],

					})
		});
	</script>

	<script type="text/javascript">
		$(function() {

			$('#cover')
					.fileinput(
							{
								language : 'zh',
								showUpload : false,
								showCaption : true,
								browseClass : "btn btn-primary btn-md",
								allowedFileExtensions : [ 'jpg', 'jpeg', 'png',
										'gif' ],
								previewFileIcon : "<i class='glyphicon glyphicon-king'></i>",
								maxFileSize : 2048,
								msgSizeTooLarge : '文件 "{name}" (<b>{size} KB</b>) 超过了最大允许大小<b>{maxSize} KB</b>. 请重新选择!',
							});

			$('.delete').click(function() {
				if (confirm('确定删除本条记录吗')) {
					return true;
				} else {
					return false;
				}
			});

			$('.edit')
					.click(
							function(e) {
								e.preventDefault();
								$
										.ajax({
											type : "get",
											url : "admin/getCxrjById",
											dataType : "json",
											data : "id=" + e.target.id,
											success : function(msg) {

												$('#editTitle').val(msg.title);
												$('#editDate')
														.val(
																number2Date(
																		msg.date)
																		.Format(
																				"yyyy-MM-dd"));
												$('#editContent')
														.froalaEditor(
																'html.set',
																msg.content);
												$("#editCover")
														.fileinput(
																{
																	language : 'zh',
																	showUpload : false,
																	showCaption : true,
																	browseClass : "btn btn-primary btn-md",
																	allowedFileExtensions : [
																			'jpg',
																			'jpeg',
																			'png',
																			'gif' ],
																	previewFileIcon : "<i class='glyphicon glyphicon-king'></i>",
																	maxFileSize : 2048,
																	msgSizeTooLarge : '文件 "{name}" (<b>{size} KB</b>) 超过了最大允许大小<b>{maxSize} KB</b>. 请重新选择!',
																	initialPreview : '<img src='+msg.cover+' class="file-preview-image"  >',
																});
												$('#hiddenid').val(msg.id);
												$('#editCxrjWindow').modal(
														'show');
												$('#cancel,.close').click(
														function() {
															window.location
																	.reload();
														});
											}

										});

							});

		});
	</script>

</body>
</html>