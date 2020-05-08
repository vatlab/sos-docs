

{% macro css() %}


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>


.edit-me {
    position: absolute;
    top: 50%;
    right: 10px;
    z-index: 200;
    top: 50%;
    transform: translate(0%, -50%);
}

.edit-me-hint {
    display: none;
    position: fixed;
    right: 0px;
    top: 40px;
    z-index: 10;
    width: 11em;
    background: black;
    color: white;
    padding: 1em;
}

.edit-me .btn-primary {
    background-color: transparent;
    border-color: transparent;
}

.edit-me .btn-primary:hover {
    border-color: white;
}

.edit-me:hover ~ .edit-me-hint {
    display: block;
}

</style>

{% endmacro %}

{% macro html() %}
<div class="edit-me" id="edit-me">
    <button type="button" onclick="editme()" class="btn btn-primary">
   <i class="fa fa-edit fa-2x"></i></button>
</div>

<div class="edit-me-hint">
<p>Edit this page on our live server and create a PR by running command <code>!create-pr</code> in the console panel</p>
</div>


{% endmacro %}


{% macro js() %}

<script>
function editme() {
    let filepath = window.location.pathname.slice(0, -5).replace('doc/', 'src/');
    let new_url = `http://sosworkflows.com:8000/hub/user-redirect/notebooks/${filepath}.ipynb`;
    window.open(new_url, target='_blank');
}

function addEditButton() {
    let nav = document.getElementById('navigation');
    let editButton = document.getElementById('edit-me');
    nav.appendChild(editButton);
}

addEditButton()

</script>

{% endmacro %}
