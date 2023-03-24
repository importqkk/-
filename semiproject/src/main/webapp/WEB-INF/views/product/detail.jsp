<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/load.css">
    <!-- font awsome 아이콘 -->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
    <!-- tabler 아이콘 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tabler/icons-webfont@latest/tabler-icons.min.css">
    <link rel="stylesheet" type="text/css" href="/static/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/static/css/layout.css">
    <link rel="stylesheet" type="text/css" href="/static/css/commons.css">
    <link rel="stylesheet" type="text/css" href="/static/css/test.css">
    <!-- font awesome cdn -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-f9q3yD8+iyf0zvJolTO0+QGd/U8rFyV7vUTd/h5u5lJxRZJz8sRkpA7MUzFGAG+AsTJ16ULbL3qT/ZHxT+XQVQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
      
    <!-- jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <style>
        .flex-remain{
            flex:1;
        }
        .flex-content::after { /*플렉스 초기화 */ 
            content:"";
            display: block;
            clear: both;
        }
        .oneLine { /* 한줄에 표현 */
            display: inline;
        }
        .img-size { /* 이미지 사이즈 조정 */
            width: 400px;
            height: 400px;
        }
        .img-rad-10{ /*버튼을 둥글게 */
            border-radius: 10%;
        }
        .img-background{ /* 이미지 배경색 */
            background-color: #F5F5f5;
        }
        .w-49 {width: 49%;}  /*장바구니, 구매버튼을 위한 간격*/

        .font-lightgrey {
            color: #A2a1a1;
        }
        .font-grey{
            color: #A7a6a5;
        }
        .font-boldgrey{
            color: #5a5b5a;
        }
        .hr-bold{  /* 선 진하게 */
            border-width:2px;
        }

        .star-box{ /*별점 박스*/
            width: 100%;
            height: 85%;
            background-color: #F5F5f5;
            border-radius: 25%;
            justify-content: center;
            align-items: center;
            text-align: center;
            font-weight: bold;  
        }

        /* 차트 */
        .chart {
            flex-direction: column;
            height: 200px;
        }

        /* 차트용 폰트 */
        .chart-font {
            margin-bottom: 15.5px;
        }

        .font-warning{
            font-size:1px;
            font-weight: 200;
            color: red;
        }

        .bar {
            height: 20px;
            background-color: #776BFF;
            border-radius:50px;
            margin-bottom: 15px;
        }

        .font-white{
            color: white;
            -webkit-text-stroke: 2px #776BFF; /* 텍스트 테두리 색 지정 */
			

        }


    </style>
    <script type="text/javascript">
    	
    </script>
    <title>상품 상세페이지</title>
