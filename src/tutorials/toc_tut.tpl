{%- extends 'full.tpl' -%}


{%- block header -%}
<!-- Global Site Tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-107286198-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments)};
  gtag('js', new Date());

  gtag('config', 'UA-107286198-1');
</script>

{{ super() }}

<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

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
             // 'number_sections': {{ 'true' if nb.get('metadata', {}).get('toc', {}).get('number_sections', False) else 'false' }},  
             'number_sections': false,  // sections numbering
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


            var file=tutorialsDict[$("h1:first").attr("id")];
            var path="http://vatlab.github.io/SoS"
            $("#toc-level0 a").css("color","#126dce");
            $('a[href="#'+$("h1:first").attr("id")+'"]').hide()
            
            var tuts=tutorials;
            var pos=tutorials.indexOf(file);
        
            for (var a=pos;a>=0;a--){
                  var name=tuts[a]
                  $('<li><a href="'+path+'/doc/tutorials/'+name+'.html">'+name.replace(/_/g," ")+'</a></li>').insertBefore("#toc-level0 li:eq(0)");
            }
            $('a[href="'+path+'/doc/tutorials/'+file+'.html'+'"]').css("color","#126dce");

            for (var a=pos+1;a<tuts.length;a++){
                  var name=tuts[a]
                  $(".toc #toc-level0").append('<li><a href="'+path+'/doc/tutorials/'+name+'.html">'+name.replace(/_/g," ")+'</a></li>');
            }

            // for (var a =0;a<tuts.length;a++){
            //       var name =tuts[a];
            //       if ()
            //       $(".toc #toc-level0").append('<li><a href="'+path+'/doc/tutorials/'+name+'.html">'+name.replace("_"," ")+'</a></li>');
            // }

            // $(".toc #toc-level0").append('<li id="indexHome"><a href="'+path+'/index.html"><b>Home<b></a></li>');
            // var home=$("#toc-level0 #indexHome");
          
            // home.insertBefore("#toc-level0 li:eq(0)");

            
            // $(".number_sections-btn").hide();
            // $(".toc_cell_sections-btn".hide();


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
{%- else -%}
	{{ super() }}
{%- endif -%}

{%- endblock codecell %}
