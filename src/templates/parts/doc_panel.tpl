{# This template adds a button and a dropdown panel to a provided elem. It requires 
  1. An empty DIV element with id toc_panel
  2. An <a> with an arrow.
#}

{% macro css() %}

<style>

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

</style>
{% endmacro %}

{% macro html() %}

{% endmacro %}

{% macro js() %}


<script src="https://cdnjs.cloudflare.com/ajax/libs/tocbot/4.4.2/tocbot.min.js"></script>

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
{% endmacro %}
