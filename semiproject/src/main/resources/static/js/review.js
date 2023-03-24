//리뷰
$(function(){
            $('.star-rating .starR').click(function(){
                $(this).parent().children('.starR').removeClass('on').removeClass('fa-solid')        
                $(this).addClass('fa-solid').addClass('on').prevAll('.starR').addClass('on').addClass('fa-solid');
        });
    });
$(function(){
      $(".review-content").hide();
      $(".btn-panel").hide();
      $(".star-rating").hide();
      $(".edit-btn").click(function(){
      $(".view-panel").hide();
      $(".review-content").show();
      $(".btn-panel").show();
      $(".star-rating").show();
    })
      $(".cancel-btn").click(function(){
      $(".view-panel").show();
      $(".review-content").hide();
      $(".btn-panel").hide();
      $(".star-rating").hide();
    })
});


$(function(){
	var params = new URLSearchParams(location.search);
	var productNo = params.get("productNo");
	
	//리뷰 목록 불러오기
	loadList();
	
	$(".review-insert-btn").click(function(){
		var content = $("[name=reviewContent]").val();
		var rating = $("[name=reviewStar]").val();
//		var rating = $(this).attr('value');
//		console.log(content);
//		console.log(productNo);
//		console.log(rating);
		
		if(content.trim().length == 0) return;
		
		$.ajax({
			url:"/rest/review/", 
			method:"post",
			data:{
				productNo: productNo,
				reviewContent: content,
				reviewStar: rating
			},
			success:function(response){
				loadList();
				$("[name=reviewContent]").val("");
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
					$(html).find(".reviewStar").text(response[i].reviewStar);
					$(html).find(".reviewTime").text(response[i].reviewTime);
					$(html).find(".reviewContent").text(response[i].reviewContent);
					$(html).find(".reviewLike").text(response[i].reviewLike);
					
					if(memberId == response[i].memberId){
						var editButton  = $("<i>").addClass("fa-solid fa-edit")
													.attr("data-review-no", response[i].reviewNo)
													.attr("data-review-content", response[i].reviewContent)
													.click(editReview);
						var deleteButton = $("<i>").addClass("fa-solid fa-trash")
													.attr("data-review-no", response[i].reviewNo)
													.click(deleteReview);
					 	$(html).find(".reviewStar").append(editButton)
					 								.append(deleteButton);
					}
					$(".review-list").append(html);
				}
			},
			error:function(){
				alert("리스트 오류 발생")
			}
		});
	};
});