

{% macro css() %}

<style>

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

{% endmacro %}



{% macro js() %}

<script src="../../js/docs.js"></script>
<script>


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

{% endmacro %}
