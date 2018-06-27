$(document).ready(function () {

    $("#intro_content").load("Overview.html");
    $("#features_content").load("Features.html");
    $("#installation_content").load("Running_SoS.html");
    $("#notebook_documentation_content").load("Notebook_Documentation.html");
    $("#workflow_documentation_content").load("Workflow_Documentation.html");
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

      $("#navigation li a ").click(function(){
          var tabindex=$(this).attr('href');
          $('#navigation li a').filter('[href="'+tabindex+'"]').tab('show');
          $('html,body').scrollTop(headerheight + navheight);
          if ($('#toc_Running_SoS').length > 0) {
            $('#toc_Running_SoS').detach().appendTo('#dropdown_runningsos');
          }
          if ($('#toc_Notebook_Documentation').length > 0) {
            $('#toc_Notebook_Documentation').detach().appendTo('#dropdown_notebook_documentation');
          }
          if ($('#toc_Workflow_Documentation').length > 0) {
            $('#toc_Workflow_Documentation').detach().appendTo('#dropdown_workflow_documentation');
          }
      })

      $('#exTab2').tabs({});
      $("#introduction").fadeIn();

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
