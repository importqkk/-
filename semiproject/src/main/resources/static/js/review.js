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
//	checkReview();
	
	$(".review-insert-btn").click(function(){
		
		var content = $("[name=reviewContent]").val();
		var starRating = $(".review-star .starR.on").last().attr("value");
		
//		var rating = $("[name=reviewStar]").val();
//		console.log(content);
//		console.log(productNo);
//		console.log(starRating);
//		console.log(memberId);
		
		if(content.trim().length == 0 || !starRating) return;
		
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
//			    checkReview();
//			    location.reload();
			},
			error:function(){
				alert("이미 작성된 리뷰가 있습니다.\n리뷰는 1회만 작성 가능합니다.");
			}
		});
	});
	
//	function checkReview() {
//	  $.ajax({
//	    url: "/rest/review/reviewCountCheck",
//	    type: "POST",
//	    success: function(response) {
//	      if (response) {
//	        // 리뷰가 존재하는 경우, 메시지를 띄워준다.
//	        alert("이미 작성된 리뷰가 있습니다. 리뷰는 1회만 작성 가능합니다.");
//	      } else {
//	        // 리뷰가 존재하지 않는 경우, 리뷰 작성 페이지로 이동한다.
//	         $(".view-panel").hide();
//		     $(".review-content").show();
//	         $(".btn-panel").show();
//	         $(".review-star").show();
//	      }
//	    },
//	    error: function(error) {
//	      console.log(error);
//	    }
//	  });
//	}
	
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
					$(html).find(".heart-count").text(response[i].reviewLike);
					
					if(memberId == response[i].memberId){
						$(html).find(".edit-text")
								.attr("data-review-no", response[i].reviewNo)
							    .attr("data-review-content", response[i].reviewContent)
							    .attr("data-review-star", response[i].reviewStar)
							    .click(editReview);
						$(html).find(".delete-text")
								.attr("data-review-no", response[i].reviewNo)
							    .click(deleteReview);
							
					}
					else{
						$(html).find(".changeText").hide();
					}
			
						
//					$(html).find(".reviewStar").empty(); // 이전에 채워진 별표 초기화
					for (var j = 0; j < response[i].reviewStar; j++) {
					    $(html).find(".reviewStar").append('<i class="fa-solid fa-star starR on"></i>');
					}
					for (var j = response[i].reviewStar; j < 5; j++) {
					    $(html).find(".reviewStar").append('<i class="fa-regular fa-star starR"></i>');
					}
					
					var likeButton = $("<i>").addClass("fa-heart fa-regular")
												.attr("data-review-no", response[i].reviewNo)
												.click(likeReview);
					
					var reviewNo = response[i].reviewNo;
//					console.log(reviewNo);
					
					
						(function(reviewNo) {
							    $.ajax({
							      url: "/rest/review/check",
							      method: "post",
							      data: {
							        reviewNo: reviewNo
							      },
							      success: function(response) {
//									    console.log(response);
//										console.log(reviewNo); //83만 계속나옴 
										
										if (response) {
		//									console.log(reviewNo);
								            // reviewNo와 data-review-no가 일치하는 하트 버튼의 class를 변경
								          $(`.review-list [data-review-no=${reviewNo}]`).removeClass("fa-regular").addClass("fa-solid");
								        }
							      },
							      error: function() {
							        alert("좋아요 체크 기능 오류");
							      }
							    });
							  })(response[i].reviewNo); // 즉시 실행 함수로 클로저 생성
												
					$(html).find(".reviewLike").prepend(likeButton);
					
//					$(html).find(".reviewLike span").text("");
						

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
				location.reload();
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
		
		// 이미 수정 창이 떠있다면 해당 창을 이용하고, 그렇지 않으면 새로운 수정 창을 생성한다
		var $editPanel = $('.edit-panel[data-review-no="' + reviewNo + '"]');
		if ($editPanel.length == 0) {
			var template = $("#review-edit-template").html();
			var html = $.parseHTML(template);
			$(html).attr("data-review-no", reviewNo);
			$(html).find("[name=reviewContent]").val(reviewContent);
			for(var i=0; i<reviewStar; i++){
				$(html).find(".reviewStar").append('<i class="fa-solid fa-star starR on" value="'+ (i+1) + '"></i>');
			}
			for(var i=reviewStar; i<5; i++){
				$(html).find(".reviewStar").append('<i class="fa-regular fa-star starR" value="'+ (i+1) + '"></i>');
			}
			$('.review-write').hide().after(html);
			$editPanel = $(html);
		}
		
		$editPanel.find('.reviewStar .starR').click(function () {
        	$(this).parent().children('.starR').removeClass('on').removeClass('fa-solid').addClass('fa-regular');
        	$(this).addClass('fa-solid').addClass('on').prevAll('.starR').addClass('on').addClass('fa-solid'); 
    	});
    	
		$editPanel.show();
		
		$editPanel.find(".review-edit-btn").click(function(){
			var reviewContent = $editPanel.find("[name=reviewContent]").val();
			var reviewStar = $editPanel.find('.starR.on').last().attr("value");
//			console.log(reviewStar);
//			console.log(reviewNo);
//			console.log(reviewContent);
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
			$editPanel.hide();
			$(".review-write").show();
		});
		
		$editPanel.find(".review-cancel-btn").click(function(){
			$editPanel.remove();
			$(".review-write").show();
		});
	}

function likeReview(){
    var reviewNo = $(this).data("review-no");
    
    var $likeButton = $(this); // 선택한 하트 엘리먼트

    $.ajax({
        url:"/rest/review/like",
        method:"post",
        data:{
            reviewNo:reviewNo
        },
        success:function(response){
//			console.log($likeButton);
            var $heartCount = $likeButton.siblings(".heart-count");
            var currentCount = parseInt($heartCount.text()); // 현재 좋아요 수 가져오기
			
            if(response.result){
				$heartCount.text(currentCount + 1); // 원래의 좋아요 수에 +1 더하기
				$likeButton.removeClass("fa-regular fa-solid").addClass("fa-solid");
            }
            else{
				$heartCount.text(currentCount - 1); // 원래의 좋아요 수에 +1 더하기
				$likeButton.removeClass("fa-regular fa-solid").addClass("fa-regular");
            }
        },
        error:function(){
			alert("좋아요 오류");
		}
    });
}



	
});
	