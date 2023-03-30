<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<style>
	
    </style>
    <!-- �����ּ� api -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/static/js/find-address.min.js"></script>
	<!-- �����ּ� api -->
	
	<script type="text/javascript">
    $(function(){
		
        //�ּ� 
        $(".address-btn").click(function(){
                   
            new daum.Postcode({ 
                oncomplete: function(data) {
                   
                    var addr = ''; 
                    var extraAddr = ''; 
                   
                    if (data.userSelectedType === 'R') { 
                        addr = data.roadAddress;
                    } else { 
                        addr = data.jibunAddress;
                    }
                    
                    document.querySelector("[name=orderPost]").value = data.zonecode;
                    document.querySelector("[name=orderBasicAddr]").value = addr;
                    document.querySelector("[name=orderDetailAddr]").focus();
                }
                }).open();
        
    		});
 
        
       //üũ�ڽ� ���ý�
		var checkboxes = document.getElementsByName("option");
		let prevChecked = null;
	
		for (let i = 0; i < checkboxes.length; i++) {
		  checkboxes[i].addEventListener("click", function() {
		    if (prevChecked !== null && prevChecked !== this) {
		      prevChecked.checked = false;
		    }
		    if (this.checked) {
		      prevChecked = this;
		    } else {
		      prevChecked = null;
		    }
		  });
		}
    });
    </script>
    
    
</head>
<body test>
 <div class="container-1000">
  <form action="/order/buy" method="post">
        <div class="flex">
            <div class=" w-70 pt-20">
                <p><h2>�ֹ���ǰ</h2></p>
            <c:forEach var="productInfoDao" items="${productInfo}" varStatus="status">
                <div class="row flex">
                    	<img src="https://picsum.photos/100/100" class="pe-20">
                		<input hidden type="number" name="productNo" value="${productInfoDao.productNo}">
						<input hidden type="number" name="productPrice" value="${productInfoDao.productPrice}">
						
										
						<label>��ǰ�̸�: ${productInfoDao.productName}</label>
						<label>�귣���: ${productInfoDao.productBrand}</label>		
						<label>��ǰ����: ${productInfoDao.productPrice}</label>
						
						
						
                </div>
               </c:forEach>
                <div class="row left">
                   	<div class="flex"> 
                   	<h2 class="w-80">�����</h2>
                   	 �ֹ��� ���� ��������<input type="checkbox" class="post-check w-10"> </div> 
                    <div class="row">
                        <p>�޴»��</p>
                        <input type="text" class="form-input light w-100 medium" name="orderRecever">
                    </div>

                    <div class="row">
                        <p>����ó</p>
                        <input type="text" class="form-input light w-100 medium" name="orderReceivePhone">
                    </div>

                    <div class="row">
                        <p>�ּ�</p>
                        <input type="text" class="form-input light medium w-50" name="orderPost" placeholder="�����ȣ">
                        <button class="form-btn medium positive address-btn" type="button">�����ȣã��</button>
                    </div>

                    <div class="row">
                        <p></p>
                        <input type="text" class="form-input light medium w-100" name="orderBasicAddr" placeholder="�⺻�ּ�" readonly>
                    </div>

                    <div class="row">
                        <input type="text" class="form-input light medium w-100" name="orderDetailAddr" placeholder="���ּ�">
                    </div>

                    <div class="row">
                        <p>��ۿ�û����</p>
                        <input type="text" class="form-input light medium w-100" id="orderRequest">
                    </div>
                </div>
                </div>

           
            
            <div class="orderscroll w-30">
                <div>
                    
                    <p><h2>��������</h2></p>
                    <p><label>������</label></p>
                    <input type="text" class="form-input medium light" name="orderUserPoint" value="0" min="0">
                    <button class="form-btn positive medium" type="button">����</button>
                    <p class="right">���� ������: <span>3000��</span></p>
                    <div class="row abc">
                        <label>��ǰ�ݾ�: <span>3000��</span></label>
                        <div>
                            <label>��ۺ� : <span class="right">1000</span></label>
                        </div>
                        <div> 
                            <label>������ : <span class="right">1000��</span></label>
    
                        </div>
                        <div>
                            <label>�� �����ݾ� : <span class="right">0��</span></label>
                        </div>
                    </div>
                    <h2>��������</h2>
                    <div>
                        <input type="checkbox" name="option" > �ſ� / üũī��
                    </div>
    
                    <div>
                        <input type="checkbox" name="option" > ������ �Ա�
                    </div>
                    <div>
                        <input type="checkbox" name="option" > ����ũ�� (�ǽð� ������ü)
                    </div>
                    <div>
                        <input type="checkbox" name="option" > �޴��� ����
                    </div>
    
                    <div>
                        <button class="form-btn positive large w-100" type="submit" >�����ϱ�</button>
                    </div>
                </div>
            </div>
            
       </div>     
	</form>
    </div>


</body>
</html>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>