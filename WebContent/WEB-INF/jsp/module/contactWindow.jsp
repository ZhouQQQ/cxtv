<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<div class="modal fade" id="lxzz" tabindex="-1"
	style="width: 300px; margin: 50px auto">
	<div class="modal-content modal-sm ">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
				<h4 class="modal-title">联系站长</h4>
			</div>

			<div class="modal-body">
				<p>
					<a href="mailto:327595396@qq.com">327595396@qq.com</a>

				</p>
				<p>百度ID:动态力场</p>
				<p>斗鱼ID:节操算什么</p>
			</div>
		</div>
	</div>
</div>