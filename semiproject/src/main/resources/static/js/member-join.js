$(function(){
	var valid = {
		memberIdValid:false,			//아이디	(형식+중복)
		memberNameValid:false,	//이름(형식)
		memberNickValid:false,		//닉네임(형식+중복)
		memberPwValid:false,		//비밀번호(형식)
		memberPwReValid:false,		//비밀번호 확인(일치)
		memberPhoneValid:false,		//전화번호(형식)
		memberAddressValid:true,	//주소(애매한 입력)
		isAllValid:function(){
			return this.memberIdValid
						&& this.memberNameValid
						&& this.memberNickValid
						&& this.memberPwValid
						&& this.memberPwReValid
						&& this.memberPhoneValid
						&& this.memberAddressValid;
		}
	};

	$("[name=memberId]").blur(function(){
		var regex = /^[a-z0-9-_]{5,20}$/;
		var memberId = $(this).val();
		var isValid = regex.test(memberId);
		
		valid.memberIdValid = isValid;
		
		if(isValid) { //id검사
			$.ajax({
				url:"/rest/member/memberId/" + memberId,
				method:"get",
				success:function(response) {
					if(response == "Y") {
						valid.memberIdValid = true;
						$("[name=memberId]")
									.removeClass("valid invalid invalid2")
									.addClass("valid");
					}
					else {
						valid.memberIdValid = false;
						$("[name=memberId]")
									.removeClass("valid invalid invalid2")
									.addClass("invalid2");
					}
				},
				error:function(){//
					alert("오류가 발생했습니다\n잠시 후 시도하세요");
					valid.memberIdValid = false;
				}
			});
		}
		else {
			$(this).removeClass("valid invalid invalid2")
						.addClass("invalid");
		}
	});
		//이름 검사
	$("[name=memberName]").blur(function(){
		var regex = /^[가-힣]{2,7}$/;
		var isValid = regex.test($(this).val());
		
		valid.memberPhoneValid = isValid;
		$(this).removeClass("valid invalid")
					.addClass(isValid ? "valid" : "invalid");
	});
	
	//비밀번호 검사
	$("[name=memberPw]").blur(function(){
		var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$])[a-zA-Z0-9!@#$]{8,16}$/;
		var isValid = regex.test($(this).val());
		
		valid.memberPwValid = isValid;
		$(this).removeClass("valid invalid")
					.addClass(isValid ? "valid" : "invalid");
	});
	
	//비밀번호 확인 검사
	$("#passwordRe").blur(function(){
		var memberPw = $("[name=memberPw]").val();
		var memberPwRe = $(this).val();
		
		var isEmpty = memberPw.length == 0;
		var isValid = memberPw == memberPwRe;
		
		valid.memberPwReValid = !isEmpty && isValid;
		
		$(this).removeClass("valid invalid invalid2");
		if(isEmpty) {
			$(this).addClass("invalid2");
		}
		else if(isValid) {
			$(this).addClass("valid");
		}
		else {
			$(this).addClass("invalid");
		}
	});
	
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
			url:"/rest/member/memberNick/"+memberNick,
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
	
//	//폼 검사
//	$(".join-form").submit(function(e){
//		console.table(valid);
//
//		return valid.isAllValid();
//	});
});









