

{% macro css() %}

<style>

.toc-container {
    margin-top: 80px;
    max-height: calc(100% - 140px);
    box: 0px;
    margin-left: 0px;
}

.toc-wrapper {
    overflow-y: scroll;
}

#toc ul.toc-list.nav.nav-list {
    padding-left: 5px;
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



/*
.nav > li > a:hover {
    background-color: #7b7b7b  !important;
    color: white !important;
}
*/

.toc-container .nav > li > a {
    padding-top: 5px;
    padding-bottom: 5px;
}


.toc-header-2 {
   padding-top: 20px;
   padding-bottom: 10px;
   font-size: 200%;
   margin-left: -5px;
   font-weight: 700;
   background: #337ab7;
}

.toc-header-2 > a {
    color: white;
    padding-left: 5px;
}

.nav > li.toc-header-2 > a:hover, .nav > li.toc-header-2 > a:focus {
    text-decoration: none;
    background-color: #337ab7;
    color: white;
}

.toc-header-3 {
   padding-top: 6px;
   padding-bottom: 6px;
   font-size: 150%;
   padding-left: 5px;
   font-weight: 400;
}

.toc-item > a, .toc-header-2, .toc-header-3 {
  font-family: "Source Sans Pro", sans-serif;
}

.toc-header-3 {
  color: #126dce;
}

.nav-links {
    margin: 20px;
    margin-top: 40px;
    background-color: #f1f1f1;
}

.nav-next, .nav-prev {
    font-size: 1.4em;
    padding: 20px;
    color: #000!important;
}

.nav-next {
    text-align: right;
    border-left: solid 10px white;
}

.nav-prev {
    text-align: left;
    border-right: solid 10px white;
}

.nav-next a, .nav-prev a {
    text-decoration: none;
    text-transform: uppercase;
}

div.nav-next a:hover, div.nav-prev a:hover {
    color: #337ab7;
}

</style>

{% endmacro %}



{% macro js(header_list, notebook_id) %}


<script>

