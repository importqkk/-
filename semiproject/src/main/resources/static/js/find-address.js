window.addEventListener("load", function(){
  document.querySelector(".find-address-btn")
          .addEventListener("click", findAddress);

  function findAddress() {
      new daum.Postcode({
          oncomplete: function(data) {
              var addr = ''; 
              var extraAddr = ''; 

       			if (data.userSelectedType === 'R') { 
                  addr = data.roadAddress;
              } else {
                  addr = data.jibunAddress;
              }
              document.querySelector("[name=memberPost]").value = data.zonecode;
              document.querySelector("[name=memberBasicAddr]").value = addr;
              
              document.querySelector("[name=memberDetailAddr]").focus();
          }
      }).open();
  }
});