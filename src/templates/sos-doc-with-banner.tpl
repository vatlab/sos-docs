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
    outline: none;
}

.toc-header .nav-buttons button {
    background: transparent;
    border: none;
}

.toc-header .nav-buttons button:focus {
    outline: 0;
}

.toc-header .fa {
    font-size: 38px;
    color: white;
    padding-top: 8px;
    padding-bottom: 8px;
    padding-left: 10px;
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
                <li><a href="https://vatlab.github.io/sos-docs/index.html#content">Introduction</a> </li>
                <li><a href="https://vatlab.github.io/sos-docs/running.html#content">Running SoS</a> </li>
                <li><a href="https://vatlab.github.io/sos-docs/notebook.html#content">SoS Notebook</a> </li>
                <li><a href="https://vatlab.github.io/sos-docs/workflow.html#content">SoS Workflow System</a> </li>
                <li><a href="#" onclick="toggle_toc();return false;">User Guide &nbsp; <i class="fa fa-caret-down" id="toggle_caret"></i> </a>  </li>
            </ul>
            <div id="toc_panel">
                <div class="container row-fluid">
                <div class="col-xs-12 col-sm-4 col-md-3">
                    <p>SoS Notebook</p>
                    <ul>
                        <li><a href="https://vatlab.github.io/sos-docs/doc/user_guide/multi_kernel_notebook.html">Use of SoS notebook</a></li>
                        <li><a href="https://vatlab.github.io/sos-docs/doc/user_guide/expand_capture_render.html">Work with subkernel</a></li>
                        <li><a href="https://vatlab.github.io/sos-docs/doc/user_guide/exchange_variable.html">Data exchange among kernels</a></li>
                        <li><a href="https://vatlab.github.io/sos-docs/doc/user_guide/magic_preview.html">Preview variables and files</a></li>
                    </ul>
                </div>
                <div class="col-xs-12 col-sm-4 col-md-3">
                    <p>Workflow Basics</p>
                    <ul>
                        <li><a href="https://vatlab.github.io/sos-docs/doc/user_guide/sos_in_notebook.html">Basic usages</a></li>
                        <li><a href="https://vatlab.github.io/sos-docs/doc/user_guide/scripts_in_sos.html">Inclusion of scripts</a></li>
                        <li><a href="https://vatlab.github.io/sos-docs/doc/user_guide/parameters.html">Parameters</a></li>
                        <li><a href="https://vatlab.github.io/sos-docs/doc/user_guide/input_substeps.html">Step and substeps</a></li>
                        <li><a href="https://vatlab.github.io/sos-docs/doc/user_guide/forward_workflow.html">Basic workflow</a></li>
                    </ul>
                </div>
                <div class="col-xs-12 col-sm-4 col-md-3">
                    <p>Workflow Definition</p>
                    <ul>
                        <li><a href="https://vatlab.github.io/sos-docs/doc/user_guide/input_statement.html"><code>input</code> statement</a></li>
                        <li><a href="https://vatlab.github.io/sos-docs/doc/user_guide/output_statement.html"><code>output</code> statement</a></li>
                        <li><a href="https://vatlab.github.io/sos-docs/doc/user_guide/depends_statement.html"><code>depends</code> statement</a></li>
                        <li><a href="https://vatlab.github.io/sos-docs/doc/user_guide/named_output.html"><code>named_output()</code></a></li>
                        <li><a href="https://vatlab.github.io/sos-docs/doc/user_guide/output_from.html"><code>output_from()</code></a></li>
                    </ul>
                </div>
                <div class="col-xs-12 col-sm-4 col-md-3">
                    <p>Workflow Execution</p>
                    <ul>
                        <li><a href="https://vatlab.github.io/sos-docs/doc/user_guide/signature.html">Runtime signature</a></li>
                        <li><a href="https://vatlab.github.io/sos-docs/doc/user_guide/trace_dependency.html">Dependency tracing</a></li>
                        <li><a href="https://vatlab.github.io/sos-docs/doc/user_guide/workflow_summary.html">Workflow report</a></li>
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

    function add_nav_header() {
        let url = window.location.pathname;
        let filename = url.substring(url.lastIndexOf('/')+1);
        let dir = url.substring(url.lastIndexOf('/', url.lastIndexOf('/')-1)+1, url.lastIndexOf('/'));

        if (dir == 'documentation') {
            all_docs = documentation;
        } else if (dir == 'tutorials') {
            all_docs = tutorials;
        } else {
            all_docs = guides;
        }

        let header = document.getElementsByClassName('toc-header');
        if (!header) {
            return;
        }
        let idx = all_docs.indexOf(filename.replace(/\.[^/.]+$/, ""))
        let prev_link = ''
        let next_link = ''
        if (idx != 0) {
            prev_link = `<button onclick="loadPage('${all_docs[idx - 1]}')" ><i class="fa fa-arrow-circle-left nav-left"></i></button>`;
        }
        if (idx != all_docs.length - 1) {
            next_link = `<button onclick="loadPage('${all_docs[idx + 1]}')" ><i class="fa fa-arrow-circle-right nav-right"></i></button>`;
        }
        header[0].outerHTML = `
            <div class="toc-header">
                <div class="row">
                    <div class="nav-home">
                        <a href="https://vatlab.github.io/sos-docs/guide.html#content"><i class="fa fa-home"></i></a>
                    </div>
                    <div class="nav-buttons">
                            ${prev_link}
                            ${next_link}
                    </div>
                </div>
            </div>
        `
    }

    function replacePage(title, url, newdoc, pushState) {
        window.aa = newdoc;
        // step 1, find existing cells
        let nc = document.getElementById('notebook-container');
        nc.innerHTML = '';
        var root = document.createElement("div");
        root.innerHTML = newdoc;
        // let us find notebook-container in the root
        let new_nc = root.querySelector('.notebook-container');

        while (new_nc.childNodes.length > 0) {
            nc.appendChild(new_nc.childNodes[0]);
        }
        // scroll to top
        nc.parentElement.scrollIntoView()

        if (pushState) {
            history.pushState({'title': title, 'url': url}, title, url);
        }
        // update URL
        add_nav_header()
        // nav_header
        tocbot.refresh();
        // CM
        applySoSMode();
    }

    function loadPage(name, pushState=true) {
        let xhr = new XMLHttpRequest();
        let href = window.location.href;
        let base = href.substring(0, href.lastIndexOf('/'));
        let url = `${base}/${name}.html`;
        xhr.open('GET', url);
        xhr.onload = function(e) {
            if (xhr.status === 200) {
                replacePage(name, url, xhr.responseText, pushState);
            }
            else {
                console.log(`failed to load ${url}`);
            }
        };
        xhr.onerror = function (e) {
            console.log('failed')
            conole.log(e)
        }
        xhr.send();
    }

    add_nav_header();

    function navBack(event) {
        if (event.state && event.state.title) {
            console.log(`load ${event.state.title}`)
            loadPage(event.state.title, false);
        } else {
            window.open(document.location);
        }
    }

    window.addEventListener('popstate', navBack);

    </script>
{% endblock body %}

