$(document).ready(function () {
    var headerheight = $('header').height();
    var navheight = $('#navigation').height();

    $(window).on('scroll',function() {
      var scrolltop = $(this).scrollTop();
      if(scrolltop >= headerheight) {
        $('#navigation').addClass('sticky');
        $('.tab-content').addClass('sticky-content');
      } else {
        // $('.banner').show();
        $('#navigation').removeClass('sticky');
        $('.tab-content').removeClass('sticky-content');
      }
	});

    var imgs=images
    $('header').css({'background-image': 'url(img/' + imgs[Math.floor(Math.random() * imgs.length)] + ')'});

    // rotating title
    var titles = [
      ["Polyglot Notebook"],
      ["Workflow System"],
    ];
    var holder = $("#rotating_title");
    var currentIndex = 0;
    function rotate() {
      holder.html(titles[currentIndex][0]);
      currentIndex = (currentIndex + 1) % titles.length;
      setTimeout(rotate, 2000);
    }

    rotate();
});
