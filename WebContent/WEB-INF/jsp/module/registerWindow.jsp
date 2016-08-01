<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<form id="registerwindow" action="verifyRegister" method="POST">
	<div class="modal fade" id="register"
		style="width: 350px; margin: 40px auto;">
		<div class="modal-content modal-md">
			<div class="modal-content">
				<div class="modal-header" >
					<button class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
					<h2 style="text-align: center; font-family: '微软雅黑'"
						class="modal-title"><strong>注册帐号</strong></h2>
				</div>

				<div class="modal-body">

					<div class="form-group">

						<input type="text" class="form-control" name="username"
							placeholder="帐号">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" name="password"
							placeholder="密码">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" name="confirmpassword"
							placeholder="再次输入密码">
					</div>
					<div class="form-group">
						<label class="radio-inline"> <input type="radio"
							name="inlineRadioOptions" id="inlineRadio1" value="护猪宝">
							<span class="label label-info">护猪宝</span>
						</label> <label class="radio-inline"> <input type="radio"
							name="inlineRadioOptions" id="inlineRadio2" value="护疮宝">
							<span class="label label-info">护疮宝</span>
						</label> <label class="radio-inline"> <input type="radio"
							name="inlineRadioOptions" id="inlineRadio3" value="护改宝">
							<span class="label label-info">护改宝</span></label>
					</div>
					<div class="form-group">
						<label class="radio-inline"> <input type="radio"
							name="inlineRadioOptions" id="inlineRadio1" value="护鱼宝">
							<span class="label label-info">护鱼宝</span>
						</label> <label class="radio-inline"> <input type="radio"
							name="inlineRadioOptions" id="inlineRadio2" value="护苗宝">
							<span class="label label-info">护苗宝</span>
						</label> <label class="radio-inline"> <input type="radio"
							name="inlineRadioOptions" id="inlineRadio3" value="护毅宝">
							<span class="label label-default">护毅宝</span>
						</label>

					</div>
					<div class="form-group">
						<div style="padding-top: 20px" id="embed-captcha"></div>
						<p id="wait1" style="text-align: center; padding-top: 10px;"
							style="text-align: center;" class="show">正在加载验证码......</p>
						<p id="notice1"
							style="text-align: center; padding-top: 10px; color: red;"
							class="hide">请先拖动验证码到相应位置</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="submit" id="embed-register" class="btn btn-success">注册</button>
					</div>


				</div>
			</div>
		</div>
	</div>
</form>