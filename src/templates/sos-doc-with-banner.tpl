{%  extends 'sos-doc' %}

{% import 'parts/doc_panel.tpl' as doc_panel %}
{% import 'parts/page_header.tpl' as page_header %}
{% import 'parts/toc_header.tpl' as toc_header %}

{% block html_head %}

{{ super() }}

{{ page_header.css() }}
{{ toc_header.css() }}
{{ doc_panel.css() }}

{% endblock html_head %}

{% block body %}

{{ page_header.html() }}

{{ super() }}

{{ doc_panel.js() }}
{{ toc_header.js() }}
    
{% endblock body %}

