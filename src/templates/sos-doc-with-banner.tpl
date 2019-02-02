{%  extends 'sos-doc' %}


{% block html_head %}
<meta name="viewport" content="width=device-width, initial-scale=1">
{{ super() }}
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
h1::before, h2::before, h3::before, h4::before, h5::before, h6::before {
    display: block;
    content: " ";
    height: 80px;
    margin-top: -80px;
    visibility: hidden;
}



.nav-tabs {
    font-family: "Source Sans Pro", sans-serif;
    font-size: 12pt;
    font-weight: normal;
    font-style: normal;
    background: #ffffff;
    text-shadow: none !important;
    border-color: transparent;
    border-bottom-color: rgba(180,180,180,.30);
}

.nav-tabs > li > a:hover {
 color: #2f2f2f;
 background-color: rgba(180,180,180,.14);
}
.nav-tabs > li > a:active,
.nav-tabs > li > a:focus,
.nav-tabs > li.active > a,
.nav-tabs > li.active > a:focus,
.nav-tabs > li.active > a:hover,
.nav-tabs > li.active > a,
.nav-tabs > li.active > a:hover,
.nav-tabs > li.active > a:focus {
 color: #1c1c1c;
 background-color: #eeeeee;
 border: 1px solid transparent;
 border-bottom-color: transparent;
 cursor: default;
}
.nav > li > a:hover,
.nav > li > a:focus {
 text-decoration: none;
 background-color: rgba(180,180,180,.14);
}

.nav-tabs > li {
    float:none;
    display:inline-block;
}

.nav-tabs {
    text-align:center;
}

.nav-tabs li a {font-size:14px; text-transform: uppercase; }

.sticky .nav {
  background-color: black;
}
.sticky .nav-tabs li a {
    color: white;
}
.sticky .nav-tabs li.active a {
    color: black;
}

.sticky .nav-tabs li.active .toc a {
    text-transform: none;
}

.sticky {
  position: fixed;
  top: 0;
  left:0;
  width: 100%;
  z-index:100;
}

#toc_panel {
    display: none;
    left: 0;
    width: 100%;
    z-index: 100;
    background-color: black;
    color: white;
    padding-top: 20px;
}

#toc_panel a {
    color: white;
}

#toc_panel code {
    color: white;
    background: none;
}

#toc_panel li:hover {
    background: gray;
}

#toc_panel li a:hover {
    text-decoration: none;
}

#toc_panel ul {
    padding-left: 0px;
    list-style: none;
}

.toc-wrapper {
    margin-top: 100px;
}

.toc-header {
    background-color: #c3dbf7;
    height: 60px;
}

.toc-header .nav-home {
    float: left;
    padding-left: 20px;
}
.toc-header .nav-buttons {
    float: right;  
    padding-right: 30px;      
}
.toc-header .nav-buttons .fa {
    padding-top: 10px;
    padding-bottom: 10px;
}
.toc-header .fa {
    font-size: 38px;
    color: white;
    padding: 10px;
}

.toc-header .fa:hover {
    color: #6197d5 ;
}
</style>

{% endblock html_head %}

