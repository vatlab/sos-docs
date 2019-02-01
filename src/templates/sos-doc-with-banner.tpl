{%  extends 'sos-doc' %}


{% block html_head %}
<meta name="viewport" content="width=device-width, initial-scale=1">
{{ super() }}
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="../../css/testtab.css" rel="stylesheet">

<style>
h1::before, h2::before, h3::before, h4::before, h5::before, h6::before {
    display: block;
    content: " ";
    height: 80px;
    margin-top: -80px;
    visibility: hidden;
}

#toc {
    margin-top: 100px;
}
#toc_panel {
    display: none;
    left: 0;
    width: 100%;
    z-index: 100;
    background-color: black;
    color: white;
}

#toc_panel a {
    color: white;
}

#toc_panel code {
    color: white;
    background: black;
}

#toc_panel ul {
    padding-left: 0px;
    list-style: none;
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
                        <li><a href="scripts_in_sos.html">Inclusio of scripts</a></li>
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
    </script>
{% endblock body %}

