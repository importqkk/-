window.addEventListener("load", function(){
    var options = {
        field: document.querySelector('.date-picker'),
        format: "YYYY-MM-DD",   // 날짜 형식
        maxDate: moment()
    }
    var picker = new Lightpick(options);
});