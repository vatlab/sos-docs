

{% macro css() %}


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

</style>

{% endmacro %}

{% macro html() %}

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
        </div>
    </nav>
</div>


{% endmacro %}


{% macro js() %}

{% endmacro %}