function add_nav_header() {
    let url = window.location.pathname;
    let filename = url.substring(url.lastIndexOf('/')+1);

    let header = document.getElementsByClassName('toc-header');
    if (!header) {
        return;
    }
    let beforetoc = document.getElementsByClassName('toc-before');
    let aftertoc = document.getElementsByClassName('toc-after');
    let toc = document.getElementById('toc');

    let idx = {{ header_list }}.findIndex(item => item.name == filename.replace(/\.[^/.]+$/, ""));

    let prev_link = ''
    let next_link = ''
    let prev_nav = ''
    let next_nav = ''

    for (let i = idx - 1; i > 0; --i) {
        if (!{{header_list}}[i].header) {
            prev_link = `<button title="{{ '${' }}{{ header_list }}[i].title}" onclick="loadPage('{{ '${' }}{{ header_list }}[i].name}')" ><i class="fa fa-arrow-circle-left nav-left"></i></button>`;
            prev_nav = `<a href="javascript:loadPage('{{ '${' }}{{ header_list }}[i].name}')" ><i class="fa fa-arrow-left"></i>  &nbsp;   {{ '${' }}{{ header_list }}[i].title}</a>`;
            break;
        }
    }
    for (let i = idx + 1; i < {{ header_list}}.length; ++i) {
        if (!{{header_list}}[i].header) {
            next_link = `<button title="{{ '${' }}{{ header_list }}[i].title}" onclick="loadPage('{{ '${' }}{{ header_list }}[i].name}')" ><i class="fa fa-arrow-circle-right nav-right"></i></button>`;
            next_nav = `<a href="javascript:loadPage('{{ '${' }}{{ header_list }}[i].name}')" >{{ '${' }}{{ header_list }}[i].title}  &nbsp; <i class="fa fa-arrow-right"></i></a>`;
            break;
        }
    }

    header[0].outerHTML = `
        <div class="toc-header">
            <div class="row">
                <div class="nav-home">
                    <a href="https://vatlab.github.io/sos-docs/"><i class="fa fa-home"></i></a>
                </div>
                <div class="nav-buttons">
                        ${prev_link}
                        ${next_link}
                </div>
            </div>
        </div>
    `
    pre_elements = '<div class="toc-before"><ul class="toc-list nav nav-list">';
    for (let i = 0; i < idx; ++i) {
        if ( {{header_list}}[i].header === 2) {
            let link = {{header_list}}[i].title === "SoS Notebook" ? "https://github.com/vatlab/sos-notebook" : "https://github.com/vatlab/sos";
            pre_elements += `<li data-title="${ {{ header_list}}[i].title }" class="toc-item toc-header-${ {{header_list}}[i].header }"><a href="${link}">${ {{ header_list}}[i].title }</a></li>`
        } else if ( {{header_list}}[i].header == 3) {
            pre_elements += `<li data-title="${ {{ header_list}}[i].title }" class="toc-item toc-header-${ {{header_list}}[i].header }">${ {{ header_list}}[i].title }</li>`
        } else {
            pre_elements += `<li data-title="${ {{ header_list}}[i].fulltitle }" class="toc-item"><a href="javascript:loadPage('{{ '${' }}{{ header_list }}[i].name}');">${ {{header_list}}[i].title}</a></li>`;
        }
    }

    pre_elements += '</ul></div>';
    beforetoc[0].outerHTML = pre_elements;

    post_elements = '<div class="toc-after"><ul class="toc-list nav nav-list">';
    for (let i = idx + 1; i < {{header_list}}.length; ++i) {
        if ( {{header_list}}[i].header === 2) {
            let link = {{header_list}}[i].title === "SoS Notebook" ? "https://github.com/vatlab/sos-notebook" : "https://github.com/vatlab/sos";
            post_elements += `<li data-title="${ {{ header_list}}[i].title }" class="toc-item toc-header-${ {{header_list}}[i].header }"><a href="${link}">${ {{ header_list}}[i].title }</a></li>`
        } else if ( {{header_list}}[i].header == 3) {
            post_elements += `<li data-title="${ {{ header_list}}[i].title }" class="toc-item toc-header-${ {{header_list}}[i].header }">${ {{ header_list}}[i].title }</li>`
        } else {
            post_elements += `<li data-title="${ {{ header_list}}[i].fulltitle }" class="toc-item"><a href="javascript:loadPage('{{ '${' }}{{ header_list }}[i].name}');">${ {{header_list}}[i].title}</a></li>`;
        }
    }
    post_elements += '</ul></div>';
    aftertoc[0].outerHTML = post_elements;

    toc.scrollIntoView();

    if (next_nav) {
        /* find notebook */
        let notebook = document.getElementById('{{ notebook_id }}');

        let nav_next = document.createElement('div');
        nav_next.innerHTML = `
        <div class='row nav-links'>
            <div class="col-xs-6 col-sm-6 col-md-6 nav-prev">
             ${prev_nav}
            </div>
            <div class="col-xs-6 col-sm-6 col-md-6 nav-next">
                ${next_nav}
            </div>
        </div>
        `;
        notebook.appendChild(nav_next);
    }
}

function replacePage(title, url, newdoc, pushState) {
    window.aa = newdoc;
    // step 1, find existing cells
    let nc = document.getElementById('{{ notebook_id}}');
    nc.innerHTML = '';
    var root = document.createElement("div");
    root.innerHTML = newdoc;
    // let us find notebook-container in the root
    let new_nc = root.querySelector('.{{ notebook_id}}');

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
    fixIDsForToc();
    tocbot.refresh();
    // CM
    if (typeof applySoSMode === "function") {
        applySoSMode();
    }
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
    }
    xhr.send();
}

add_nav_header();

function navBack(event) {
    if (event.state && event.state.title) {
        console.log(`load ${event.state.title}`)
        loadPage(event.state.title, false);
    }
    // else {
    //    window.open(document.location);
    // }
    //console.log(event)
    //console.log(`Location ${document.location}`)
}

window.addEventListener('popstate', navBack);

</script>

{% endmacro %}
