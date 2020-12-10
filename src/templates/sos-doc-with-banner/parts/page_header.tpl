

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
            <li><a href="https://vatlab.github.io/sos-docs/workflow.html#content">SoS Workflow</a> </li>
        </ul>
    </nav>
</div>


{% endmacro %}


{% macro js() %}

{% endmacro %}
