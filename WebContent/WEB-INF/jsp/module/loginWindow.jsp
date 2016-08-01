<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<form id="loginwindow" action="verifyLogin" method="POST">
	<div class="modal fade" id="login" tabindex="-1"
		style="width: 350px; margin: 40px auto;">
		<div class="modal-content modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
					<h2 style="text-align: center; font-family: '微软雅黑'"
						class="modal-title"><strong>登录</strong></h2>
				</div>

				<div class="modal-body">
					<div class="form-group">
						<div id="result" class="alert alert-danger hidden" role="alert">密码或用户名错误</div>
					</div>


					<div class="form-group">

						<input type="text" class="form-control" name="username"
							placeholder="帐号">
					</div>

					<div class="form-group">
						<input type="password" class="form-control" name="password"
							placeholder="密码">
					</div>

					<!-- <div style="text-align: left;" class="checkbox">
						<label> <input type="checkbox" name="remberme" value="true">记住我
						</label>
					</div> -->

					<div style="padding-top: 60px" class="form-group">
						<div id="embed-captcha-2"></div>
						<p id="wait2" style="text-align: center; padding-top: 10px;"
							style="text-align: center;" class="show">正在加载验证码......</p>
						<p id="notice2"
							style="text-align: center; padding-top: 10px; color: red;"
							class="hide">请先拖动验证码到相应位置</p>
					</div>

				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="submit" id="embed-login" class="btn btn-success">登录</button>
				</div>
			</div>
		</div>
	</div>

</form>