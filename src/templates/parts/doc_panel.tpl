{# This template adds a button and a dropdown panel to a provided elem. It requires
  1. An empty DIV element.
  2. An <a> with an arrow.
  The IDs of these elements need to be passed.
#}

{% macro css(panel_id) %}

<style>

#{{ panel_id }} {
  display: none;
  left: 0;
  width: 100%;
  z-index: 100;
  background-color: black;
  color: white;
  padding-top: 20px;
}

#{{ panel_id }} a {
  color: white;
}

#{{ panel_id }} code {
  color: white;
  background: none;
}

#{{ panel_id }} li:hover {
  background: gray;
}

#{{ panel_id }} li a:hover {
  text-decoration: none;
}

#{{ panel_id }} ul {
  padding-left: 0px;
  list-style: none;
}

</style>

{% endmacro %}

{% macro html() %}

{% endmacro %}


{# This macro accepts the following parameters:
1. arrow_id: the id of the caret/arrow element. The script will add/remove
 fa-caret-down/up class when the panel is expanded/folded.
2. panel_id: the id of the panel element. The script will hide/show the panel
 with the click of the arrow.
3. toc_html: the URL that points to a HTML (or part of the HTML) that defines
 a div with panel_id. The content of the div will be appended to the div of
 the passed document.
#}

{% macro js(arrow_id, panel_id, toc_html) %}

<script>
function toggle_toc() {
  let item = document.getElementById('{{ arrow_id }}');
  if (!item) {
    return;
  }

  let expand = item.classList.contains('fa-caret-down');
  let panel = document.getElementById('{{ panel_id }}');
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

async function insert_toc() {
  let xhr = new XMLHttpRequest();
  let url = '{{ toc_html }}';
  xhr.open('GET', url);
  xhr.onload = function(e) {
    if (xhr.status === 200) {
      let nc = document.getElementById('{{ panel_id }}');
      nc.innerHTML = '';

      var root = document.createElement("div");
      root.innerHTML = xhr.responseText;

      // let us find notebook-container in the root
      let new_nc = root.querySelector('#{{ panel_id }}');

      while (new_nc.childNodes.length > 0) {
          nc.appendChild(new_nc.childNodes[0]);
      }
    } else {
      console.log(`failed to load ${url}`);
    }
  };
  xhr.send();
}

insert_toc();

</script>
{% endmacro %}