{% block body %}
    <div id="exTab2" class="container">
        <a name="content"></a>
        <nav id="navigation" class="sticky">
            <ul class="nav nav-tabs">
                <li><a href="../../index.html#content">Introduction</a> </li>
                <li><a href="../../running.html#content">Running SoS</a> </li>
                <li><a href="../../notebook.html#content">SoS Notebook</a> </li>
                <li><a href="../../workflow.html#content">SoS Workflow System</a> </li>
                <li><a href="#" onclick="toggle_toc()">User Guide &nbsp; <i class="fa fa-caret-down" id="toggle_caret"></i> </a>  </li>
            </ul>
            <div id="toc_panel">
                <div class="container row-fluid">
                <div class="col-xs-12 col-sm-4 col-md-3">
                    <p>SoS Notebook</p>
                    <ul>
                        <li><a href="multi_kernel_notebook.html">Use of SoS notebook</a></li>
                        <li><a href="expand_capture_render.html">Work with subkernel</a></li>
                        <li><a href="exchange_variable.html">Data exchange among kernels</a></li>
                        <li><a href="magic_preview.html">Preview variables and files</a></li>
                    </ul>                
                </div>
                <div class="col-xs-12 col-sm-4 col-md-3">
                    <p>Workflow Basics</p>
                    <ul>
                        <li><a href="sos_in_notebook.html">Basic usages</a></li>
                        <li><a href="scripts_in_sos.html">Inclusion of scripts</a></li>
                        <li><a href="parameters.html">Parameters</a></li>
                        <li><a href="input_substeps.html">Step and substeps</a></li>
                        <li><a href="forward_workflow.html">Basic workflow</a></li>
                    </ul>            
                </div>
                <div class="col-xs-12 col-sm-4 col-md-3">
                    <p>Workflow Definition</p>
                    <ul>                
                        <li><a href="input_statement.html"><code>input</code> statement</a></li>
                        <li><a href="output_statement.html"><code>output</code> statement</a></li>
                        <li><a href="depends_statement.html"><code>depends</code> statement</a></li>
                        <li><a href="named_output.html"><code>named_output()</code></a></li>
                        <li><a href="output_from.html"><code>output_from()</code></a></li>                        
                    </ul>                    
                </div>
                <div class="col-xs-12 col-sm-4 col-md-3">
                    <p>Workflow Execution</p>
                    <ul>
                        <li><a href="signature.html">Runtime signature</a></li>
                        <li><a href="trace_dependency.html">Dependency tracing</a></li>
                        <li><a href="workflow_summary.html">Workflow report</a></li>                    
                        <li><a href="https://vatlab.github.io/sos-docs/guide.html#content">A lot more ...</a></li>                    
                    </ul>                       
                </div>            
            </div>
        </nav>
    </div>
    

    {{ super() }}

    <script src="../../js/docs.js"></script>
    <script>
    function toggle_toc() {
        let item = document.getElementById('toggle_caret');
        let expand = item.classList.contains('fa-caret-down');
        let panel = document.getElementById('toc_panel');
        if (expand) {
            item.classList.remove('fa-caret-down');
            item.classList.add('fa-caret-up');
            panel.style.display = 'block'
        } else {
            item.classList.remove('fa-caret-up');
            item.classList.add('fa-caret-down');
            panel.style.display = 'none'
        }
    }

    function add_nav_header(filename) {
        let header = document.getElementsByClassName('toc-header');
        if (!header) {
            return;
        }
        let idx = guides.indexOf(filename.replace(/\.[^/.]+$/, ""))
        let prev_link = ''
        let next_link = ''
        if (idx != 0) {
            // has prev
            prev_link = `${guides[idx - 1]}.html`
        }
        if (idx != guides.length - 1) {
            // has next
            next_link = `${guides[idx + 1]}.html`
        } 
        if (prev_link) {
            prev_link = `<a href="${prev_link}" target="_blank"><i class="fa fa-arrow-circle-left nav-left"></i></a>`;
        }
        if (next_link) {
            next_link = `<a href="${next_link}" target="_blank"><i class="fa fa-arrow-circle-right nav-right"></i></a>`;
        }
        header[0].outerHTML = `
            <div class="toc-header">
                <div class="row">
                    <div class="nav-home">
                        <a href="https://vatlab.github.io/sos-docs/guide.html#content" target="_blank"><i class="fa fa-home"></i></a>
                    </div>
                    <div class="nav-buttons">                    
                            ${prev_link}
                            ${next_link}                            
                    </div>
                </div>
            </div>       
        `
    }

    let url = window.location.pathname;
    let filename = url.substring(url.lastIndexOf('/')+1);
    add_nav_header(filename);

    </script>
{% endblock body %}

