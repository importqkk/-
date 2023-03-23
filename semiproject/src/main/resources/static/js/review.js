//리뷰

$(function(){
	var params = new URLSearchParams(location.search);
	var productNo = params.get("productNo");
	
	$(".review-insert-btn").click(function(){
		var content = $("[name=reviewContent]").val();
		if(content.trim().length == 0) return;
		
		$.ajax({
			url:"/rest/review/", 
			method:"post",
			data:{
				productNo: productNo,
				reviewContent: content
			},
			success:function(response){
				$("[name=reviewContent").val("");
			},
			error:function(){
				alert("");
			}
		});
	});
	
	function loadList(){
		$(".review-list").empty();
		
		$.ajax({
			url:"/rest/review/"+productNo,
			method:"get",
			success:function(response){
				for(var i=0; i < response.length; i++){
					var template  = $("#review-template").html();
					var html = $.parseHTML(template);
					
					$(html).find(".memberId").text(response[i].memberId);
					$(html).find(".reviewContent").text(response[i].reviewContent);
					$(html).find(".reviewTime").text(response[i].reviewTime);
					
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