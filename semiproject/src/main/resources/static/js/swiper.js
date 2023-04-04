// swiper api
window.addEventListener("load", function(){
	var swiper = new Swiper('.swiper', {
        direction: 'horizontal',
        loop: true,
        pagination: {
            el: '.swiper-pagination',
            type: 'bullets',
            clickable: true,
        },
        autoplay: {
            delay: 5000,
            pauseOnMouseEnter: true,
        }
    });
})