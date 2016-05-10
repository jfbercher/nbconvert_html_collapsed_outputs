{%- extends 'full.tpl' -%}
{# This template preserves collapsed outputs after conversion to html.
Put it in your templates directory, see template_path in jupyter_nbconvert_config.json
Usage: jupyter nbconvert --template collapsed_outputs FILE.ipynb #}

{%- block header -%}
{{ super() }}


<script>
function collapseToggle(elt){
        var is_collapsed = $(elt).hasClass('fa-plus-square-o');
        if (is_collapsed == true) {
            $(elt).removeClass('fa-plus-square-o').addClass('fa-minus-square-o'); 
            $(elt).children().show()         
        }
        else{
         $(elt).addClass('fa-plus-square-o').removeClass('fa-minus-square-o');               
         $(elt).children().hide()
        }
    }
</script>


{%- endblock header -%}    

{% block output_group %}
{%- if cell.metadata.get('collapsed', True) -%}
<div id="collapsed" class="fa fa-plus-square-o" style="margin-left:102px;padding-top:5px" onclick="collapseToggle(this)" > 
<div class="output_wrapper" style="display:none;margin-left:-102px;">
{%- else -%}
<div class="output_wrapper" style="display:block;">
{%- endif -%}
<div class="output">
{{ super() }}
</div>
</div>
{%- if cell.metadata.get('collapsed', True) -%}
</div>
{%- endif -%}

{% endblock output_group %}
