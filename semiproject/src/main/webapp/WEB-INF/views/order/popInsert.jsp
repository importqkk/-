<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
        
        #request {
            margin-bottom: 10px;
        }

        #etc-text {
            display: block;
        }
    </style>
    <script type="text/javascript">
           
        
        $(function( ){
            $("#request").on("change", function(){
                var selectedValue = $(this).val();
                // ���õ� ���� "etc"�� ���, �ؽ�Ʈ ������ ��Ÿ���ϴ�.
                if(selectedValue === "etc"){
                    $("#etc-text").show();
                }else{
                    $("#etc-text").hide();
                 }
            });
        });
    </script>

</head>
<body>
    <div>
        <div>
            <div>
                <h2>�űԹ����</h2>
              </div>
        </div>
        <div>
            <div><label>������</label> <input type="text"></div>
            <div>
                <label>�޴���ȭ</label> <input type="text">
            </div>

            <div>
                <label>�ּ�</label>
                <input type="text"> <button>�˻�</button>
            </div>
            <div>
                <input type="text">
            </div>
            <div>
                <input type="text">
            </div>

            <div>
                ��û����
                <select name="request" id="request">
                    <option value="���� �� ���ǿ� �ð��ּ���">���� �� ���ǿ� �ð��ּ���</option>
                    <option value="���� �� �ù��Կ� �־��ּ���">���� �� �ù��Կ� �־��ּ���</option>
                    <option value="���� �� �� �տ� ���ּ���">���� �� �� �տ� ���ּ���</option>
                    <option value="��� �� ���� �ٶ��ϴ�">��� �� ���� �ٶ��ϴ�</option>
                    <option value="�ļ��� ������ �ִ� ��ǰ�Դϴ�. ��� �� ������ �ּ���.">�ļ��� ������ �ִ� ��ǰ�Դϴ�. ��� �� ������ �ּ���.</option>
                    <option value="etc">�����Է�</option>
                    <textarea name="etc-text" id="etc-text" cols="57" rows="5" style="display:none"></textarea>
                </select>
            </div>
        </div>
    </div>
</body>
</html>