$(function(){
	var valid = {
		memberNickValid:true,		//닉네임(형식+중복)
		memberEmailValid:true,		//이메일(형식+중복)
		memberPhoneValid:true,		//전화번호(형식)
		memberAddressValid:true,	//주소(애매한 입력)
		isAllValid:function(){
			return this.memberNickValid
						&& this.memberEmailValid
						&& this.memberPhoneValid
						&& this.memberAddressValid;
		}
	};


	//닉네임 검사
	$("[name=memberNick]").blur(function(){
		var regex = /^[가-힣0-9]{2,10}$/;
		var target = $(this);
		var memberNick = target.val();
		var isValid = regex.test(memberNick);
		
		valid.memberNickValid = isValid;
		if(!isValid) {//형식 오류 -> invalid
			target.removeClass("valid invalid invalid2")
						.addClass("invalid");
			return;
		}
		
		$.ajax({
			url:contextPath + "/rest/member/memberNick/"+memberNick,
			method:"get",
			success:function(response){
				if(response == "Y") {
					valid.memberNickValid = true;
					target.removeClass("valid invalid invalid2")
								.addClass("valid");
				}
				else {
					valid.memberNickValid = false;
					target.removeClass("valid invalid invalid2")
								.addClass("invalid2");
				}
			},
			error:function(){
				alert("통신 오류 발생");
				valid.memberNickValid = false;
			},
		});
	});
	//이메일 검사
		$("[name=memberEmail]").blur(function(){
		var regex = /.+@.+/;
		var target = $(this);
		var memberEmail = target.val();
		var isValid = regex.test(memberEmail);
		
		valid.memberEmailValid = isValid;
		if(!isValid) {//형식 오류 -> invalid
			target.removeClass("valid invalid invalid2")
						.addClass("invalid");
			return;
		}
		
		$.ajax({
			url:contextPath + "/rest/member/memberEmail/"+memberEmail,
			method:"get",
			success:function(response){
				if(response == "Y") {
					valid.memberEmailValid = true;
					target.removeClass("valid invalid invalid2")
								.addClass("valid");
				}
				else {
					valid.memberEmailValid = false;
					target.removeClass("valid invalid invalid2")
								.addClass("invalid2");
				}
			},
			error:function(){
				alert("통신 오류 발생");
				valid.memberEmailValid = false;
			},
		});
	});
	//전화번호 검사
	$("[name=memberPhone]").blur(function(){
		var regex = /^01[016789][1-9][0-9]{6,7}$/;
		var isValid = regex.test($(this).val());
		
		valid.memberPhoneValid = isValid;
		$(this).removeClass("valid invalid")
					.addClass(isValid ? "valid" : "invalid");
	});
	
	//주소 검사
	$("[name=memberDetailAddr]").blur(function(){
		var memberPost = $("[name=memberPost]").val();
		var memberBasicAddr = $("[name=memberBasicAddr]").val();
		var memberDetailAddr = $(this).val();
		
		var isAllEmpty = memberPost.length == 0
								&& memberBasicAddr.length == 0
								&& memberDetailAddr.length == 0;
		var isAllWritten = memberPost.length > 0
								&& memberBasicAddr.length > 0
								&& memberDetailAddr.length > 0;
		var isValid = isAllEmpty || isAllWritten;
		
		valid.memberAddressValid = isValid;
		
		$(this).removeClass("valid invalid")
					.addClass(isValid ? "valid" : "invalid");

	});
		//폼 검사
	$(".edit-form").submit(function(e){
		console.table(valid);
		return valid.isAllValid();
	});
});
	









