$(function(){
	var valid = {
		/*currentPwValid:false,*/
		changePwValid:false,		//비밀번호(형식)
		isAllValid:function(){
			return this.changePwValid/* && this.currentPwValid*/;
		}
	};



	//새 비밀번호 검사
	$("[name=changePw]").blur(function(){
		var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$])[a-zA-Z0-9!@#$]{8,16}$/;
		var isValid = regex.test($(this).val());
		
		valid.changePwValid = isValid;
		$(this).removeClass("valid invalid")
					.addClass(isValid ? "valid" : "invalid");
	});
		//폼 검사
	$(".password-form").submit(function(e){
		console.table(valid);
		return valid.isAllValid();
	});
});
	









