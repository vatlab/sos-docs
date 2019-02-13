

{% macro css() %}


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>


.edit-me {
    position: fixed;
    top: 0;
    right: 0px;
    z-index: 200;
}

</style>

{% endmacro %}

{% macro html() %}
<div class="edit-me">
    <button type="button" onclick="editme()" class="btn btn-primary">
   <i class="fa fa-edit fa-2x"></i></button>
</div>

{% endmacro %}


{% macro js() %}

<script>
function editme() {
    let filepath = window.location.pathname.slice(0, -5);
    let new_url = `http://128.135.144.117/hub/user-redirect/notebooks/${filepath}.ipynb`;
    window.open(new_url, target='_blank');
}
</script>

{% endmacro %}
