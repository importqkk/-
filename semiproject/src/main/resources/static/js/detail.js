$(function(){
	let qaNo = "${qaDto.qaNo}";
	
	$.ajax({
		url:"WEB-INF/views/qa/detail",
		type:"POST",
		data:{"qaNo": qaNo},
		dataType:"json",
		cache:false,
		success: function(data){
			var editTemplate = $("#edit-template").html();
	        var editHtml = $.parseHTML(editTemplate);
	        $(editHtml).find("head").val();
	        $(editHtml).find("textarea").val();
	        $(editHtml).find(".cancel-btn").click(function(){
	            //this == 취소버튼
	            $(this).parents(".edit-panel").hide()
	                        .next(".view-panel").show();
	        });
	        $(".target").append(editHtml);

	        var viewTemplate = $("#view-template").html();
	        var viewHtml = $.parseHTML(viewTemplate);
	        $(viewHtml).find(".contents").text(data.qaContent);
	        $(viewHtml).find(".edit-btn").click(function(){
	            //this == 수정버튼

	            //(+추가)
	            //글자 유지하도록 처리
	            //= 버튼앞에 .contents에 작성된 글자 불러와서
	            //= .edit-panel에 있는 textarea에 설정
	            var contents = $(this).prev(".contents").text();
	            $(this).parents(".view-panel")
	                    .prev(".edit-panel")
	                    .find("textarea")
	                    .val(contents);
	                    
	            $(this).parents(".view-panel").hide()
	                        .prev(".edit-panel").show();
		        });
		        $(viewHtml).find(".delete-btn").click(function(){
		            var choice = window.confirm("정말 삭제하시겠습니까?");
		                        if(choice == false) return;
	
		                        //var no = $(this).parent().prev().prev().prev().text();
		                        //var no = $(this).attr("data-no");
		                        var no = $(this).data("no");//읽기만 가능 
		        });
	
		        $(".target").append(viewHtml);
		    
	
		    	$(".edit-panel").hide();
		},
	   error: function(request,status,error){
		   alert("조회 실패");
			}
	 });//ajax end
	
});