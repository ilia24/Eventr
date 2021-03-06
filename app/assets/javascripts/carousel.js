$(function() {
  $('.owl-carousel').owlCarousel({
    stagePadding: 100,
    loop:true,
    margin:0,
    nav:true,
    navText: ['<i class="fa fa-angle-left fa-3x" aria-hidden="true"></i>','<i class="fa fa-angle-right fa-3x" aria-hidden="true"></i>'],
    center:true,
    autoWidth:true,
    autoHeight:true,
    autoplay:true,
    autoplayTimeout:4000,
    autoplayHoverPause:true,
    responsive:{
        0:{
            items:1
        },
        600:{
            items:1
        },
        1000:{
            items:1
        }
    }
  })
});
