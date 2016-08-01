<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<form id="addCxrjWindow" action="admin/addCxrj" method="POST" enctype="multipart/form-data">
	<div class="modal fade " id="cxrjWindow" tabindex="-1"
		style="width: 100%;margin-top: 50px;">
		<div class="modal-content modal-lg center-block">
			<div class="modal-content">
				<div style="background-color:#449D44;" class="modal-header">
					<button class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
					<h2  style="text-align: center; font-family: '微软雅黑';color: #fff"
						class="modal-title">增加日记</h2>
				</div>

				<div class="modal-body">

					<div class="form-group">
						<input type="date" class="form-control" name="date"
							required="required">
					</div>

					<div class="form-group">
						<input type="text" class="form-control" name="title"
							placeholder="输入标题(20个字符以内)" maxlength="20" required="required">
					</div>

					<div class="form-group">
						<label for="cover">上传封面,大小不超过2M</label> 
						<input id="cover" name="cover" type="file" >

					</div>
					<div class="form-group">						
						<textarea name="content" id='edit' style="margin-top: 30px;"></textarea>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="submit" class="btn btn-success">增加</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>