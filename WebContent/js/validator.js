/**
 * 注册用户时的验证
 */
$(function() {
	$('#registerwindow')
			.bootstrapValidator(
					{
						feedbackIcons : {/* 输入框不同状态，显示图片的样式 */
							valid : 'glyphicon glyphicon-ok',
							invalid : 'glyphicon glyphicon-remove',
							validating : 'glyphicon glyphicon-refresh'
						},
						fields : {/* 验证 */
							username : {/* 键名username和input name值对应 */
								trigger : 'keyup',
								threshold : 4,// 4个字符以上才开始验证
								validators : {
									notEmpty : {/* 非空提示 */
										message : '用户名不能为空'
									},
									regexp : {/* 只需加此键值对，包含正则表达式，和提示 */
										regexp : /^[\u4E00-\u9FA5A-Za-z0-9][\u4E00-\u9FA5A-Za-z0-9]+$/,
										message : '不要包含特殊符号'
									},
									stringLength : {/* 长度提示 */
										min : 4,
										max : 10,
										message : '用户名长度必须在4到10之间'
									},
									remote : {
										// ajax验证 server
										// result:{"valid",true or
										// false} 向服务发送当前input
										// name值，获得一个json数据。例表示正确：{"valid",true}
										url : 'checkUsernameIsNotExist',// 验证地址
										message : '用户名已存在',// 提示消息										
										type : 'POST'// 请求方式									
									}

								}
							},
							password : {
								trigger : 'blur',
								validators : {
									notEmpty : {
										message : '密码不能为空'
									},
									stringLength : {
										min : 6,
										max : 30,
										message : '密码长度必须在6到30之间'
									},
									identical : {// 相同
										field : 'confirmpassword',
										message : '两次密码不一致'
									},
									regexp : {// 匹配规则
										regexp : /^[a-zA-Z0-9_?]+$/,
										message : '密码只能包含大小写字母,数字,_和?'
									}
								}
							},
							confirmpassword : {
								trigger : 'blur',
								message : '密码无效',
								validators : {
									notEmpty : {
										message : '密码不能为空'
									},
									stringLength : {
										min : 6,
										max : 30,
										message : '密码长度必须在6到30之间'
									},
									identical : {// 相同
										field : 'password',
										message : '两次密码不一致'
									},
									different : {// 不能和用户名相同
										field : 'username',
										message : '不能和用户名相同'
									},
									regexp : {// 匹配规则
										regexp : /^[a-zA-Z0-9_?]+$/,
										message : '密码只能包含大小写字母,数字,_和?'
									}
								}
							}

						}
					});
	
	

});