{%- extends 'full.tpl' -%}
{%- block header -%}
<!DOCTYPE html>
<html>
<head>
{%- block html_head -%}
<meta charset="utf-8" />
{% set nb_title = nb.metadata.get('title', '') or resources['metadata']['name'] %}
<title>{{nb_title}}</title>

{%- if "widgets" in nb.metadata -%}
<script src="https://unpkg.com/jupyter-js-widgets@2.0.*/dist/embed.js"></script>
{%- endif-%}

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>

{% for css in resources.inlining.css -%}
    <style type="text/css">
    {{ css }}
    </style>
{% endfor %}

<style type="text/css">
/* Overrides of notebook CSS for static HTML export */
body {
  overflow: visible;
  padding: 8px;
}
div#notebook {
  overflow: visible;
  border-top: none;
}
{%- if resources.global_content_filter.no_prompt-%}
div#notebook-container{
  padding: 6ex 12ex 8ex 12ex;
}
{%- endif -%}
@media print {
  div.cell {
    display: block;
    page-break-inside: avoid;
  } 
  div.output_wrapper { 
    display: block;
    page-break-inside: avoid; 
  }
  div.output { 
    display: block;
    page-break-inside: avoid; 
  }
}
</style>

<!-- Custom stylesheet, it must be in the same directory as the html file -->
<link rel="stylesheet" href="custom.css">

<!-- Loading mathjax macro -->
{{ mathjax() }}
{%- endblock html_head -%}
</head>


<!-- Global Site Tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-107286198-1"></script>
<script>
   window.dataLayer = window.dataLayer || [];
   function gtag(){dataLayer.push(arguments)};
   gtag('js', new Date());
   
   gtag('config', 'UA-107286198-1');
</script>


<meta name="viewport" content="width=device-width, initial-scale=1">




<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.38.0/codemirror.css">
  
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Droid+Sans:400,700" rel="stylesheet">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
<style>  /* defined here in case the main.css below cannot be loaded */
   .lev1 {margin-left: 80px}
   .lev2 {margin-left: 100px}
   .lev3 {margin-left: 120px}
   .lev4 {margin-left: 140px}
   .lev5 {margin-left: 160px}
   .lev6 {margin-left: 180px}
</style>
<link rel="stylesheet" type="text/css" href="../../css/jt.css">
<link rel="stylesheet" type="text/css" href="../../css/toc2.css">
<script src="../../js/doc_toc.js"></script>
<script src="../../js/docs.js"></script>
<script>
   MathJax.Hub.Config({
       "HTML-CSS": {
           preferredFont: "TeX",
           availableFonts: ["STIX","TeX"],
           styles: {
               scale: 110,
               ".MathJax_Display": {
                   "font-size": "110%",
               }
           }
       }
   });