</head>
<body test>
    <div class="container-1000">
        <hr>
        <!-- 이미지 부터 구매하기 버튼까지 -->
        <div class="flex">
            <!-- 상품 이미지 -->
            <div class="w-50 center">
                <img src="templates/image/katalk.png" class="img-size img-rad-10 img-background ">
            </div>
         
            <!-- 상품 가격 부터 구매하기 버튼까지-->
            <div class="flex-remain"> 
                <div class="row">
                    <h5 class="font-grey oneLine">브랜드</h5>
                    <h5 class="font-grey oneLine"> 자로우포뮬러스</h5>
                 
                </div>
                <div class="row">
                    <h2>자로우 도필러스 이피에스 60캡슐</h2>
                </div>
                <div class="row">
                    <br>
                    <h3>30,000원</h3>
                    <br>
                    <h4 class="font-boldgrey oneLine">배송비</h4>
                    &nbsp;
                    <h4 class="oneLine">3,000원</h4><br>
                    <h5 class="fas fa-star font-purple "></h5>
                    <h5 class="fas fa-star font-purple "></h5>
                    <h5 class="fas fa-star font-purple "></h5>
                    <h5 class="fas fa-star font-purple "></h5>
                    <h5 class="fas fa-star font-purple "></h5>
                    <h6 class="font-boldgrey oneLine"> 150개의 후기</h6>

                    
                </div>
                <div class="row">
                    <hr>
                    <div class="flex">
                        <div class="w-70">
                            <h5 class="font-boldgrey oneLine">자로우 도필러스 이피에스 60캡슐</h5>
                        </div>
                        <div class="flex-remain center">
                            <button class="w-100 form-btn small neutral center">하하</button>
                        </div>                        
                    </div>
                    <br><hr>
                
                </div>
                <div class="row">
                    <h3 class="font-purple oneLine">총 금액</h3>
                    <h3 class="oneLine">&nbsp;30,000원</h3>
                </div>
                <div class="row center ">
                    <button class="w-49 form-btn small neutral">장바구니</button>
                    <button class="w-49 form-btn small positive"><a href="#">구매하기</a></button>
                </div>
                
            </div>
        </div>
    </div>
    <!-- 구매하기 버튼 이후부터 -->

    <!-- 제품상세정보, 후기, 상품구매안내 -->
    <div class="container-1000 ">
        <div class="flex"> 
            <div class="flex-content w-33 center">
                <h3>제품상세정보</h3>
                
            </div>
            <div class="flex-content w-33 center">
                <h3 class="oneLine">후기</h3>
                <h3 class="oneLine font-grey">(150)</h3>
               
            </div>
            <div class="flex-content w-33 center">
                <h3>상품구매안내</h3>
                
            </div>
        </div>
    </div>
    <div class="container-1000 flex">
        <hr class="w-30">
        <hr class="w-30">
        <hr class="w-30">
    </div>

    <div class="container-1000">
        <div class="row center">
            <button class="w-90 form-btn small positive">상세정보 펼쳐 보기</button>
        </div>
    </div>

    <!-- 상세정보  -->



    <!-- 제품상세정보, 후기, 상품구매안내 -->
    <div class="container-1000 ">
        <div class="flex"> 
            <div class="flex-content w-33 center">
                <h3>제품상세정보</h3>
                
            </div>
            <div class="flex-content w-33 center">
                <h3 class="oneLine">후기</h3>
                <h3 class="oneLine font-grey">(150)</h3>
               
            </div>
            <div class="flex-content w-33 center">
                <h3>상품구매안내</h3>
                
            </div>
        </div>
    </div>
    <div class="container-1000 flex">
        <hr class="w-30">
        <hr class="w-30">
        <hr class="w-30">
    </div>
    <!-- 리뷰 별점 및 차트 -->
    <div class="container-1000 flex">
        <div class="w-40 center">
            <div class="star-box">
                <h4 class="font-purple oneLine">4.0</h4>
                <h4 class="font-lightgrey oneLine">&nbsp/ 5</h4><br>
                <h4 class="fas fa-star font-purple "></h4>
                <h4 class="fas fa-star font-purple "></h4>
                <h4 class="fas fa-star font-purple "></h4>
                <h4 class="fas fa-star font-purple "></h4>
                <h4 class="fas fa-star font-purple "></h4>
            </div>
        </div>
        <div class="w-65 flex ms-10 ">
            <!-- 리뷰 평 -->
            <div class="w-20">
                <h5 class="font-boldgrey chart-font">아주 좋아요</h5>
                <h5 class="font-boldgrey chart-font">좋아요</h5>
                <h5 class="font-boldgrey chart-font">보통이에요</h5>
                <h5 class="font-boldgrey chart-font">그저 그래요</h5>
                <h5 class="font-boldgrey chart-font">별로에요</h5>
                
            </div>
            <!-- 차트 -->
            <div class="w-75">
                <div class="chart">
                    <div class="bar w-50"></div> 
                    <div class="bar w-60"></div> 
                    <div class="bar w-70"></div> 
                    <div class="bar w-80"></div> 
                    <div class="bar w-90"></div> 
                </div>
            </div>
            <!-- 리뷰수-->
            <div class="w-5">
                <h5 class="font-boldgrey chart-font">50</h5>
                <h5 class="font-boldgrey chart-font">60</h5>
                <h5 class="font-boldgrey chart-font">70</h5>
                <h5 class="font-boldgrey chart-font">80</h5>
                <h5 class="font-boldgrey chart-font">90</h5>
            </div>
        </div>
    </div>

    <!-- 리뷰 작성하기  -->
    <div class="container-1000">
        <div class="row center">
            <div class="font-warning left">제품 구매 이력 있을 시에만 나타남</div>
            <button class="form-btn w-95  neutral small">리뷰 작성하기</button>
        </div>
        <div class="flex">
            <div class="w-75"></div>
            <div class="flex-remain">
                <h5 class="font-boldgrey ms-10">최신순  | 별점 높은 순 | 별점 낮은 순</h5>
            </div>
        </div>
        
        <!-- 리뷰 칸 -->

        <div class="container-1000">
            <div class="row left">
                <!-- 리뷰 예시 1-->
                <h2>testa***</h2>
                <div class="flex">
                    <div class="w-80">
                        <div class="fas fa-star font-purple "></div>
                        <div class="fas fa-star font-purple "></div>
                        <div class="fas fa-star font-purple "></div>
                        <div class="fas fa-star font-purple "></div>
                        <div class="fas fa-star font-purple "></div>
                        <div class="font-boldgrey oneLine">아주 좋아요</div>

                    </div>
                    <div class="flex-remain  font-boldgrey flex">
                        <div class="w-20 font-purple">수정</div>
                        <div class="w-5 font-grey">|</div>
                        <div class="w-30 font-grey">삭제</div>
                        <div class="flex-remain">
                        2022-02-25</div>
                    </div>
                </div>
                <div class="row font-boldgrey">
                    사용해보니 좋아요 강추합니다.사용해보니 좋아요 강추합니다.사용해보니 좋아요 강추합니다.
                    사용해보니 좋아요 강추합니다.사용해보니 좋아요 강추합니다.사용해보니 좋아요 강추합니다.
                    사용해보니 좋아요 강추합니다.사용해보니 좋아요 강추합니다.사용해보니 좋아요 강추합니다.
                    사용해보니 좋아요 강추합니다.사용해보니 좋아요 강추합니다.사용해보니 좋아요 강추합니다.
                    사용해보니 좋아요 강추합니다.사용해보니 좋아요 강추합니다.사용해보니 좋아요 강추합니다.
                    사용해보니 좋아요 강추합니다.사용해보니 좋아요 강추합니다.
                    
                </div>
                <!-- 리뷰 예시 1-->
                <h2>testb***</h2>
                <div class="flex">
                    <div class="w-80">
                        <div class="fas fa-star font-purple "></div>
                        <div class="fas fa-star font-purple "></div>
                        <div class="fas fa-star font-purple "></div>
                        <div class="fas fa-star font-purple "></div>
                        <div class="fas fa-star font-white "></div>
                        <div class="font-boldgrey oneLine">좋아요</div>

                    </div>
                    <div class="flex-remain right font-boldgrey">
                        2022-02-26
                    </div>
                </div>
                <div class="row font-boldgrey">
                    부모님 사드렸는데, 드시고 슈퍼맨, 원더우먼이 되셨어요부모님 사드렸는데, 드시고 슈퍼맨, 원더우먼이 되셨어요부모님 사드렸는데, 드시고 슈퍼맨, 원더우먼이 되셨어요
                    부모님 사드렸는데, 드시고 슈퍼맨, 원더우먼이 되셨어요부모님 사드렸는데, 드시고 슈퍼맨, 원더우먼이 되셨어요부모님 사드렸는데, 드시고 슈퍼맨, 원더우먼이 되셨어요
                    부모님 사드렸는데, 드시고 슈퍼맨, 원더우먼이 되셨어요부모님 사드렸는데, 드시고 슈퍼맨, 원더우먼이 되셨어요부모님 사드렸는데, 드시고 슈퍼맨, 원더우먼이 되셨어요
                    부모님 사드렸는데, 드시고 슈퍼맨, 원더우먼이 되셨어요부모님 사드렸는데, 드시고 슈퍼맨, 원더우먼이 되셨어요부모님 사드렸는데, 드시고 슈퍼맨, 원더우먼이 되셨어요

                </div>
            </div>
        </div>

        <!-- 리뷰 칸 -->

        <div class="row center">
            <div class="font-warning left">리뷰 개수 3개 이상일때만 보임</div>
            <button class="form-btn w-95 positive small">리뷰 모두 보기</button>
        </div>
        

        <div class="container-1000 ">
            <div class="flex"> 
                <div class="flex-content w-33 center">
                    <h3>제품상세정보</h3>
                    
                </div>
                <div class="flex-content w-33 center">
                    <h3 class="oneLine">후기</h3>
                    <h3 class="oneLine font-grey">(150)</h3>
                   
                </div>
                <div class="flex-content w-33 center">
                    <h3>상품구매안내</h3>
                </div>
            </div>
        </div>

        <div class="container-1000">
            <div class="row">
                <h3 class="font-boldgrey">배송안내</h3>
                <br>
            </div>
            <div class="row">
                <h4 class="font-grey">배송은 </h4>
            </div>
        </div>
    
    </div>
</body>

</html>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>


