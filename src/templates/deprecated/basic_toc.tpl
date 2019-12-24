{% extends 'basic.tpl' %}


{% block body %}
<body>
  <div class="row-fluid">
    <div class="col-xs-12 col-sm-4 col-md-3">
      <div id="toc">
      </div><!--/.well -->
    </div><!--/span-->
    <div class="col-xs-12 col-sm-8 col-md-9">
      {{ super() | replace('<body>', '') | replace('</body>', '') | replace('class="container"', 'class="notebook-container"')}}
    </div>
  </div>
  <script>
  $("#toc").detach().appendTo("#side_toc");
  </script>
</body>
{% endblock body %}

