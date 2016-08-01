<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<form id="sendEmailWindow" method="POST" >
<div class="modal fade" id="sendEmail" tabindex="-1"
	style="width: 300px; margin: 50px auto">
	<div class="modal-content modal-sm ">
		<div class="modal-content">
			<div class="modal-header bg-primary" >
				<button class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
				<h2 style="font-family: '黑体';text-align: center;" class="modal-title"><span class="glyphicon glyphicon-envelope"></span>   回信</h2>
			</div>

			<div class="modal-body">
					<input type="hidden" name="redirect_url" value="<%=request.getRequestURI()%>>">
					<div class="form-group">
						<input type="email" class="form-control" name="s_email" id="s_email"
							 required="required" readonly="readonly">
					</div>
					<div class="form-group">
						<textarea rows="5" id="s_content" class="form-control" required="required" draggable="false" name="s_content" placeholder="回信内容"></textarea>
					</div>
					
					
			</div>
			
			<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="submit" id="sendEmailBtn" class="btn btn-success">发送</button>
				</div>
		</div>
	</div>
</div>
</form>
