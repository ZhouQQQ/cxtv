<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<form id="editLtkg" action="admin/updateLtkg" method="POST">
	<div class="modal fade" id="editLtkgWindow" tabindex="-1"
		style="width: 400px; margin: 40px auto;">
		<div class="modal-content modal-md">
			<div class="modal-content">
				<div class="modal-header" style="background-color:#449D44">
					<button class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
					<h2 style="text-align: center; font-family: '微软雅黑';color:#fff"
						class="modal-title">修改</h2>
				</div>

				<div class="modal-body">

					<div class="form-group">
						<input type="hidden" id="hiddenid" name="id">
						 <input type="text"
							class="form-control" id="edittitle" placeholder="输入标题(20个字符以内)"
							maxlength="20" required="required" name="updatetitle">
					</div>
					<div class="form-group">
						<input type="date" class="form-control" id="editdate"
							placeholder="输入节目当天日期" required="required" name="updatedate">
					</div>
					<div class="form-group">
						<textarea id="editcode" placeholder="从优酷网站复制优酷通用代码"
							class="form-control" rows="5" style="resize: none"
							required="required" name="updatecode"></textarea>
					</div>



				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="submit" class="btn btn-success">确认修改</button>
				</div>
			</div>
		</div>
	</div>

</form>