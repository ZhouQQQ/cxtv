$(function() {

	$('#logout').click(function(e) {
		$.ajax({
			url : "logout",
			type : "get",
			complete : function() {
				e.preventDefault();
				window.location.reload();
			}
		});
	});

	var handlerEmbed = function(captchaObj) {

		$("#embed-register").click(function(e) {
			var validate = captchaObj.getValidate();
			if (!validate) {
				$("#notice1")[0].className = "show";
				setTimeout(function() {
					$("#notice1")[0].className = "hide";
				}, 2000);
				e.preventDefault();
			}

		});

		// 将验证码加到id为captcha的元素里
		captchaObj.appendTo("#embed-captcha");

		captchaObj.onReady(function() {
			$("#wait1")[0].className = "hide";
			$("#wait2")[0].className = "hide";
		});

	};
	$.ajax({
		// 获取id，challenge，success（是否启用failback）
		url : "startCaptcha",
		type : "get",
		dataType : "json",
		success : function(data) {
			// 使用initGeetest接口
			// 参数1：配置参数
			// 参数2：回调，回调的第一个参数验证码对象，之后可以使用它做appendTo之类的事件
			initGeetest({
				gt : data.gt,
				challenge : data.challenge,
				product : "float", // 产品形式，包括：float，embed，popup。注意只对PC版验证码有效
				offline : !data.success
			// 表示用户后台检测极验服务器是否宕机，一般不需要关注
			}, handlerEmbed);
		}
	});

	$("input[name='username'],input[name='password']").focus(function() {
		$('#result').removeClass('show');
		$('#result').addClass('hidden');
	});

	var handlerEmbed2 = function(captchaObj2) {

		$("#embed-login").click(function(e) {			
			
			var validate2 = captchaObj2.getValidate();
			if (!validate2) {
				$("#notice2")[0].className = "show";
				setTimeout(function() {
					$("#notice2")[0].className = "hide";
				}, 2000);
				e.preventDefault();
				

			} else {
				e.preventDefault();
				var username = $("input[name='username']").val();
				var password = $("input[name='password']").val();
				$.ajax({
					type : "POST",
					url : "verifyLogin", // 处理测试页面,注意返回内容，成功返回OK
					dataType : "text",
					data : $("#loginwindow").serialize(),
					beforeSend :function(){
						$("#embed-login").text('提交中');
						$("#embed-login").addClass('disabled');
					},
					success : function(msg) {
						if (msg == "true") {
							$('#result').removeClass('show');
							$('#result').addClass('hidden');
							window.location.reload();
						} else if (msg == "false") {
							captchaObj2.refresh();
							$('#result').removeClass('hidden');
							$('#result').addClass('show');
						} else {
							captchaObj2.refresh();
							alert("请刷新");
						}

					},
					complete : function() {
						$("#embed-login").text('登录');
						$("#embed-login").removeClass('disabled');
					},

				});

			}

		});

		// 将验证码加到id为captcha的元素里
		captchaObj2.appendTo("#embed-captcha-2");

	};
	$.ajax({
		// / / 获取id，challenge，success（是否启用failback）
		url : "startCaptcha",
		type : "get",
		dataType : "json",
		success : function(data) {
			// 使用initGeetest接口
			// 参数1：配置参数
			// 参数2：回调，回调的第一个参数验证码对象，之后可以使用它做appendTo之类的事件
			// 返回的参数如下
			/*
			 * {"success":1, "gt":"b46d1900d0a894591916ea94ea91bd2c",
			 * "challenge":"e0936ac770c510c29acf51324327abc6"}
			 */

			initGeetest({
				gt : data.gt,
				challenge : data.challenge,
				product : "float", // / /
				// 产品形式，包括：float，embed，popup。注意只对PC版验证码有效
				offline : !data.success
			// / / 表示用户后台检测极验服务器是否宕机，一般不需要关注
			}, handlerEmbed2);
		}
	});

});
