<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script type="text/javascript">
        $(function(){
            //초기 데이터
            var data = [
                {
                    no:1,
                    title:"1번 질문 제목",
                    content:"1번 질문 내용"
                }
            ];
            //초기 데이터를 이용하여 템플릿 두 개를 불러와 화면을 생성
            for(var i=0; i < data.length; i++) {
                var editTemplate = $("#edit-template").html();
                var editHtml = $.parseHTML(editTemplate);
                $(editHtml).find("textarea").val(data[i].content);
                $(editHtml).find(".cancel-btn").click(function(){
                    //this == 취소버튼
                    $(this).parents(".edit-panel").hide()
                                .next(".view-panel").show();
                });
                $(".target").append(editHtml);

                var viewTemplate = $("#view-template").html();
                var viewHtml = $.parseHTML(viewTemplate);
                $(viewHtml).find(".contents").text(data[i].content);
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
            }
            $(".edit-panel").hide();
        });
    </script>

<div class="container-1000">
        <div class="row">
            <h1>Q&A 상세</h1>
        </div>
        <div class="row target">
        </div>
    </div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>