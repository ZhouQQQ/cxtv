<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<form id="editCxrj" action="admin/updateCxrj" method="POST" enctype="multipart/form-data">
	<div class="modal fade" id="editCxrjWindow">
		<div class="modal-content modal-lg center-block">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #449D44">
					<button class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
					<h2 class="modal-title"
						style="text-align: center; font-family: '微软雅黑'; color: #fff">修改日记</h2>
				</div>

				<div class="modal-body">
					<div class="form-group">
						<input type="date" class="form-control" name="editDate" id="editDate"
							required="required">
					</div>

					<div class="form-group">
						<input type="hidden" id="hiddenid" name="id"> <input
							type="text" class="form-control" name="editTitle" id="editTitle"
							placeholder="输入标题(20个字符以内)" maxlength="20" required="required">
					</div>

					<div class="form-group">
						<label for="editCover">上传封面,大小不超过2M</label> <input id="editCover"
							name="editCover" type="file">

					</div>
					<div class="form-group">
						<textarea name="editContent" id='editContent'
							style="margin-top: 30px;"></textarea>
					</div>

				</div>

				<div class="modal-footer">
					<button type="button" id="cancel" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="submit" class="btn btn-success">确认修改</button>
				</div>
			</div>
		</div>
	</div>

</form>