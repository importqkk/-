<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
    </style>
    <script type="text/javascript">
 	
    
 
    </script>
    
</head>
<body test>
 <div class="container-1000">
        <div class="flex">
            <div class=" w-60 pt-20">
                <p><h2>�ֹ���ǰ</h2></p>
                
                <div class="row flex">
                    <img src="https://picsum.photos/100/100" class="pe-20">
                    <div class="row-medium flex">
	                	<span hidden class="productNo">${cartProductInfoDto.productNo}</span> <%-- ��ǰ��ȣ(����) --%>
	                    <h4 class="me-5 c-b80">[${cartProductInfoDto.productBrand}]</h4>	<%-- �귣��� --%>
	                    <span class="c-b80">${cartProductInfoDto.productName}</span>	<%-- ��ǰ�� --%>
	                </div>
                </div>
                <div class="row left">
                    <p><h2>�����</h2></p>
                    <div class="row">
                        <p>�޴»��</p>
                        <input type="text" class="form-input light w-100 medium">
                    </div>

                    <div class="row">
                        <p>����ó</p>
                        <input type="text" class="form-input light w-100 medium">
                    </div>

                    <div class="row">
                        <p>�̸���</p>
                        <input type="text" class="form-input light medium w-100 ">
                    </div>

                    <div class="row">
                        <p>�ּ�</p>
                        <input type="text" class="form-input light medium w-50" placeholder="�����ȣ">
                        <button class="form-btn medium positive">�����ȣã��</button>
                    </div>

                    <div class="row">
                        
                        <input type="text" class="form-input light medium w-100" placeholder="�⺻�ּ�" readonly>
                    </div>

                    <div class="row">
                        <input type="text" class="form-input light medium w-100" placeholder="���ּ�">
                    </div>

                    <div class="row">
                        <p>��ۿ�û����</p>
                        <input type="text" class="form-input light medium w-100">
                    </div>
                </div>

            </div>
            <div class="orderscroll w-30">
                <div>
                    
                    <p><h2>��������</h2></p>
                    <p><label>������</label></p>
                    <input type="text" class="form-input medium light">
                    <button class="form-btn positive medium">����</button>
                    <p class="right">���� ������: <span>3000��</span></p>
                    <div class="row abc">
                        <label>��ǰ�ݾ�: <span>3000��</span></label>
                        <div>
                            <label>��ۺ� : <span class="right">${productDto.productdeliveryprice}</span></label>
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
                        <input type="checkbox"> �ſ� / üũī��
                    </div>
    
                    <div>
                        <input type="checkbox"> ������ �Ա�
                    </div>
                    <div>
                        <input type="checkbox"> ����ũ�� (�ǽð� ������ü)
                    </div>
                    <div>
                        <input type="checkbox"> �޴��� ����
                    </div>
    
                    <div>
                        <button class="form-btn positive large w-100">�����ϱ�</button>
                    </div>
                </div>
            </div>
            
           

    </div>
</div>

</body>
</html>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>