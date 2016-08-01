<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<form id="addFeedback" method="POST" action="addFeedback">
<div class="modal fade" id="bqts" tabindex="-1"
	style="width: 300px; margin: 50px auto">
	<div class="modal-content modal-sm ">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
				<h2 class="modal-title">反馈建议</h2>
			</div>

			<div class="modal-body">
					<input type="hidden" name="redirect_url" value="<%=request.getRequestURI()%>>">
					<div class="form-group">
						<input type="email" class="form-control" name="email"
							placeholder="输入邮箱以便联系" required="required">
					</div>
					<div class="form-group">
						<textarea rows="5" class="form-control" required="required" draggable="false" name="content" placeholder="输入一些什么..."></textarea>
					</div>
					
					
			</div>
			
			<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="submit" id="addFeedbackBtn" class="btn btn-success">提交</button>
				</div>
		</div>
	</div>
</div>
</form>
