

{% macro css() %}


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>

.search-box {
    left: 10px;
    z-index: 200;
    position: absolute;
    top: 50%;
    transform: translate(0%, -50%);
}

.search-box input {
    background-color: white;
    border-color: transparent;
    font-size: 14px;
}


</style>

{% endmacro %}

{% macro html() %}
<div class="search-box" id="search_toc">
   <input type="text" class="form-conrol" id="search_toc_input" placeholder="Search"
   oninput="handleSearchToc()">
</div>

{% endmacro %}


{% macro js() %}

<script>

function addSearchBox() {
    let nav = document.getElementById('navigation');
    let searchBox = document.getElementById('search_toc');
    nav.insertBefore(searchBox, nav.firstChild);
}

function handleSearchToc() {
    let sb = document.getElementById('search_toc_input');
    if (sb.value) {
        /* display all toc */
        let toc_items = document.getElementsByClassName('toc-item');
        for (let i = 0; i < toc_items.length; ++i) {
            let fulltitle = toc_items[i].getAttribute('data-title');
            toc_items[i].style.display = (fulltitle && fulltitle.includes(sb.value.toLowerCase())) ? 'block' : 'none';
        }
    } else {
        /* display all toc */
        let toc_items = document.getElementsByClassName('toc-item');
        for (let i = 0; i < toc_items.length; ++i) {
            toc_items[i].style.display = 'block';
        }
    }
}

addSearchBox()

</script>

{% endmacro %}
