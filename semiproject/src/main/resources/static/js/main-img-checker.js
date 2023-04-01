// 메인 이미지 등록 검사 모듈

$(function(){

	var valid = {
		mainTitleValid:false,
		/*imgValid: false,*/
		isAllValid:function() {
			return this.mainTitleValid
			/*&& this.img1Valid*/;
		}
	}
	
	// 메인 이미지 제목 검사
	$("[name=mainTitle]").blur(function() {
		var isValid = $(this).val().length <= 100 && $(this).val().length > 0;
		valid.mainTitleValid = isValid;
		$(this).removeClass("valid invalid").addClass(isValid ? "valid" : "invalid");
	})
	/*// 메인 이미지 크기 검사
	$("[name=img]").blur(function() {
		var isValid = $(this).val().length <= 9223372036854775807 && $(this).val().length > 0;
		valid.imgValid = isValid;
		$(this).removeClass("valid invalid").addClass(isValid ? "valid" : "invalid");
	})*/
	
	// form 검사
	$(".upload-form").submit(function(e) {
		return valid.isAllValid();
	})
	
});
