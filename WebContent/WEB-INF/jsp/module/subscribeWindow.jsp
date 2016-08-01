<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<div class="modal fade" id="thds" tabindex="-1"
	style="width: 300px; margin: 50px auto">
	<div class="modal-content modal-sm ">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
				<h4 class="modal-title">支持作者</h4>
			</div>

			<div class="modal-body">
				<img class="img-responsive" alt="二维码"
					src="<%=basePath%>img/alipay.jpg">
			</div>
		</div>
	</div>
</div>
