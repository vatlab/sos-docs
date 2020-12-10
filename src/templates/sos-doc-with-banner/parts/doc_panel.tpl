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

