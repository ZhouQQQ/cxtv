<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<div id="footer">
	<footer class="footer">
		<div class="container">
			<div class="btn-group" role="group">
				<button type="button" class="btn btn-default" data-toggle="modal"
					data-target="#lxzz">联系站长</button>
				<button type="button" class="btn btn-default" data-toggle="modal"
					data-target="#thds">支持作者</button>
				<button type="button" class="btn btn-default" data-toggle="modal"
					data-target="#bqts">反馈建议</button>
			</div>
			<p>抽象TV&nbsp;        ©2016  -  抽象倒闭</p>
		</div>
	</footer>
</div>