</script>
<script>
   function filterDataFrame(id) {
       var input = document.getElementById("search_" + id);
       var filter = input.value.toUpperCase();
       var table = document.getElementById("dataframe_" + id);
       var tr = table.getElementsByTagName("tr");
   
       // Loop through all table rows, and hide those who don't match the search query
       for (var i = 1; i < tr.length; i++) {
           for (var j = 0; j < tr[i].cells.length; ++j) {
               var matched = false;
               if (tr[i].cells[j].innerHTML.toUpperCase().indexOf(filter) != -1) {
                   tr[i].style.display = "";
                   matched = true
                   break;
               }
               if (!matched)
                   tr[i].style.display = "none";
           } 
       }
   }
   
   function sortDataFrame(id, n, dtype) {
       var table = document.getElementById("dataframe_" + id);
   
       var tb = table.tBodies[0]; // use `<tbody>` to ignore `<thead>` and `<tfoot>` rows
       var tr = Array.prototype.slice.call(tb.rows, 0); // put rows into array
   
       if (dtype === 'numeric') {
           var fn = function(a, b) { 
               return parseFloat(a.cells[n].textContent) <= parseFloat(b.cells[n].textContent) ? -1 : 1;
           }
       } else {
           var fn = function(a, b) {
               var c = a.cells[n].textContent.trim().localeCompare(b.cells[n].textContent.trim()); 
               return c > 0 ? 1 : (c < 0 ? -1 : 0) }
       }
       var isSorted = function(array, fn) {
           if (array.length < 2)
               return 1;
           var direction = fn(array[0], array[1]); 
           for (var i = 1; i < array.length - 1; ++i) {
               var d = fn(array[i], array[i+1]);
               if (d == 0)
                   continue;
               else if (direction == 0)
                   direction = d;
               else if (direction != d)
                   return 0;
               }
           return direction;
       }
   
       var sorted = isSorted(tr, fn);
   
       if (sorted == 1 || sorted == -1) {
           // if sorted already, reverse it
           for(var i = tr.length - 1; i >= 0; --i)
               tb.appendChild(tr[i]); // append each row in order
       } else {
           tr = tr.sort(fn);
           for(var i = 0; i < tr.length; ++i)
               tb.appendChild(tr[i]); // append each row in order
       }
   }
   
   $( document ).ready(function(){
   
               var cfg={'threshold':{{ nb.get('metadata', {}).get('toc', {}).get('threshold', '3') }},     // depth of toc (number of levels)
                // 'number_sections': {{ 'true' if nb.get('metadata', {}).get('toc', {}).get('number_sections', False) else 'false' }},  // sections numbering
                'number_sections': false, 
                'toc_cell': false,          // useless here
                'toc_window_display': true, // display the toc window
                "toc_section_display": "block", // display toc contents in the window
                // 'sideBar':{{ 'true' if nb.get('metadata', {}).get('toc', {}).get('sideBar', False) else 'false' }},      
                'sideBar':true,       // sidebar or floating window
                'navigate_menu':false       // navigation menu (only in liveNotebook -- do not change)
               }
   
               var st={};                  // some variables used in the script
               st.rendering_toc_cell = false;
               st.config_loaded = false;
               st.extension_initialized=false;
               st.nbcontainer_marginleft = $('#notebook-container').css('margin-left')
               st.nbcontainer_marginright = $('#notebook-container').css('margin-right')
               st.nbcontainer_width = $('#notebook-container').css('width')
               st.oldTocHeight = undefined
               st.cell_toc = undefined;
               st.toc_index=0;
   
               // fire the main function with these parameters
   
   
   
               table_of_contents(cfg,st);
   
               var file=documentationDict[$("h1:first").attr("id")];
               var path="http://vatlab.github.io/sos-docs"
               $("#toc-level0 a").css("color","#126dce");
               $('a[href="#'+$("h1:first").attr("id")+'"]').hide()
               var docs=documentation;
               var pos=documentation.indexOf(file);
           
               for (var a=pos;a>=0;a--){
                     var name=docs[a]
                     $('<li><a href="'+path+'/doc/documentation/'+name+'.html">'+name.replace(/_/g," ")
                      + '&nbsp ' + '<i class="fa ' +
                         (a === pos ? 'fa-caret-down' : 'fa-caret-right') + '"></i>' +'</a></li>').insertBefore("#toc-level0 li:eq(0)");
               }
               $('a[href="'+path+'/doc/documentation/'+file+'.html'+'"]').css("color","#126dce");
   
   
               for (var a=pos+1;a<docs.length;a++){
                     var name=docs[a]
                     $(".toc #toc-level0").append('<li><a href="'+path+'/doc/documentation/'+name+'.html">'+name.replace(/_/g," ")
                       + '&nbsp' + '<i class="fa fa-caret-right"></i>' +'</a></li>');
               }
   
               // var docs=documentation
               // for (var a =0;a<docs.length;a++){
               //       var name =docs[a];
               //       $(".toc #toc-level0").append('<li><a href="'+path+'/doc/documentation/'+name+'.html">'+name.split("_").join(" ")+'</a></li>');
               // }
               // var home=$("#toc-level0 #indexHome");
             
               // home.insertBefore("#toc-level0 li:eq(0)");
   
               // $("#toc-level0 li").filter(".home").insertBefore($("#toc-level0 li").filter(':nth-child(1)'));
               // $("#toc").attr("style","max-height:938px")
   
   
       });
</script>
{%- if nb['metadata'].get('sos',{}).get('kernels',none) is not none -%}
<style>  /* defined here in case the main.css below cannot be loaded */
   {% for item in nb['metadata'].get('sos',{}).get('kernels',{}) %}
   {%- if item[2] -%}
   .lan_{{item[0]}} .input_prompt { background-color: {{item[3]}} !important }  
   {%- else -%}
   .lan_{{item[0]}} {}
   {%- endif -%}
   {% endfor %}
</style>
{%- endif -%}
{%- endblock header -%}



{% block codecell %}
{%- if cell['metadata'].get('kernel',none) is not none -%}
<div class="cell border-box-sizing code_cell rendered lan_{{cell['metadata'].get('kernel', none)}}">
   {{ super() }}
</div>
{% else %}
   {{ super() }}
{% endif %}
{%- endblock codecell %}


{% block input %}
{%- if cell['metadata'].get('kernel',none) is not none -%}
<div class="inner_cell">
  <div class="input_area">
   <textarea class="sos-source" name="{{cell['metadata'].get('kernel')}}">{{ cell.source }}</textarea>

  </div>
</div>
{% else %}
   {{ super() }}
{%- endif -%}
{%- endblock input %}

{% block body %}

{{ super() }}
      <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.38.0/codemirror.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.38.0/mode/python/python.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.38.0/mode/r/r.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.38.0/mode/octave/octave.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.38.0/mode/ruby/ruby.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.38.0/mode/sas/sas.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.38.0/mode/javascript/javascript.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.38.0/mode/shell/shell.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.38.0/mode/julia/julia.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.38.0/mode/markdown/markdown.js"></script>
	  <script>
	  {% include 'sos-mode.js' %}
	  </script>
      <script>
		   function highlight_cells(cells, i, interval) {
			  console.log(cells[i].name);
			  setTimeout(function() {
				var editor = CodeMirror.fromTextArea(cells[i], {
		           lineNumbers: false,
				   styleActiveLine: true,
		           matchBrackets: true,
				   readOnly: true,
		           mode: 'sos',
				   base_mode: cells[i].name,
		         });
		      if (i < cells.length)
			    highlight_cells(cells, i + 1, interval);
			}, interval);
		  }


	      highlight_cells(document.getElementsByClassName("sos-source"), 0, 100);
		 
	       
      </script>

{% endblock body %}
