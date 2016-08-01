<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<form id="editUser" action="admin/updateUser" method="POST"
	class="form-horizontal">
	<div class="modal" id="editUserWindow">
		<div class="modal-content modal-sm center-block" style="width: 40%;margin-top: 40px;">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #449D44;">
					<button class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
					<h2 class="modal-title"
						style="text-align: center; font-family: '微软雅黑'; color: #fff">修改用户</h2>
				</div>

				<div class="modal-body">
					<div class="form-group">
						<label for="id" class="col-sm-2 control-label">ID</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="id" id="id"
								readonly="readonly" required="required">
						</div>
					</div>

					<div class="form-group">
						<label for="registerTime" class="col-sm-2 control-label">注册时间</label>
						<div class="col-sm-10">
							<input type="datetime" class="form-control" name="registerTime"
								id="registerTime" readonly="readonly" required="required">
						</div>
					</div>

					<div class="form-group">
						<label for="username" class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-10">

							<input type="text" class="form-control" name="username"
								id="username" readonly="readonly" required="required">
						</div>
					</div>

					<div class="form-group">
						<label for="password" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" name="password"
								id="password" required="required">
						</div>
					</div>

					<div class="form-group">
						<label for="whosFans" class="col-sm-2 control-label">标签</label>
						<div class="col-sm-10">
							<select class="form-control" id="whosFans" name="whosFans">
								<option value="护猪宝">护猪宝</option>
								<option value="护疮宝">护疮宝</option>
								<option value="护改宝">护改宝</option>
								<option value="护鱼宝">护鱼宝</option>
								<option value="护苗宝">护苗宝</option>
								<option value="护毅宝">护毅宝</option>
							</select>
						</div>
					</div>


					<div class="form-group">
						<label for="userType" class="col-sm-2 control-label">用户类型</label>
						<div class="col-sm-10">
							<select class="form-control" id="userType" name="userType">
								<option value="普通用户">普通用户</option>
								<option value="管理员">管理员</option>
							</select>
						</div>
					</div>

				</div>

				<div class="modal-footer">
					<button type="button" id="cancel" class="btn btn-default"
						data-dismiss="modal">取消</button>
					<button type="submit" class="btn btn-success">确认修改</button>
				</div>
			</div>
		</div>
	</div>
</form>