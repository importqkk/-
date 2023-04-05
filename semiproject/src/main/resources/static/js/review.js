//리뷰 등록
$(function(){
	var params = new URLSearchParams(location.search);
	var productNo = params.get("productNo");
	
	//리뷰 목록 불러오기
	loadList();

  	$('.review-star .starR').click(function(){
        $(this).parent().children('.starR').removeClass('on').removeClass('fa-solid');      
        $(this).addClass('fa-solid').addClass('on').prevAll('.starR').addClass('on').addClass('fa-solid');
    });
	
	$(".review-insert-btn").click(function(){
		
		var content = $("[name=reviewContent]").val();
		var starRating = $(".review-star .starR.on").last().attr("value");
		
		if(content.trim().length == 0){
			alert("내용을 입력해주세요.");
			return false;
		}
		
		if(!starRating){
			alert("별점을 입력해주세요.");
			return false;
		}
		
		//글자수 1000자 미만까지 허용
		if(content.trim().length > 1000){
			alert("1000자까지 입력 가능합니다.");
			return false;
		}
		
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
			     location.reload();
			},
			error:function(){
				alert("등록 오류");
				$(".review-content").hide();
			    $(".btn-panel").hide();
			    $(".review-star").hide();
			    $(".view-panel").show();
			}
		});
	});
	
	
	//리뷰 로드
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
					$(html).find(".reviewTime").text(response[i].reviewTime);
					$(html).find(".reviewContent").text(response[i].reviewContent);
					$(html).find(".heart-count").text(response[i].reviewLike);
					
					//session에서 불러온 memberId와 불러온 review의 memberId가 같은 경우 수정/삭제 버튼 나타나도록 함
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
					
					//reviewNo를 불러와 check한 후 화면에 현재의 좋아요 상태 찍음
					var reviewNo = response[i].reviewNo;
					
						(function(reviewNo) {
							    $.ajax({
							      url: "/rest/review/check",
							      method: "post",
							      data: {
							        reviewNo: reviewNo
							      },
							      success: function(response) {
									    //response가 true인 경우 count == 1이므로 fa-regular class는 지우고 fa-solid class 추가
									    //false인 경우에는 likeButton 유지
										if (response) {
								            // reviewNo와 data-review-no가 일치하는 하트 버튼의 class를 변경
								          $(`.review-list [data-review-no=${reviewNo}]`).removeClass("fa-regular").addClass("fa-solid");
								        }
							      },
							      error: function() {
							        alert("좋아요 체크 기능 오류");
							      }
							    });
							  })(response[i].reviewNo); // 즉시 실행 함수로 클로저 생성 -> 생성하지 않으면 첫 번째 리뷰의 리뷰번호만 반복됨
												
					$(html).find(".reviewLike").prepend(likeButton);

					$(".review-list").append(html);
										
				}
			},
			error:function(){
				alert("리스트 오류 발생")
			}
		});
	}
	
	//리뷰 삭제
	function deleteReview() {
		var choice = window.confirm("정말 삭제하시겠습니까?\n삭제 후 복구는 불가능합니다");
		if(choice == false) return;
		
		var reviewNo = $(this).data("review-no");
		
		$.ajax({
			url:"/rest/review/"+reviewNo,
			method:"delete",
			success:function(response){
				$(".review-content").hide();
			    $(".btn-panel").hide();
			    $(".review-star").hide();
			    $(".view-panel").show();
				loadList();
				location.reload();
			},
			error:function(){
				alert("지우기 오류 발생");
			},
		});
	}
	
	//리뷰 수정
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
//		$(".view-panel").hide();
		$(".review-write").hide();
		$editPanel.show();
    	$(".review[data-review-no=" + reviewNo + "]").hide();
		 
		

		$(html).find(".review-edit-btn").click(function(){
					var reviewContent = $(html).find("[name=reviewContent]").val();
					var reviewStar = $(html).find('.starR.on').last().attr("value");
					if(reviewContent.trim().length == 0){
					alert("내용을 입력해주세요.");
					return false;
					}
					
					if(!reviewStar){
						alert("별점을 입력해주세요.");
						return false;
					}
					
					//글자수 1000자 미만까지 허용
					if(reviewContent.trim().length > 1000){
						alert("1000자까지 입력 가능합니다.");
						return false;
					}
					
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
		
		
		$(".review[data-review-no=" + reviewNo + "]").show();
					
			
		});
		
		$(html).find(".review-cancel-btn").click(function(){
			$editPanel.remove();
			$(".review-write").show();
		});
	}

//리뷰 좋아요
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
            var $heartCount = $likeButton.siblings(".heart-count");
            var currentCount = parseInt($heartCount.text()); // 현재 좋아요 수 가져오기
			
            if(response.result){
				$heartCount.text(currentCount + 1); // 원래의 좋아요 수에 +1 더하기
				$likeButton.removeClass("fa-regular fa-solid").addClass("fa-solid");
            }
            else{
				$heartCount.text(currentCount - 1); // 원래의 좋아요 수에 -1 빼기
				$likeButton.removeClass("fa-regular fa-solid").addClass("fa-regular");
            }
        },
        error:function(){
			alert("좋아요 오류");
		}
    });
}



	
});
	
