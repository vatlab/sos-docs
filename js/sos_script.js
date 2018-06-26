$(document).ready(function () {
	$("#intro_content").load("Overview.html");
	$("#features_content").load("Features.html");
	$("#installation_content").load("Running_SoS.html");
	$("#notebook_documentation_content").load("Notebook_Documentation.html");
	$("#workflow_documentation_content").load("Workflow_Documentation.html");
	
	// var tuts=tutorials
	// $("#tutorial > .container").append('<div class="row">')
	// for (var a =0;a<tuts.length;a++){
	// 	var name =tuts[a];
	// 	var oneString='<div class="col-md-4 col-sm-6 portfolio-item">'
 //        				+'<div class="portfolio-caption">';
	// 	oneString+='<a href="./doc/tutorials/'+name+'.html" class="portfolio-link"><h4>'+name+'</h4></a>';
	// 	oneString+='</div></div>';       	
	// 	 $("#tutorial > .container").append(
	//        	oneString
	//      );
	// }	
	// $("#tutorial > .container").append('</div>');	


 // 	var docs=documentation
	// $("#documentation > .container").append('<div class="row">')
	// for (var a =0;a<docs.length;a++){
	// 	var name =docs[a];
	// 	var oneString='<div class="col-md-4 col-sm-6 portfolio-item">'
 //        				+'<div class="portfolio-caption">';
	// 	oneString+='<a href="./doc/documentation/'+name+'.html" class="portfolio-link"><h4>'+name+'</h4></a>';
	// 	oneString+='</div></div>';       	
	// 	 $("#documentation > .container").append(
	//        	oneString
	//      );
	// }	
	// $("#documentation > .container").append('</div>');		



	 $(window).on('scroll',function() {
            var scrolltop = $(this).scrollTop();
         
            if(scrolltop >= 600) {
              $('#fixedbar').fadeIn(250);
            }
            
            else if(scrolltop <= 600) {
              $('#fixedbar').fadeOut(250);
            }
          });

	// var tabindex=$("#fixedbar").tabs({active:1}).tabs("option","active");
	// console.log(tabindex);
	// $("#navigation").tabs().tabs("option","active",tabindex);

	  $("#fixedbar li a ").click(function(){
	  		var tabindex=$(this).attr('href');
	  		$('#navigation li a').filter('[href="'+tabindex+'"]').tab('show'); 		
	  })
        
      $("#navigation li a ").click(function(){
	  		var tabindex=$(this).attr('href');
	  		$('#fixedbar li a').filter('[href="'+tabindex+'"]').tab('show'); 		
	  })
	  var imgs=images

      $('header').css({'background-image': 'url(img/' + imgs[Math.floor(Math.random() * imgs.length)] + ')'});

     $('.nav a').click(function (e) {
		  e.preventDefault()
		  $(this).tab('show')
		})  
    
	  // $('a.scroll').on('click', function (e) {
	  //       var href = $(this).attr('href');
	  //       $('html, body').animate({
	  //           scrollTop: $(href).offset().top-50
	  //       }, 'slow');
	  //       e.preventDefault();
	  //  });

	  function activateTab(tab){
    		$('.nav-tabs a[href="' + tab + '"]').tab('show');
	  };

	  var hash = document.location.hash;	
	  // if (hash=="#documentation") {
	  // 		activateTab("#4");
	  // 		$('html, body').stop().animate({
   //          	scrollTop: ($("#exTab2").offset().top - 50)
   //       	}, 'fast');
	  // } else{
	  // 		activateTab(hash)
	  // }
	  activateTab(hash)


	  $('.nav-tabs a').on('shown.bs.tab', function (e) {
    		var id = $(e.target).attr("href").substr(1);
  			window.location.hash = id;

		});

	
});

//var options = [
//    ["Readable"],
//    ["Interactive"],
//    ["Cross-Platform"],
//    ["Cross-Language"],
//    ["Reproducible"]
//];
var options2 = [
    ["Polyglot Notebook"],
    ["Workflow System"],
];

//var interval = 1400;
var interval2 = 2800;

//var holder1 = $(".rotating_words");
var holder2 = $("#rotating_title");
//var currentIndex = 0;
var currentIndex2 = 0;

//function doIt() {
//    holder1.html(options[currentIndex][0]);
//    currentIndex = (currentIndex + 1) % options.length;
//    setTimeout(doIt, interval);
//}

$('#exTab2').tabs();

//doIt();

function doIt2() {
    holder2.html(options2[currentIndex2][0]);
    currentIndex2 = (currentIndex2 + 1) % options2.length;
    setTimeout(doIt2, interval2);
}

doIt2();
