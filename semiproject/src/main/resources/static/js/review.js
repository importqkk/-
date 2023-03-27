//리뷰
$(function(){
    $('.review-star .starR').click(function(){
        $(this).parent().children('.starR').removeClass('on').removeClass('fa-solid');      
        $(this).addClass('fa-solid').addClass('on').prevAll('.starR').addClass('on').addClass('fa-solid');
        var starRating = $(this).attr('value');
        console.log(starRating); // 선택된 별점의 value 값 출력
    });
});
$(function(){
      $(".review-content").hide();
      $(".btn-panel").hide();
      $(".review-star").hide();
      $(".edit-btn").click(function(){
      $(".view-panel").hide();
      $(".review-content").show();
      $(".btn-panel").show();
      $(".review-star").show();
    })
      $(".cancel-btn").click(function(){
      $(".view-panel").show();
      $(".review-content").hide();
      $(".btn-panel").hide();
      $(".review-star").hide();
    })
});


$(function(){
	var params = new URLSearchParams(location.search);
	var productNo = params.get("productNo");
	
	//리뷰 목록 불러오기
	loadList();
	
	$(".review-insert-btn").click(function(){
		var content = $("[name=reviewContent]").val();
		var starRating = $(".review-star .starR.on").last().attr("value");
//		var rating = $("[name=reviewStar]").val();
//		console.log(content);
//		console.log(productNo);
		console.log(starRating);
//		console.log(memberId);
		
		if(content.trim().length == 0) return;
		
		$.ajax({
			url:"/rest/review/", 
			method:"post",
			data:{
				productNo: productNo,
				reviewContent: content,
				reviewStar: starRating
			},
			success:function(response){
				loadList();
				$("[name=reviewContent]").val("");
				$(".review-star .on").removeClass("fa-solid");
				$(".review-content").hide();
			    $(".btn-panel").hide();
			    $(".review-star").hide();
			    $(".view-panel").show();
				
			},
			error:function(){
				alert("통신 오류 발생");
			}
		});
	});
	
	function loadList(){
		$(".review-list").empty();
		
		$.ajax({
			url:"/rest/review/"+productNo,
			method:"get",
			success:function(response){
//				console.log(response);
				for(var i=0; i < response.length; i++){
					
					var template  = $("#review-template").html();
					var html = $.parseHTML(template);
					
					$(html).find(".memberId").text(response[i].memberId);
					$(html).find(".reviewTime").text(response[i].reviewTime);
					$(html).find(".reviewContent").text(response[i].reviewContent);
					$(html).find(".reviewLike").text(response[i].reviewLike);
					
					
					
					if(memberId == response[i].memberId){
						var editButton  = $("<i>").addClass("fa-solid fa-edit")
													.attr("data-review-no", response[i].reviewNo)
													.attr("data-review-content", response[i].reviewContent)
													.attr("data-review-star", response[i].reviewStar)
													.click(editReview);
						var deleteButton = $("<i>").addClass("fa-solid fa-trash")
													.attr("data-review-no", response[i].reviewNo)
													.click(deleteReview);
						
					 	$(html).find(".memberId").append(deleteButton)
					 								.append(editButton);
					}
//					$(html).find(".reviewStar").empty(); // 이전에 채워진 별표 초기화
					for (var j = 0; j < response[i].reviewStar; j++) {
					    $(html).find(".reviewStar").append('<i class="fa-solid fa-star starR on"></i>');
					}
					for (var j = response[i].reviewStar; j < 5; j++) {
					    $(html).find(".reviewStar").append('<i class="fa-regular fa-star starR"></i>');
					}
										
					$(".review-list").append(html);
				}
			},
			error:function(){
				alert("리스트 오류 발생")
			}
		});
	}
	
	function deleteReview() {
		var choice = window.confirm("정말 삭제하시겠습니까?\n삭제 후 복구는 불가능합니다");
		if(choice == false) return;
		
		var reviewNo = $(this).data("review-no");
//		console.log(reviewNo);
		
		$.ajax({
			url:"/rest/review/"+reviewNo,
			method:"delete",
			success:function(response){
				loadList();
			},
			error:function(){
				alert("지우기 오류 발생");
			},
		});
	}
	
	function editReview(){
		
		var reviewNo = $(this).data("review-no");
		var reviewContent = $(this).data("review-content");
		var reviewStar = $(this).data("review-star");
		
		var template = $("#review-edit-template").html();
		var html  = $.parseHTML(template);
		
		//수정 전 리뷰 내용 찍기
		$(html).find("[name=reviewContent]").val(reviewContent);
		
		//수정 전 리뷰 별점 찍기
		for(var i=0; i<reviewStar; i++){
			$(html).find(".reviewStar").append('<i class="fa-solid fa-star starR on" value="'+ (i+1) + '"></i>');
		}
		for(var i=reviewStar; i<5; i++){
			$(html).find(".reviewStar").append('<i class="fa-regular fa-star starR" value="'+ (i+1) + '"></i>');
		}
		
		$(html).find('.reviewStar .starR').click(function () {
        	$(this).parent().children('.starR').removeClass('on').removeClass('fa-solid');
        	$(this).addClass('fa-solid').addClass('on').prevAll('.starR').addClass('on').addClass('fa-solid');
        	
//        	var reviewStar = $(html).find('.starR.on').last().attr("value");
//        	console.log(reviewStar)
    	});
		 
		
		//등록창에 수정창 띄우기
		$(".review-write").hide().after(html);
		


		$(html).find(".review-edit-btn").click(function(){
					var reviewContent = $(html).find("[name=reviewContent]").val();
					var reviewStar = $(html).find('.starR.on').last().attr("value");
					console.log(reviewStar);
					console.log(reviewNo);
					console.log(reviewContent);
					$.ajax({
						url:"/rest/review/",
						method:"patch",
						data:{
							reviewNo:reviewNo,
							reviewContent:reviewContent,
							reviewStar:reviewStar
						},
						success:function(response){
							loadList();
						},
						error:function(){
							alert("수정 오류 발생");
						}
					});
		$(".edit-panel").hide();
		$(".review-write").show();
					
			
		});
		
		$(html).find(".review-cancel-btn").click(function(){
			$(".edit-panel").hide();
			$(".review-write").show();
		});
	}
	
});