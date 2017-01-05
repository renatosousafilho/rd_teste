// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .

$(document).ready(function(){
    $("#kind-combobox").on("change", function(){
        selected = $(this).val();
        if (selected=="combobox") {
            $("#option-wrapper").show();
        }
    });


    var i_id = 1;
    $("#add-option").on('click', function(){
       var new_input = $("#option-1").clone();
       field_id = 'option-' + ++i_id;

       new_input.attr("id", field_id);
       $(".option-container").append(new_input);
       $("#"+field_id).find('label').attr('for', 'text-'+field_id);
       $("#"+field_id).find('input').attr('id', 'text-'+field_id);
       $("#"+field_id).find('input').val("")
       $("#"+field_id).find('label').text("Opção"+i_id);
    });

});

$(function(){ $(document).foundation(); });
