{%  extends 'sos-cm-toc' %}

{% import 'parts/hover_doc.tpl' as hover_doc %}

{% import 'parts/doc_panel.tpl' as doc_panel %}
{% import 'parts/page_header.tpl' as page_header %}
{% import 'parts/toc_nav.tpl' as toc_nav %}
{% import 'parts/edit_button.tpl' as edit_button %}
{% import 'parts/search_box.tpl' as search_box %}

{% import 'parts/toc.tpl' as toc %}

{% block html_head %}

{{ super() }}

{{ hover_doc.css() }}
{{ page_header.css() }}
{{ toc_nav.css() }}
{{ doc_panel.css('toc_panel') }}
{{ edit_button.css() }}
{{ search_box.css() }}

<link href="../../css/testtab.css" rel="stylesheet">

{% endblock html_head %}

{% block body %}

{# This HTML file adds a fixed header to the page. #}

{{ page_header.html() }}
{{ edit_button.html() }}
{{ search_box.html() }}

{{ hover_doc.js() }}
{{ super() }}

{{ edit_button.js() }}
{{ search_box.js() }}

{# We need to determine the master list. For sos documentation, the list
 is defined in ../../js/docs.js and we will need to decide which one to
 use according to the URL.
#}

<script src="../../js/docs.js"></script>
<script>
let url = window.location.pathname;
let dir = url.substring(url.lastIndexOf('/', url.lastIndexOf('/')-1)+1, url.lastIndexOf('/'));

</script>

{# The variable to use will be all_docs.
  1. name of the master list
  2. id of the notebook container.
#}
{{ toc_nav.js('guides', 'notebook-container') }}

{% endblock body %}


{% block toc %}
{{ toc.js(headers='h1, h2, h3', remove_only_top_header='false') }}
{% endblock toc %}
